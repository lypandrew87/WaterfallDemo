<?php

namespace phpUnitTutorial\Test;
use PHPUnit\Framework\TestCase;
use phpHandling;

class phpHandlingTest extends TestCase
{


	function testDatabaseConnection(){


		$phpHandling = new phpHandling();

		$this->assertNotNull(  $phpHandling->get_connection()); 


	}
	function testExecuteQuery(){




		$phpHandling = new phpHandling(); 


		$sql="Select firstName from users where username = 'amlyp'";
		$result = $phpHandling->execute_Query(  $phpHandling->get_connection(), $sql); 

		$row = mysqli_fetch_array($result);


		$expected = "Andrew"; 

		$this->assertEquals( $expected, $row[0]); 






	}

	function testCreateAccount(){

		$phpHandling = new phpHandling(); 
		$query = $phpHandling->createAccount($phpHandling->get_connection(), "John","Reed", "jreed27", "password");

		$sql="Select firstName from users where lastName = 'Reed'";
		$result = $phpHandling->execute_Query(  $phpHandling->get_connection(), $sql); 

		$row = mysqli_fetch_array($result);


		$expected = "John"; 

		$this->assertEquals( $expected, $row[0]); 





	}
	function testLogin(){

		$phpHandling = new phpHandling(); 
		$query = $phpHandling->login($phpHandling->get_connection(), "amlyp","password");



		$expected = True; 

		$this->assertEquals( $expected, $query); 





	}








}

?>