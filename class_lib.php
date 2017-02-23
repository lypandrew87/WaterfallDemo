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
?>