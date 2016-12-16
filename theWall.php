<?php
	require_once('connection.php');
	session_start();
//-------------This is to retrieve messages from the database-------------//
	$sql = "SELECT * FROM messages";
	$messageArray = fetch_all($sql);
	$commentArray = array();
?>

<!DOCTYPE html>
<html>
<head>
	<title>theWall</title>
	<style type="text/css">
		.msg{
        outline: 1px dotted red;
        padding: 10px;
    }
    	.cmt{
    		outline: 1px dotted blue;
    		padding: 10px;
    		color: blue;
    	}
	</style>
</head>
<body>
	<div id="header">
	<h1>CodingDojo Wall</h1>
	<h5> Welcome</h5>
	<h5 href="#">Log Off</h5>
	<div id="post">
		<form id="message" action="process.php" method="post">
			<input type="hidden" name="action" value="message"/>
			<textarea name="message" class="messageClass" cols="60" rows= "5"></textarea>
			<input type="submit" value="Post a Message"/>
		</form>
	</div>

<!-- Take the message array and display them as one row that contains the message.   -->
<?php
	foreach($messageArray as $message){
?>
		<div class="msg">
			<h3>Message: <?= $message['message'] ?></h3>
			<form id="comments" action="process.php" method="post">
				<input type="hidden" name="action" value="comment">
				<input type="hidden" name="id" value="<?= $message['id'] ?>">
				<textarea name="comment" class="commentClass" cols="50" rows='5'></textarea>
				<input type="submit" value="Post a Comment"/>
			</form>
		</div>
<?php
		$sql = "SELECT * FROM comments
			WHERE message_id = '{$message['id']}';";
		$commentArray = fetch_all($sql);
		foreach($commentArray as $comment){
?>
			<div class="cmt">
				<p>Comment: <?= $comment['comment'] ?></p>
			</div>


<?php
		}
	}
?>
</body>
</html>
