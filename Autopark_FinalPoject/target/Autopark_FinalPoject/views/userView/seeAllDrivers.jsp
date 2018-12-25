<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="Model.Driver"%>

<html>
<head>
    <title>Books Store Application</title>
</head>
<body>
<form action="DriverServlet" method="post">
<center>
    <h1>Drivers Management</h1>
</center>
<div align="center">
    <table border="1" cellpadding="2">
        <caption><h2>List of Drivers</h2></caption>

        <tr>
            <th>Driver ID</th>
            <th>Driver's name</th>

        </tr>
        <c:forEach var="driver" items="${driverList}">
            <tr>
                <td><c:out value="${driver.getDriverID()}" /></td>
                <td><c:out value="${driver.getDriverName()}" /></td>
                <td>
                    <a href="/edit?id=<c:out value='${driver.driverID}' />">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/delete?id=<c:out value='${driver.driverID}' />">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <input type="submit" name = "back" value="Back">
</div>
</form>>
</body>
</html>