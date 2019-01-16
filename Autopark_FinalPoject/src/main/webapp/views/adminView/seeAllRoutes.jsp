<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/23/18
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/views/commonView/header.jsp"%>

<div class="container">

    <h2><fmt:message key="admin.routes" bundle="${rb}"/></h2>
    <!--Search Form -->
    <form action="/RouteServlet" method="get" id="seachRouteForm" role="form">
        <input type="hidden" id="searchAction" name="searchAction" value="searchByName">
        <div class="form-group col-xs-5">
            <input type="text" name="routeName" id="routeName" class="form-control" required="true" placeholder=<fmt:message key="type.name.of.route" bundle="${rb}"/>/>
        </div>
        <button type="submit" class="btn btn-info">
            <span class="glyphicon glyphicon-search"></span> <fmt:message key="search.button" bundle="${rb}"/>
        </button>

    </form>

    <form action="/RouteServlet" method="post" id="routeForm" role="form" >
        <input type="hidden" id="idRoute" name="idRoute">
        <input type="hidden" id="action" name="action">
        <c:choose>
            <c:when test="${not empty routeList}">
                <table  class="table table-striped">
                    <thead>
                    <tr>
                        <td><fmt:message key="admin.add.route.routeID" bundle="${rb}"/>: </td>
                        <td><fmt:message key="admin.add.route.name" bundle="${rb}"/>: </td>
                        <td><fmt:message key="admin.add.driver.driverID" bundle="${rb}"/>: </td>
                        <td><fmt:message key="admin.add.driver.driverName" bundle="${rb}"/>: </td>
                        <td><fmt:message key="admin.add.bus.busID" bundle="${rb}"/>: </td>
                        <td><fmt:message key="admin.add.bus.model" bundle="${rb}"/>: </td>
                        <td><fmt:message key="admin.add.route.depatureCity" bundle="${rb}"/>: </td>
                        <td><fmt:message key="admin.add.route.arrivalTime" bundle="${rb}"/>: </td>
                        <td><fmt:message key="admin.add.route.duration" bundle="${rb}"/>: </td>
                        <td><fmt:message key="admin.add.route.depatureTime" bundle="${rb}"/></td>
                        <td><fmt:message key="admin.add.route.arrivalTime" bundle="${rb}"/></td>
                    </tr>
                    </thead>
                    <c:forEach var="route" items="${routeList}">
                        <c:set var="classSucess" value=""/>
                        <c:if test ="${idRoute == route.routeID}">
                            <c:set var="classSucess" value="info"/>
                        </c:if>
                        <tr class="${classSucess}">
                            <td>${route.routeID}</td>
                            <td>${route.routeName}</td>
                            <td>${route.theDriver.driverID}</td>
                            <td>${route.theDriver.driverName}</td>
                            <td>${route.theBus.busID}</td>
                            <td>${route.theBus.busModel}</td>
                            <td>${route.cityOfDeparture}</td>
                            <td>${route.cityOfArrival}</td>
                            <td>${route.routeDuration}</td>
                            <td>${route.departureTime}</td>
                            <td>${route.arrivalTime}</td>

                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <br>
                <div class="alert alert-info">
                    <fmt:message key="no.route.found" bundle="${rb}"/>
                </div>
            </c:otherwise>
        </c:choose>
    </form>
    <br>
    <a href="addNewRoute.jsp"><button type="submit" class="btn btn-primary btn-md"><fmt:message key="admin.add.route" bundle="${rb}"/></button></a>
    <a href="editRoute.jsp"><button type="submit" class="btn btn-primary btn-md"><fmt:message key="admin.edit.route" bundle="${rb}"/></button></a>
    <a href="deleteRoute.jsp"><button type="submit" class="btn btn-secondary btn-md"><fmt:message key="admin.delete.route" bundle="${rb}"/></button></a>
    <br>
    <br>
    <a href="adminMainPage.jsp"><button type="submit" class="btn btn-secondary btn-md"><fmt:message key="back.to.main.page" bundle="${rb}"/></button></a>

    <br>
    <br>
    <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
        <button type="submit" class="btn btn-success btn-md"><fmt:message key="logout.button" bundle="${rb}"/></button>
    </form>

</div>

    <%@include file="/views/commonView/footer.jsp"%>

