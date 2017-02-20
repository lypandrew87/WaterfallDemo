<!DOCTYPE html>

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
				<img class = 'newappIcon' src='images/logo.jpg'>
			</td>
			<td>
				<h1 id = "message"><?php echo "Create Account"; ?></h1>
	<form action="action_page_create.php" method ="get" >
  <div class="imgcontainer">
  </div>

  <div class="container">
    <label><b>Enter a Username</b></label>
    <input type="text" placeholder="Enter Username" name="user" required>

    <label><b>Enter a Password</b></label>
    <input type="password" placeholder="Enter Password" name="pass" required>
<label><b>Re-Enter Password</b></label>
    <input type="password" placeholder="Enter Password" name="confirmpass" required>

    <button type="submit">Create Account</button>
	
  </div>

  <div class="container" style="background-color:#f1f1f1">
  </div>
</form>



</form>
			</td>
		</tr>
	</table>
</body>
</html>
