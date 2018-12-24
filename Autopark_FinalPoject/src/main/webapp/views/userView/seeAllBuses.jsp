<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/23/18
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Books Store Application</title>
</head>
<body>
<center>
    <h1>Bus Management</h1>
    <h2>
        <a href="/new">Add New Bus</a>
        &nbsp;&nbsp;&nbsp;
        <a href="/list">Full list of Buses</a>

    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Buses</h2></caption>
        <tr>
            <th>Bus ID</th>
            <th>Bus's model</th>
            <th>Max passagers</th>
            <th>Miles</th>
            <th>Passed Service</th>

        </tr>
        <c:forEach var="bus" items="${busList}">
            <tr>
                <td><c:out value="${bus.busID}" /></td>
                <td><c:out value="${bus.busModel}" /></td>
                <td><c:out value="${bus.maxPassegers}" /></td>
                <td><c:out value="${bus.miles}" /></td>
                <td><c:out value="${bus.maintance}" /></td>
                <td>
                    <a href="/edit?id=<c:out value='${bus.busID}' />">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/delete?id=<c:out value='${bus.busID}' />">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>