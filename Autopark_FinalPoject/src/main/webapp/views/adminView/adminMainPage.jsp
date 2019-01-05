<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/19/18
  Time: 2:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/views/commonView/header.jsp"%>

        <h3>Hi Admin, login successful.</h3>

        <a href="#" class="btn btn-danger btn-lg btn-block" role="button" aria-pressed="true">Pending Requests <span class="badge badge-light">4</span></a>

        <form action="${pageContext.request.contextPath}/DriverServlet" method="get">
            <button type="submit" class="btn btn-info">See All Drivers</button>
        </form>
        <form action="${pageContext.request.contextPath}/RouteServlet" method="get">
            <button type="submit" class="btn btn-info">See all Routes</button>
        </form>
        <form action="${pageContext.request.contextPath}/BusServlet" method="get">
            <button type="submit" class="btn btn-info">See all Buses</button>
        </form>
        <form action="${pageContext.request.contextPath}/VisitorServlet" method="get">
            <button type="submit" class="btn btn-info">See all Visitors</button>
        </form>
        <a href="addNewDriverPage.jsp" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add a new Driver</a>
        <a href="addNewRoute.jsp" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add a new Route</a>
        <a href="addNewBusPage.jsp" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add a new Bus</a>
        <a href="registerPage.jsp" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true">Add a new User</a>

    </div>
    <br>
    <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
        <button type="submit" class="btn btn-success btn-md">Logout</button>
    </form>

<form action="${pageContext.request.contextPath}/DriverServlet" method="get">
    <button type="submit" class="btn btn-success btn-md">SeeAllDrivers</button>
</form>

    <%@include file="/views/commonView/footer.jsp"%>


