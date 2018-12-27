<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/19/18
  Time: 1:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <title>Register Page</title>
</head>
<body>
<div class="container">

    <form action="/VisitorServlet" method="post" role="form" data-toggle="validator" >
        <c:if test ="${empty action}">
            <c:set var="action" value="addNewVisitor"/>
        </c:if>
        <input type="hidden" id="action" name="action" value="${action}">
        <input type="hidden" id="idVisitorr" name="idVisitorr" value="${visitor.visitorID}">

        <h3>Welcome to our community</h3>
        <h3>Please properly fill all text boxes. This information will be confidential</h3>

        <div class="form-group col-xs-4">
            <label for="idVisitor" class="control-label col-xs-4">Visitor ID:</label>
            <input type="text" name="idVisitor" id="idVisitor" class="form-control" value="${visitor.visitorID}" required="true"/>
            <br>
            <label for="visitorLogin" class="control-label col-xs-4">Visitor login:</label>
            <input type="text" name="visitorLogin" id="visitorLogin" class="form-control" value="${visitor.visitorLogin}" required="true"/>
            <br>

            <label for="visitorPassword" class="control-label col-xs-4">Visitor password:</label>
            <input type="password" name="visitorPassword" id="visitorPassword" class="form-control" value="${visitor.visitorPassword}" required="true"/>
            <br>
            <label for="visitorName" class="control-label col-xs-4">Visitor name:</label>
            <input type="text" name="visitorName" id="visitorName" class="form-control" value="${visitor.visitorName}" required="true"/>
            <br>
            <label for="driverId" class="control-label col-xs-4">Driver ID:</label>
            <input type="text" name="driverId" id="driverId" class="form-control" value="${visitor.driverId}" required="true"/>
            <br>
            <label for="visitorRole" class="control-label col-xs-4">Visitor Role:</label>
            <input type="text" name="visitorRole" id="visitorRole" class="form-control" value="${visitor.visitorRole}" required="true"/>
            <br>
            <button type="submit" class="btn btn-primary  btn-md">Accept</button>
        </div>

    </form>
    <br>
    <a href="adminMainPage.jsp"><input type="submit" value="Back to main page" /></a>
    <br>
    <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
        <input type="submit" value="Logout" />
    </form>

</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>
