<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/23/18
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/views/commonView/header.jsp"%>

<div class="container">

    <h2>Drivers</h2>
    <form action="/DriverServlet" method="get" id="seachBusForm" role="form">
        <input type="hidden" id="searchAction" name="searchAction" value="searchByName">
        <div class="form-group col-xs-5">
            <input type="text" name="driverName" id="driverName" class="form-control" required="true" placeholder="Type the Name of a driver"/>
        </div>
        <button type="submit" class="btn btn-info">
            <span class="glyphicon glyphicon-search"></span> Search
        </button>
    </form>

    <form action="/DriverServlet" method="get" id="showAll" role="form">
    <div class="row-fluid top-margin" align="center">
        <table class="table table-bordered">
            <tr>
                <th>Driver ID</th>
                <th>Driver Name</th>
            </tr>
            <c:forEach var="driver" items="${driverList}">
                <tr>
                    <td><c:out value=" ${driver.driverID}"/></td>
                    <td><c:out value="${driver.driverName}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    </form>

        <a href="/views/adminView/addNewBusPage.jsp"><button type="submit" class="btn btn-primary btn-md">New Bus</button></a>
        <a href="/views/adminView/adminMainPage.jsp"><button type="submit" class="btn btn-secondary btn-md">Back to main page</button></a>

    <br>
    <br>

    <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
        <button type="submit" class="btn btn-success btn-md">Logout</button>
    </form>
</div>
<%@include file="/views/commonView/footer.jsp"%>
