
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">

  <?php include("class_lib.php"); ?>

  <?php
   session_start(); 
   $username =  $_SESSION["username"]; 
   $password = $_SESSION["password"]; 
 
  
  ?>
  <title>Team Waterfall</title>
</head>

<body>

<p> Welcome: <?php echo $username; ?></p>



</body>
</html>
