<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">

<?php

if(isset($_GET['uError'])){


?>
<p  style = "color: red"> Incorrect username or password. </p>

<?php 
}

?>


	<title>Team Waterfall</title>
</head>

<body>



<form method="post" action = "class_lib.php">
  Username:<br>
  <input type="text" name="username" ><br>
  Password:<br>
  <input type="password" name="password" ><br><br>

  <input type="submit" value="Submit">
  <input type="reset">
</form>

<br>
<form  action="createAccount.php">
    <button type="submit">Create Account</button>
</form>	



</body>
</html>
