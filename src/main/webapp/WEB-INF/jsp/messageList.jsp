<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message List</title>
</head>
<body>
<a href="<c:url value="/login.jsp" />">Login</a>
<a href="<c:url value="/j_spring_security_logout" />">Logout</a>
<br/>
	<c:forEach items="${messages}" var="message">
		<table border="1">
			<tr>
				<td>Id</td>
				<td>${message.id}</td>
			</tr>
			<tr>
				<td>Author</td>
				<td>${message.author}</td>
			</tr>
			<tr>
				<td>Title</td>
				<td>${message.title}</td>
			</tr>
			<tr>
				<td>Body</td>
				<td>${message.body}</td>
			</tr>
			<tr>
				<td colspan="2"><a href="messageDelete?messageId=${message.id}">Delete</a>
				</td>
			</tr>
		</table>
		<hr />
	</c:forEach>
	<a href="messagePost.htm">Post</a>
</body>
</html>