<?php 

//login
if(isset($_POST['username'] ,$_POST['password']) && !isset( $_POST['firstname'], $_POST['lastname'] ))
{


  login(get_connection(), $_POST['username'], $_POST['password']); 
} 

//Create User
if(isset($_POST['username'],  $_POST['password'],   $_POST['firstname'],  $_POST['lastname']))
{


$username = $_POST['username']; 

$sql= "SELECT * from  users WHERE username = '$username'"; 


$result = execute_Query(get_connection(), $sql); 

if(mysqli_num_rows($result)==1){


header("location:createAccount.php?uError=1");

}else{


	createAccount(get_connection(), $_POST['firstname'], $_POST['lastname'], $_POST['username'], $_POST['password']); 

}

} 

class phpHandling{




function createAccount($connection, $firstname, $lastname, $username, $password){



$sql="INSERT INTO users (firstName, lastName, username, password) 
  VALUES ('$firstname', '$lastname', '$username','$password')";


$result = $this->execute_Query($connection, $sql); 


// session_start();
	//$_SESSION["firstname"]=$firstname;
	//$_SESSION["lastname"]=$lastname;
	//$_SESSION["username"]=$username;
//	$_SESSION["password"]=$password;
//header("location:loginsuccessful.php");


}


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

function login($connection, $username, $password){

//Protect against SQL injection
$myusername = stripslashes($username);
$mypassword = stripslashes($password);

$sql="SELECT * FROM users WHERE username='$username' and password='$password'";


$result = $this->execute_Query($connection, $sql); 

return mysqli_num_rows($result)==1; 




}
}

?>