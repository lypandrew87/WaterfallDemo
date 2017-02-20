

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

session_start();
$user = $_SESSION['varname'];
$result = mysql_query("SELECT * from patienttable WHERE Username ='".$user."'");
$row = mysql_fetch_row($result);
$data = mysql_query("SELECT * from `table 3` where `COL 4` = (SELECT PDE_ID from patienttable  WHERE Username ='".$user."')");

$row = mysql_fetch_array($data);


?>
	<link rel="stylesheet" href="style.css" />

<body>
<center><img src="images/doctor.png">
<h4>Information on most recent pharmacy visit</h4>
<table>
<th>User ID</th>
<td><?php echo  $row[3];?> </td>
</tr>
<tr>
<th>Perscription Transaction Code</th>
<td><?php echo  $row[0];?></td>
</tr><tr>
<th>Date of Perscription Fill (YYYYMMDD) </th>
<td><?php echo  $row[2];?></td>
</tr>
<tr>
<th>Number of Pills </th>
<td><?php echo  $row[4];?></td>
</tr>
<tr>
<th>Days Supply </th>
<td><?php echo  $row[5];?></td>
</tr>
<tr>
<th>Price you paid</th>
<td><?php echo  $row[6];?></td>
</tr>
<tr>
<th>Price of Drugs</th>
<td><?php echo  $row[7];?></td>
</tr>
</table>
<script>
window.open('http://www.addictinggames.com/','popupad','width=300,height=500')


</script>

<br><br>
<a href="profile.php"> Back To Home </a>

</body>
