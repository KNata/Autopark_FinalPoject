<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/19/18
  Time: 2:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/views/commonView/header.jsp"%>

<div class="container">


    <form action="/RouteServlet" method="post" role="form" data-toggle="validator" >
        <c:if test ="${empty action}">
            <c:set var="action" value="removeRoute"/>
        </c:if>
        <input type="hidden" id="action" name="action" value="${action}">
        <input type="hidden" id="idVRoute" name="idRoutee" value="${bus.busID}">
        <h2>Bus d</h2>
        <div class="form-group col-xs-4">
            <label for="idRoute" class="control-label col-xs-4"><fmt:message key="admin.add.route.routeID"/>:</label>
            <input type="text" name="idVisitor" id="idRoute" class="form-control" value="${visitor.visitorID}" required="true"/>
            <br>
            <button type="submit" class="btn btn-primary  btn-md"><fmt:message key="admin.accept.button"/></button>
        </div>
        <br>
    </form>

    <br>
    <br>
    <a href="adminMainPage.jsp"><button type="submit" class="btn btn-secondary btn-md"><fmt:message key="back.to.main.page" bundle="${rb}"/></button></a>

    <br>
    <br>
    <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
        <button type="submit" class="btn btn-success btn-md"><fmt:message key="logout.button" bundle="${rb}"/></button>
    </form>

    <br>
    <br>
    <form action="${pageContext.request.contextPath}/ShowAllVisitorsServlet" method="post">
        <button type="submit" class="btn btn-success btn-md"><fmt:message key="admin.see.routes"/></button>
    </form>
</div>

<%@include file="/views/commonView/footer.jsp"%>
