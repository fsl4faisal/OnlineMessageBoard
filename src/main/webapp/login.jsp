<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<c:if test="${not empty param.error}">
<font color="red">
Login error.<br />
Reason: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
</font>
</c:if>
	<form method="post" action="<c:url value="/j_spring_security_check"/>">
		<table>
			<tr>
				<td align="right">Username</td>
				<td><input type="text" name="j_username" /></td>
			</tr>
			<tr>
				<td align="right">Password</td>
				<td><input type="password" name="j_password" /></td>
			</tr>
			<tr>
				<td align="right">Remember me</td>
				<td><input type="checkbox" name="_spring_security_remember_me" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right"></td>
				<td><input type="submit" value="Login"/></td> 
				<td><input type="reset" value="Reset" /></td>
			</tr>
		</table>

	</form>
</body>
</html>