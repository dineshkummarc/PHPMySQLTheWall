<?php
require_once('connection.php');
session_start();

//------------Begin handling of login and registration process-------//
	//  If Registration action initiated then call register users function.
	if(isset($_POST['action']) && $_POST['action'] == 'register'){
		register_user($_POST); //use the ACTUAL post
	}
	// If Login action initiated then call login users function. 
	elseif(isset($_POST['action']) && $_POST['action'] == 'login'){
		login_user($_POST);
	}
	//malicious navigation to process.php or someone is trying to log off
	elseif(isset($_POST['action']) && $_POST['action'] == 'message'){
// User posts a message; stored in DB and redirected. 
	$sql = "INSERT INTO messages (user_id, message, created_at, updated_at) VALUES ('{$_SESSION['currentUser']['id']}', '{$_POST['message']}', NOW(), NOW())";

	run_mysql_query($sql);

	header("Location: theWall.php");
	}
//------------LOGIN/REGISTRATION FUNCTIONS AND VALIDATIONS------------------//
	function register_user($post){ //just a parameter called post
	//---------- begin field validation checks ---------------//
		$_SESSION['errors'] = array();

		if(empty($post['first_name'])){
			$_SESSION['errors'][] = "First name can't be blank";
		}

		if(empty($post['last_name'])){
			$_SESSION['errors'][] = "Last name can't be blank";
		}

		if(empty($post['password'])){
			$_SESSION['errors'][] = "Password field is required!";
		}

		if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
			$_SESSION['errors'][] = "Please use a valid email address";
		}
		//---------- end of validation checks ---------------//

		if(count($_SESSION['errors']) > 0 ){ //if there are any errors{
			header("Location: index.php");
			die();
		}
		else{
			$query = "INSERT INTO users (first_name, last_name, password, email, created_at, updated_at) 
					VALUES('{$post['first_name']}', '{$post['last_name']}', '{$post['password']}', '{$post['email']}', NOW(), NOW())";
			
			run_mysql_query($query);
			
			$_SESSION['success_message'] = "User successfully created";
			
			header("Location: theWall.php");
			die();
		}
	}

	function login_user($post){ //just a parameter called post
		
		$query = "SELECT * FROM users WHERE users.password = '{$post['password']}' AND users.email = '{$post['email']}'";
		
		$user = fetch_record($query);  
		
		if($user){
			$_SESSION['currentUser'] = $user;
			header("Location:  theWall.php");
		}
		else{
			$_SESSION['errors'][] = "Can't find a user with those credentitals";
			header("Location:  index.php");
			die();
		}
	}
//-------------START OF COMMENT INSERT INTO DATABASE------------------//
if(isset($_POST['action']) && $_POST['action'] == 'comment'){

	$cmt = "INSERT INTO comments (comment, created_at, updated_at, user_id, message_id) 
		VALUES ('{$_POST['comment']}', NOW(), NOW(), '{$_SESSION['currentUser']['id']}', '{$_POST['id']}')";

	run_mysql_query($cmt);
	header("Location: theWall.php");
}
?>







