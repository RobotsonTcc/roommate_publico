<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.roomate.controller.common"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<%
	String uname = (String) session.getAttribute("name");
%>

<head>
<link rel="stylesheet" type="text/css"
	href="<%=common.url%>css/styles.css">
<script type="text/javascript" src="<%=common.url%>js/check.js"></script>
<title>The Chat Room</title>
<script>
	setInterval(reloadData, 3000);
</script>
</head>

<body>
	<p id="result"></p>
	Welcome,
	<%=uname%>
	<div class="logout-div" align="right">
		<a href="logout.jsp" class="logout-chat">Logout</a>
	</div>
	<div id="list">
		<div id="content"></div>
		<input style="display: none" type="text" id="u" value="<%=uname%>">
		<textarea id='h' style="width: 100%; height: 10%;"></textarea>
		<input type="button" value="send" onclick="addText()" />
	</div>
</body>


</html>