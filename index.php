<?php
require_once('connection.php');
session_start();

?>
<head>
<style type="text/css">
    body{
        padding-top: 20px;
    }
    .reg{
        /*outline: 1px dotted red;*/
        display: inline-block; 
        vertical-align:  top;
        margin-left: 20px;
        margin-right: 20px;
        border: 2px solid blue;
        padding: 30px;
    }
    input{
        display: inline-block;
        vertical-align: top;
    }
    .login{
        display: inline-block; 
        vertical-align:  top;
        border: 2px solid green;
        padding: 30px;
    }
    .button {
        margin-top: 20px;
    }
    p{
        display: inline-block;
        vertical-align: top;
        position: relative;
        top: -15px;
        margin-right: 10px;
    }
    .reg h3{
        color: blue;
    }
    .login h3{
        color: green;
    }
   .error{
        color: red;
    }
    .success{
        color: green;
    }

</style>
</head>
<body>

<?php
    if(isset($_SESSION['errors'])){
        foreach ($_SESSION['errors'] as $error) {
            echo "<p class='error'>{$error} </p>";
        }

        unset($_SESSION['errors']); //after using variables unset them (refresh page)
    }
    if(isset($_SESSION['success_message'])){
        echo "<p class='success'>{$_SESSION['success_message']} </p>";
        unset($_SESSION['success_message']);
    }
?>

<form class= "reg" method="post" action="process.php">
    <h3>Register</h5>
    <input type="hidden" name="action" value="register">
    </br><p>first name:</p>
    <input type="text" name="first_name">
    </br><p>last name:</p>
    <input type="text" name="last_name">
    </br><p>email:</p>
    <input type="text" name="email">
    </br><p>password:</p>
    <input type="password" name="password"></br>
    <input class="button" type="submit" value="Register HERE">
</form>

<form class= "login" method="post" action="process.php">
    <h3>Login</h5>
    <input type="hidden" name="action" value="login">
    </br><p>email:</p>
    <input type="text" name="email">
    </br><p>password:</p>
    <input type="password" name="password"></br>
    <input class="button" type="submit" value="Login">
</form>
</body>

