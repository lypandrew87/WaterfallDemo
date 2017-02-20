

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
	
	
$result = mysql_query('SELECT * from patienttable WHERE 1=1 ');

session_start()




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

  while ($row = mysql_fetch_row($result)) {

echo $row[0];
echo $row[1];  
    



if ($_GET["user"] == $row[0] && $_GET["pass"] == $row[1]){

$_SESSION['varname'] =  $_GET["user"];


header("Location: http://localhost/profile.php");
die(); 

}else{


}
}
header("Location: http://localhost/indexinvalid.php");
 ?>


</h1>
			</td>
		</tr>
	</table>
</body>
</html>
