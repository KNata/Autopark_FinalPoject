<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/23/18
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/views/commonView/header.jsp"%>

<div class="container">


    <h2>Buses</h2>
    <!--Search Form -->
    <form action="/BusServlet" method="get" id="seachBusForm" role="form">
        <input type="hidden" id="searchAction" name="searchAction" value="searchByName">
        <div class="form-group col-xs-5">
            <input type="text" name="busName" id="busName" class="form-control" required="true" placeholder="Type the Name of the bus"/>
        </div>
        <button type="submit" class="btn btn-info">
            <span class="glyphicon glyphicon-search"></span> Search
        </button>
    </form>

    <form action="/BusServlet" method="get" id="busForm" role="form" >
        <input type="hidden" id="idBus" name="idBus">
        <input type="hidden" id="action" name="action">
        <c:choose>
            <c:when test="${not empty busList}">
                <table  class="table table-striped">
                    <thead>
                    <tr>
                        <td><strong>Bus ID: </strong> </td>
                        <td><strong>Bus Model: </strong></td>
                        <td><strong>Max Count Of Passangers: </strong></td>
                        <td><strong></strong>Miles: <strong></strong></td>
                        <td><strong>Passed Servise? </strong></td>
                    </tr>
                    </thead>
                    <c:forEach var="bus" items="${busList}">
                        <c:set var="classSucess" value=""/>
                        <c:if test ="${idBus == bus.busID}">
                            <c:set var="classSucess" value="info"/>
                        </c:if>
                        <tr class="${classSucess}">

                            <td>${bus.busID}</td>
                            <td>${bus.busModel}</td>
                            <td>${bus.maxCountOfPassagers}</td>
                            <td>${bus.miles}</td>
                            <td>${bus.passedService}</td>

                            <td><a href="#" id="remove"
                                   onclick="document.getElementById('action').value = 'remove';document.getElementById('idBus').value = '${bus.busID}';

                                           document.getElementById('busForm').submit();">
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
                    No bus found matching your search criteria
                </div>
            </c:otherwise>
        </c:choose>
    </form>
    <br>
        <a href="/views/adminView/addNewBusPage.jsp"><button type="submit" class="btn btn-secondary btn-md">New Bus</button></a>
        <a href="/views/adminView/adminMainPage.jsp"><button type="submit" class="btn btn-primary  btn-md">Back to main page</button></a>

        <br>
        <br>
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
             <button type="submit" class="btn btn-success btn-md">Logout</button>
        </form>
</div>
<%@include file="/views/commonView/footer.jsp"%>
