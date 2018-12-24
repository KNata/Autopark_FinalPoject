<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/23/18
  Time: 4:32 PM
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
    <h1>Route Management</h1>
    <h2>
        <a href="/new">Add New Route</a>
        &nbsp;&nbsp;&nbsp;
        <a href="/list">List All Route</a>

    </h2>
</center>
<div align="center">
    <c:if test="${route != null}">
    <form action="update" method="post">
        </c:if>
        <c:if test="${route == null}">
        <form action="insert" method="post">
            </c:if>
            <table border="1" cellpadding="5">
                <caption>
                    <h2>
                        <c:if test="${route != null}">
                            Edit Route
                        </c:if>
                        <c:if test="${route == null}">
                            Add New Route
                        </c:if>
                    </h2>
                </caption>
                <tr>
                    <th>Route ID: </th>
                    <td>
                        <input type="text" name="routeID" size="45"
                               value="<c:out value='${route.routeID}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Route name: </th>
                    <td>
                        <input type="text" name="routeName" size="45"
                               value="<c:out value='${route.routeName}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Driver ID: </th>
                    <td>
                        <input type="text" name="driverID" size="45"
                               value="<c:out value='${route.driverID}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Bus ID: </th>
                    <td>
                        <input type="text" name="busID" size="45"
                               value="<c:out value='${route.busID}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>City of departure </th>
                    <td>
                        <input type="text" name="cityOfDeparture" size="45"
                               value="<c:out value='${route.cityOfDeparture}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>City of arrival </th>
                    <td>
                        <input type="text" name="cityOfArrival" size="45"
                               value="<c:out value='${route.cityOfArrival}' />"
                        />
                    </td>
                </tr>
                <tr>
                <tr>
                    <th>Route duration </th>
                    <td>
                        <input type="text" name="routeDuration" size="45"
                               value="<c:out value='${route.routeDuration}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Time of departure </th>
                    <td>
                        <input type="text" name="timeOfDeparture" size="45"
                               value="<c:out value='${route.timeOfDeparture}' />"
                        />
                    </td>
                </tr>
                <tr>
                <tr>
                    <th>Time of arrival </th>
                    <td>
                        <input type="text" name="timeOfArrival" size="45"
                               value="<c:out value='${route.timeOfArrival}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Save" />
                    </td>
                </tr>
            </table>
        </form>
</div>
</body>
</html>
