
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">

  <?php include("class_lib.php"); ?>

  <?php
   session_start(); 

   $firstName =  $_SESSION["firstname"]; 
   $lastName = $_SESSION["lastname"]; 
   $username =  $_SESSION["username"]; 
   $password = $_SESSION["password"];

   
 
  
  ?>
  <title>Team Waterfall</title>
</head>

<body>

<p> Welcome: <?php echo $firstName . " " . $lastName; ?></p>

<form action ="index.php">

<input type ="submit" value = "Logout"> 
</form>

</body>
</html>
