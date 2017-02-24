

<?php 

 session_start();


//This means that there was an incorrect password
if(isset($_POST['uError'])){


?>
<p  style = "color: red"> This username has already been used </p>

<?php 
}

?>



<form method="post" action = "addNewAccount.php">
  First Name:<br>
  <input type="text" name="firstname" ><br>
  Last Name:<br>
  <input type="text" name="lastname" ><br><br>
   Username:<br>
  <input type="text" name="username" ><br>
  Password:<br>
  <input type="password" name="password" ><br><br>
	<input type="submit" value="Submit">
  <input type="reset">
</form>