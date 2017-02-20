

<!DOCTYPE html>

<?php
error_reporting(E_ALL ^ E_DEPRECATED);

$username = "root";
$password = "";
$hostname = "localhost";

$dbhandle = mysql_connect($hostname, $username, $password)
    or die("Unable to connect to MySQL");

$selected = mysql_select_db("amlyp",$dbhandle)
    or die("Could not selected db2");
	
	
$result = mysql_query('SELECT * from patienttable  ');


$row = mysql_fetch_array($result);



?>
<html>
<head>
	<title>PHP Starter Application</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="style.css" />
</head>
<body>
	<table>
		<tr>
			<td style='width: 30%;'>
				<img class = 'newappIcon' src='images/logo.jpg'>
			</td>
			<td>
				<h1 id = "message"><?php echo "Watson Care"; ?></h1>
	<form action="action_page.php" method ="get" >
  <div class="imgcontainer">
  </div>

  <div class="container">
    <label><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="user" required>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pass" required>
<h4 style = "color:red" >Invalid Username or Password</h4>
    <button type="submit">Login</button>
  </div>

  <div class="container" style="background-color:#f1f1f1">
  </div>
</form>
			</td>
		</tr>
	</table>
</body>
</html>
