

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
	
session_start();
$user = $_SESSION['varname'];
$result = mysql_query("SELECT * from patienttable WHERE Username ='".$user."'");
$row = mysql_fetch_row($result);
?>
<html>
<head>
	<title>PHP Starter Application</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="style.css" />
<script src="js/app.js"></script>
</head>
<body>

<a href = "https://www.facebook.com/"><img width = "100px" height = "100px"   src="images/facebook.png" alt="Mountain View" "> </a>
<a href = "https://www.twitter.com/"><img width = "100px" height = "100px"   src="images/twitter.png" alt="Mountain View" "> </a>
<a href = "https://www.tumblr.com/"><img width = "100px" height = "100px"   src="images/tumblr.png" alt="Mountain View" "> </a>
	
	<table>
		<tr>
			<td style='width: 30%;'>
				<img id = "rob"  width = "300px" height = "300px" class = 'newappIcon' src='images/<?php echo $row[4]; ?>'>
				
			</td>
			<td>


<h1>Welcome: <?php echo $row[0]; ?><br></br>
Did you take your medication today? You should have taken <?php echo $row[3] .  " " . $row[2] ?>

</h1>
<br></br>
<h1>
How are you feeling today? 
<br></br>
<script>
window.open('http://www.molottery.com/','popupad','width=300,height=500')


</script>

<p id="demo"></p>

<script> 

responsiveVoice.speak("hello world", "UK English Male", {pitch: 2});</script>



<button onclick="goodFunction()" type="button">Pretty Good!</button>
<button onclick="okFunction()" type="button">Okay.</button>
<button onclick="notwellFunction()" type="button">Not Well :(</button>
<br></br>
<form action ="checkrecords.php" > 
<button style ="background-color: Red" type="submit">Check Medical Records</button>

</form>
</h1>
			</td>
		</tr>
	</table>
	<br><center>
	<a href="index.php"> Logout </a>
	<br><br>
</body>
</html>
