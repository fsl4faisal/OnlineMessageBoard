<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message Post</title>
<style>
.error {
	color: #ff0000;
	font-weight: bold;
}
.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body>
	<form:form method="post" modelAttribute="message">
	<form:errors path="*" cssClass="errorblock" element="div" />
		<table>
			<tr>
				<td>Title</td>
				<td><form:input path="title" /></td>
				<td><form:errors path="title" /></td>
			</tr>
			<tr>
				<td>Body</td>
				<td><form:textarea path="body" /></td>
				<td><form:errors path="body" /></td>
			</tr>
			
			<tr>
				<td>Author</td>
				<td><form:input path="author" /></td>
				<td><form:errors path="author" /></td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="Post" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>