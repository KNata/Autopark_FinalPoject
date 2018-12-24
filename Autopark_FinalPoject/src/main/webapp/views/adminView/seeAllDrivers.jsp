<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Books Store Application</title>
</head>
<body>
<center>
    <h1>Drivers Management</h1>
    <h2>
        <a href="/new">Add New Driver</a>
        &nbsp;&nbsp;&nbsp;
        <a href="/list">Full list of Drivers</a>

    </h2>
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
                <td><c:out value="${driver.driverID}" /></td>
                <td><c:out value="${driver.driverName}" /></td>
                <td>
                    <a href="/edit?id=<c:out value='${driver.driverID}' />">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/delete?id=<c:out value='${driver.driverID}' />">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>