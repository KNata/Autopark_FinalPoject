<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/19/18
  Time: 2:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="index.css">
    <title>Hello, world!</title>
</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">About Autopark</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Routes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Buses</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Drivers</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>

    <center>
        <h1>Driver Management</h1>
        <h2>
            <a href="/addNewDriverPage">Add a new driver to Autopark</a>
            <h7><i>Please properly fill all text boxes</i></h7>
            &nbsp;&nbsp;&nbsp;
            <a href="/list">List All Drivers</a>

        </h2>
    </center>
    <div align="center">
        <c:if test="${driver != null}">
        <form action="update" method="post">
            </c:if>
            <c:if test="${driver == null}">
            <form action="insert" method="post">
                </c:if>
                <table border="1" cellpadding="5">
                    <caption>
                        <h2>
                            <c:if test="${driver != null}">
                                Edit Driver
                            </c:if>
                            <c:if test="${driver == null}">
                                Add New Driver
                            </c:if>
                        </h2>
                    </caption>
                    <tr>
                        <th>Driver ID: </th>
                        <td>
                            <input type="text" name="driverID" size="45"
                                   value="<c:out value='${driver.driverID}' />"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th>Driver Name: </th>
                        <td>
                            <input type="text" name="driverName" size="45"
                                   value="<c:out value='${driver.driverName}' />"
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
</div>>
</body>
</html>
