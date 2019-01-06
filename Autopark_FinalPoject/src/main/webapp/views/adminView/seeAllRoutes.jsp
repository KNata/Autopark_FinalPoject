<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/23/18
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/views/commonView/header.jsp"%>

<div class="container">

    <h2>Routes</h2>
    <!--Search Form -->
    <form action="/RouteServlet" method="get" id="seachRouteForm" role="form">
        <input type="hidden" id="searchAction" name="searchAction" value="searchByName">
        <div class="form-group col-xs-5">
            <input type="text" name="routeName" id="routeName" class="form-control" required="true" placeholder="Type the Name of the route"/>
        </div>
        <button type="submit" class="btn btn-info">
            <span class="glyphicon glyphicon-search"></span> Search
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
                        <td>Route ID: </td>
                        <td>Route name: </td>
                        <td>Driver ID: </td>
                        <td>Driver Name: </td>
                        <td>Bus ID: </td>
                        <td>Bus Model: </td>
                        <td>Route ID: </td>
                        <td>Route city of department: </td>
                        <td>Route city of arrival: </td>
                        <td>Route duration: </td>
                        <td>Route time of department</td>
                        <td>Route time of arrival</td>
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

                            <td><a href="#" id="remove"
                                   onclick="document.getElementById('action').value = 'remove';document.getElementById('idRoute').value = '${route.routeID}';

                                           document.getElementById('routeForm').submit();">
                                <span class="glyphicon glyphicon-trash"/>
                            </a>

                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <br>
                <div class="alert alert-info">
                    No route found matching your search criteria
                </div>
            </c:otherwise>
        </c:choose>
    </form>
    <br>
    <a href="addNewRoute.jsp"><button type="submit" class="btn btn-primary btn-md">New route</button></a>
    <a href="adminMainPage.jsp"><button type="submit" class="btn btn-secondary btn-md">Back to main page</button></a>
    <br>
    <br>

    <form action="/RouteServlet" method="post" action ="edit" id="editForm" role="form" >
        <a href="/views/adminView/editRoute.jsp"><button type="submit" class="btn btn-primary btn-md">Edit Route</button></a>
    </form>

    <br>
    <br>
    <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
        <button type="submit" class="btn btn-success btn-md">Logout</button>
    </form>

</div>

    <%@include file="/views/commonView/footer.jsp"%>

