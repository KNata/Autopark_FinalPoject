<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 1/6/19
  Time: 1:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/views/commonView/header.jsp"%>

<div class="container">

    <form action="/BusServlet" method="post" role="form" data-toggle="validator" >
        <c:if test ="${empty action}">
            <c:set var="action" value="edit"/>
        </c:if>

        <h3>Update information about bus</h3>

        <div class="form-group col-xs-4">

            <label for="idBus" class="control-label col-xs-4">Bus ID:</label>
            <input type="text" name="idBus" id="idBus" class="form-control" value="${bus.busID}" required="true"/>
            <br>
            <label for="miles" class="control-label col-xs-4">How much miles went a bus:</label>
            <input type="text" name="visitorPassword" id="miles" class="form-control" value="${bus.miles}"/>

            <label for="passedService" class="control-label col-xs-4">Passed service?</label>
            <input type="text" name="passedService" id="passedService" class="form-control" value="${bus.passedService}" required="true"/>

            <button type="submit" class="btn btn-primary btn-md">Accept</button>
        </div>

    </form>
    <br>
    <a href="adminMainPage.jsp"><button type="submit" class="btn btn-secondary  btn-md">Back to main page</button></a>
    <br>
    <br>
    <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
        <button type="submit" class="btn btn-success btn-md">Logout</button>
    </form>

</div>

<%@include file="/views/commonView/footer.jsp"%>

