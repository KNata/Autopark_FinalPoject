<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/19/18
  Time: 2:12 AM
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
        <a href="/list">List All Buses</a>

    </h2>
</center>
<div align="center">
    <c:if test="${bus != null}">
    <form action="update" method="post">
        </c:if>
        <c:if test="${bus == null}">
        <form action="insert" method="post">
            </c:if>
            <table border="1" cellpadding="5">
                <caption>
                    <h2>
                        <c:if test="${bus != null}">
                            Edit Bus
                        </c:if>
                        <c:if test="${bus == null}">
                            Add New Bus
                        </c:if>
                    </h2>
                </caption>
                <tr>
                    <th>Bus ID: </th>
                    <td>
                        <input type="text" name="busID" size="45"
                               value="<c:out value='${bus.busID}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Bus model: </th>
                    <td>
                        <input type="text" name="busModel" size="45"
                               value="<c:out value='${bus.busTitle}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Max count passagers in bus: </th>
                    <td>
                        <input type="text" name="maxPassegers" size="45"
                               value="<c:out value='${bus.maxCountOfPassagers}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Miles: </th>
                    <td>
                        <input type="text" name="miles" size="45"
                               value="<c:out value='${bus.miles}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Was on service? </th>
                    <td>
                        <input type="text" name="maintance" size="45"
                               value="<c:out value='${bus.passedService}' />"
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