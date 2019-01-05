<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/19/18
  Time: 2:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/views/commonView/header.jsp"%>

    <div class="container">

        <a href="#" class="btn btn-danger btn-lg btn-block" role="button" aria-pressed="true">Pending Requests <span class="badge badge-light">4</span></a>

        <br>
        <br>

        <table class="table table-striped">
            <thead>
            <tr>
                <td>Route ID: </td>
                <td>Route name: </td>
                <td>Driver Name:</td>
                <td>Bus ID: </td>
                <td>Route ID: </td>
                <td>Route city of department: </td>
                <td>Route city of arrival: </td>
                <td>Route duration: </td>
                <td>Route time of department</td>
                <td>Route time of arrival</td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Route ID: </td>
                <td>Route name: </td>
                <td>Driver Name:</td>
                <td>Bus ID: </td>
                <td>Route ID: </td>
                <td>Route city of department: </td>
                <td>Route city of arrival: </td>
                <td>Route duration: </td>
                <td>Route time of department</td>
                <td>Route time of arrival</td>
            </tr>

            </tbody>
        </table>

        <br><br>
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
            <button type="submit" class="btn btn-success btn-md">Logout</button>
        </form>

    </div>


    </div>
<%@include file="/views/commonView/footer.jsp"%>
