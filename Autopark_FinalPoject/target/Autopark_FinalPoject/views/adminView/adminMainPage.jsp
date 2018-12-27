<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/19/18
  Time: 2:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

    <html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="AdminManagePage.css">


        <title>Admin Main Page</title>
    </head>
    <body>
    <h2> Welcome to Admin's page</h2>

        <a href="#" class="btn btn-danger btn-lg btn-block" role="button" aria-pressed="true">Pending Requests <span class="badge badge-light">4</span></a>

        <a href="seeAllDrivers.jsp" class="btn btn-info btn-lg btn-block" role="button" aria-pressed="true">See all Drivers</a>
        <a href="seeAllRoutes.jsp" class="btn btn-info btn-lg btn-block" role="button" aria-pressed="true">See all Routes</a>
        <a href="seeAllBuses.jsp" class="btn btn-info btn-lg btn-block" role="button" aria-pressed="true">See all Buses</a>
        <a href="allVisitors.jsp" class="btn btn-info btn-lg btn-block" role="button" aria-pressed="true">See all Users</a>
        <a href="addNewDriverPage.jsp" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add a new Driver</a>
        <a href="addNewRoute.jsp" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add a new Route</a>
        <a href="addNewBusPage.jsp" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add a new Bus</a>
        <a href="registerPage.jsp" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add a new User</a>

    </div>
    <br>
    <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
        <input type="submit" value="Logout" />
    </form>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
    </html>

