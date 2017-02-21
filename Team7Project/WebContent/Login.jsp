<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>Log In Page</title>
<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/style.css">

<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
<%customer.setLoggedIn(false); %>

<h1 id = "login-title" >Log In</h1>
</head>
<body>
<div id = "login">
<form method="post" action="Login_action.jsp" name="Login"><b>Username: </b><input name="username" value=""><br>
<br><b>Password: </b><input type="password" name="password" value=""><br>
<br>
<input style = "color: blue; " name="Login" value="Login" type="submit">&nbsp;&nbsp;&nbsp; <input
style = "color: blue; " type="reset"><br>

<input type="radio" name="type"checked="checked" value="User">User
<input type="radio" name="type" value="Admin">Admin<br>

</form>
</div>
</body>
</html>