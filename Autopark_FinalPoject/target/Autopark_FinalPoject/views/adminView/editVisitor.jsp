<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 1/6/19
  Time: 1:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/views/commonView/header.jsp"%>

<div class="container">

    <form action="/VisitorServlet" method="post" role="form" data-toggle="validator" >
        <c:if test ="${empty action}">
            <c:set var="action" value="editAdmin"/>
        </c:if>
        <input type="hidden" id="action" name="action" value="${action}">
        <input type="hidden" id="idVisitorr" name="idVisitorr" value="${visitor.visitorID}">

        <h3><fmt:message key="admin.add.user.welcome.warning" bundle="${rb}"/></h3>

        <div class="form-group col-xs-4">

            <label for="visitorLogin" class="control-label col-xs-4"><fmt:message key="admin.add.user.visitor.login" bundle="${rb}"/>:</label>
            <input type="text" name="visitorLogin" id="visitorLogin" class="form-control" value="${visitor.visitorLogin}" required="true"/>
            <br>
            <label for="visitorPassword" class="control-label col-xs-4"><fmt:message key="admin.add.user.visitor.password" bundle="${rb}"/>:</label>
            <input type="password" name="visitorPassword" id="visitorPassword" class="form-control" value="${visitor.visitorPassword}" required="true"/>

            <label for="visitorRole" class="control-label col-xs-4"><fmt:message key="admin.add.user.visitor.visitor.role" bundle="${rb}"/>:</label>
            <input type="text" name="visitorRole" id="visitorRole" class="form-control" value="${visitor.visitorRole}" required="true"/>

            <button type="submit" class="btn btn-primary  btn-md"><fmt:message key="admin.accept.button" bundle="${rb}"/></button>
        </div>

    </form>
    <br>
    <a href="adminMainPage.jsp"><button type="submit" class="btn btn-secondary  btn-md"><fmt:message key="back.to.main.page" bundle="${rb}"/></button></a>
    <br>
    <br>
    <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
        <button type="submit" class="btn btn-success btn-md"><fmt:message key="logout.button" bundle="${rb}"/></button>
    </form>

</div>

<%@include file="/views/commonView/footer.jsp"%>

