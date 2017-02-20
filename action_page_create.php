

<!DOCTYPE html>

<?php
error_reporting(E_ALL ^ E_DEPRECATED);
session_start();

$username = "root";
$password = "";
$hostname = "localhost";

$dbhandle = mysql_connect($hostname, $username, $password)
    or die("Unable to connect to MySQL");

$selected = mysql_select_db("amlyp",$dbhandle)
    or die("Could not selected db2");
	
	
$result = mysql_query('SELECT * from patienttable WHERE 1=1 ');





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
			</td>
			<td>
		
<?php  
$name = $_GET["user"];
$pass = $_GET["pass"];




	   $sql = "INSERT INTO patienttable ".
      "(PDE_ID,Username, Password, Medication, Amount, Image) ".
     "VALUES ( 115163303,'".$name."','".$pass."', 'Pain Meds', 10, 'batman.jpg' )";

	  
	
	  
  mysql_select_db('amlyp');
   $retval = mysql_query( $sql, $dbhandle );
    
$_SESSION['varname'] =  $_GET["user"];


header("Location: http://localhost/profile.php");
 ?>


</h1>
			</td>
		</tr>
	</table>
</body>
</html>
