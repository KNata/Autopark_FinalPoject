<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 1/6/19
  Time: 1:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/views/commonView/header.jsp"%>

<div class="container">

    <form action="/RouteServlet" method="post" role="form" data-toggle="validator" >
        <c:if test ="${empty action}">
            <c:set var="action" value="edit"/>
        </c:if>
        <input type="hidden" id="action" name="action" value="${action}">
        <input type="hidden" id="idVisitorr" name="idVisitorr" value="${visitor.visitorID}">

        <h3>Welcome to our community</h3>
        <h3>Please properly fill all text boxes. This information will be confidential</h3>

        <div class="form-group col-xs-4">

            <label for="visitorLogin" class="control-label col-xs-4">Visitor login:</label>
            <input type="text" name="visitorLogin" id="visitorLogin" class="form-control" value="${visitor.visitorLogin}" required="true"/>
            <br>
            <label for="visitorPassword" class="control-label col-xs-4">Visitor password:</label>
            <input type="password" name="visitorPassword" id="visitorPassword" class="form-control" value="${visitor.visitorPassword}" required="true"/>

            <label for="visitorRole" class="control-label col-xs-4">Visitor Role:</label>
            <input type="text" name="visitorRole" id="visitorRole" class="form-control" value="${visitor.visitorRole}" required="true"/>

            <button type="submit" class="btn btn-primary  btn-md">Accept</button>
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

