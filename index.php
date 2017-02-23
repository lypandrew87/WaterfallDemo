<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">

	<?php include("class_lib.php"); ?>

	<?php

	 if(!isset($_SESSION)) 
    { 

        session_start(); 
    } 
	$mysqli = get_connection(); 
	$query  = "SELECT * FROM scrumboard "; 
 	
 	?>
	<title>Team Waterfall</title>
</head>

<body>



<form method="post" action = "class_lib.php">
  First name:<br>
  <input type="text" name="username" ><br>
  Last name:<br>
  <input type="text" name="password" ><br><br>

  <input type="submit" value="Submit">
  <input type="reset">
</form>
	



</body>
</html>
