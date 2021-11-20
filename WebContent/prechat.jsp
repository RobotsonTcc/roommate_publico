<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page import="com.roomate.controller.common" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=common.url%>css/styles.css">
        <script type="text/javascript" src="<%=common.url%>js/check.js"></script>
        <title>The Chat Room</title>
    </head>
    <body>
        <div class="middle" id="result-data">
            <form autocomplete="off">

            <table>
                <tr height="80px">
                    <td>Nome:</td>
                    <td><input type="text" id="nome" class="textbox" autocomplete="off"></td>
                </tr>
                <tr height="20px">
                    <td>Email:</td>
                    <td><input type="email" id="email" class="textbox"></td>
                </tr>
                <tr>
                    <td><input type="button" value="Go" class="circle" onclick="startChatting();"></td>
                    <td><div id="icon-load"></div></td>
                </tr>
            </table>
            </form>
        </div>

    </body>
</html>