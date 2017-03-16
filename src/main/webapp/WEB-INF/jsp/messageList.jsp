<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message List</title>
</head>
<body>
	<h2>
		Welcome.!
		<security:authentication property="name" />
	</h2>
	<security:authentication property="authorities" var="authorities" />
	<ul>
		<c:forEach items="${authorities}" var="authority">
			<li>${authority.authority}</li>
		</c:forEach>
	</ul>
	<security:authorize ifAllGranted="ROLE_GUEST">
		<a href="<c:url value="/login.jsp" />">Login</a>
	</security:authorize>
	
	<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_USER">
		<a href="<c:url value="/j_spring_security_logout" />">Logout</a>
	</security:authorize>
	
	<br />
	
	<c:forEach items="${messages}" var="message">
		<table border="1">
			<tr>
				<td>Id</td>
				<td>${message.id}</td>
			</tr>
			<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_USER">
				<tr>
					<td>Author</td>
					<td>${message.author}</td>
				</tr>
			</security:authorize>
			<tr>
				<td>Title</td>
				<td>${message.title}</td>
			</tr>
			<tr>
				<td>Body</td>
				<td>${message.body}</td>
			</tr>
			<security:authorize ifAllGranted="ROLE_ADMIN">
				<tr>
					<td colspan="2">
					<a href="messageDelete?messageId=${message.id}">Delete</a></td>
				</tr>
			</security:authorize>
		</table>
		<hr />
	</c:forEach>
	<security:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
		<a href="messagePost.htm">Post</a>
	</security:authorize>
</body>
</html>