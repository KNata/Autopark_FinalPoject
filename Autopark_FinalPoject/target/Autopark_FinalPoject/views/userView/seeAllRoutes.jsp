<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/23/18
  Time: 4:39 PM
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
    <table border="1" cellpadding="9">
        <caption><h2>List of Buses</h2></caption>
        <tr>
            <th>Route ID</th>
            <th>Route name</th>
            <th>Driver Name</th>
            <th>Bus ID</th>
            <th>City of departure</th>
            <th>City of arrival</th>
            <th>Route duration</th>
            <th>Time of arrival</th>
            <th>Time of departure</th>
        </tr>
        <c:forEach var="route" items="${routeList}">
            <tr>
                <td><c:out value="${route.routeID}" /></td>
                <td><c:out value="${route.routeTitle}" /></td>
                <td><c:out value="${route.driverID}" /></td>
                <td><c:out value="${route.cityOfDeparture}" /></td>
                <td><c:out value="${route.cityOfArrival}" /></td>
                <td><c:out value="${route.routeDuration}" /></td>
                <td><c:out value="${route.arrivalTime}" /></td>
                <td><c:out value="${route.departureTime}" /></td>
                <td>
                    <a href="/edit?id=<c:out value='${route.routeID}' />">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/delete?id=<c:out value='${route.routeID}' />">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>