<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/25/18
  Time: 7:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/views/commonView/header.jsp"%>

<div class="container">


    <!--Search Form -->
    <form action="/VisitorServlet" method="get" id="seachVisitorForm" role="form">
        <input type="hidden" id="searchAction" name="searchAction" value="searchByName">
        <div class="form-group col-xs-5">
            <input type="text" name="visitorName" id="visitorName" class="form-control" required="true"
                   placeholder="Type the Name of the Visitor"/>
        </div>
        <button type="submit" class="btn btn-info">
             Search
        </button>
    </form>

    <h2>Visitor List</h2>

    <form action="/VisitorServlet" method="get" id="visitorForm" role="form" >
        <input type="hidden" id="idVisitor" name="idVisitor">
        <input type="hidden" id="action" name="action">
        <c:choose>
            <c:when test="${not empty visitorList}">
                <table  class="table table-striped">
                    <tr>
                        <td>Visitor ID: </td>
                        <td>Visitor login: </td>
                        <td>Visitor role: </td>
                        <td>Visitor name: </td>
                    </tr>
                    <c:forEach var="visitor" items="${visitorList}">
                        <c:set var="classSucess" value=""/>
                        <c:if test ="${idVisitor == visitor.visitorID}">
                            <c:set var="classSucess" value="info"/>
                        </c:if>
                        <tr class="${classSucess}">
                            <td>${visitor.visitorID}</td>
                            <td>${visitor.visitorLogin}</td>
                            <td>${visitor.visitorRole}</td>
                            <td>${visitor.visitorName}</td>
                            <td><a href="#" id="remove"
                                   onclick="document.getElementById('action').value = 'remove';document.getElementById('idVisitor').value = '${visitor.visitorID}';

                                           document.getElementById('visitorForm').submit();">
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
                    No visitor found matching your search criteria
                </div>
            </c:otherwise>
        </c:choose>
    </form>
    <br>
        <a href="/views/adminView/registerPage.jsp"><button type="submit" class="btn btn-primary btn-md">New Visitor</button>
        <a href="/views/adminView/adminMainPage.jsp"><button type="submit" class="btn btn-secondary btn-md">Back to main page</button></a>
            <br>
            <br>
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
            <button type="submit" class="btn btn-success btn-md">Logout</button>
        </form> <a href="adminMainPage.jsp"></a>


    <%@include file="/views/commonView/footer.jsp"%>

