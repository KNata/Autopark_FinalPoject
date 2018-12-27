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
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.min.js"></script>
</head>

<body>

<div class="container">
    <form action="/DriverServlet" method="post" role="form" data-toggle="validator" >
        <c:if test ="${empty action}">
            <c:set var="action" value="seeAllDrivers"/>
        </c:if>
    <h2>Drivers</h2>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of drivers</h2></caption>
        <tr>
            <th>Driver ID</th>
            <th>Driver Title</th>
        </tr>
        <c:forEach var="driver" items="${driverList}">
        <tr>
            <td><c:out value="${driver.getDriverID()}"/></td>
            <td><c:out value="${driver.getDriverName()}"/></td>
        </tr>
        </c:forEach>
    </table>
</div>
    </form>>
    <a href="adminMainPage.jsp"><input type="submit" value="Back to main page" /></a>
    <br>
    <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
        <input type="submit" value="Logout" />
    </form>

</div>
</body>
</html>