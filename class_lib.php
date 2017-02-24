<?php 
function get_connection() {
  $username = "root";
  $password = "";
  $hostname = "localhost";
  $database  = "amlyp"; 

  $mysqli  = mysqli_connect($hostname, $username, $password,$database );

  return $mysqli;
		

 
	}

function execute_Query($connection , $query){

  return $connection->query($query);



}



if(isset($_POST['username']))
{


	login(get_connection(), $_POST['username'], $_POST['password']); 
} 


function login($connection, $username, $password){

// To protect MySQL injection (more detail about MySQL injection)
$myusername = stripslashes($username);
$mypassword = stripslashes($password);

$sql="SELECT * FROM users WHERE username='$username' and password='$password'";


$result = execute_Query($connection, $sql); 

// Mysql_num_row is counting table row

// If result matched $myusername and $mypassword, table row must be 1 row
if(mysqli_num_rows($result)==1){

// Register $myusername, $mypassword and redirect to file "login_success.php"
	 session_start();
	$_SESSION["username"]=$username;
	$_SESSION["password"]=$password;

header("location:loginsuccessful.php");
}
else {

	echo '<script language="javascript">';
echo 'alert("message successfully sent")';
echo '</script>';
	header("location:index.php?uError=1");


}






}
?>