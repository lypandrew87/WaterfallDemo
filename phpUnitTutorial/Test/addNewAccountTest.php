<?php

namespace phpUnitTutorial\Test;
use PHPUnit\Framework\TestCase;
use addNewAccount;

class addNewAccountTest extends TestCase
{


	function testDatabaseConnection(){


		$addNewAccont = new addNewAccount();

		$this->assertNotNull(  $addNewAccont->get_connection()); 


	}
	function testExecuteQuery(){




		$addNewAccount = new addNewAccount(); 


		$sql="Select firstName from users where lastName = 'Lyp'";
		$result = $addNewAccount->execute_Query(  $addNewAccount->get_connection(), $sql); 

		$row = mysqli_fetch_array($result);


		$expected = "Andrew"; 

		$this->assertEquals( $expected, $row[0]); 






	}

	function testCreateAccount(){

		$addNewAccount = new addNewAccount(); 
		$query = $addNewAccount->createAccount($addNewAccount->get_connection(), "John","Reed", "jreed27", "password");

		$sql="Select firstName from users where lastName = 'Reed'";
		$result = $addNewAccount->execute_Query(  $addNewAccount->get_connection(), $sql); 

		$row = mysqli_fetch_array($result);


		$expected = "John"; 

		$this->assertEquals( $expected, $row[0]); 





	}








}