<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="registro" method="post">
		<input type="text" name="json" placeholder="Json"/>
		<input type="text" name="token" placeholder="Token"/>
		<input type="number" name="lmax" placeholder="limite maximo"/>
		<input type="number" name="lmin" placeholder="limite minimo"/>
		<input type="submit" value="ENVIAR">
	</form>

</body>
</html>