<%@include file="/views/commonView/header.jsp"%>

<div class="container">

    <div class="introductoryText">
        <h3> Welcome to our autopark. Here you can find all needed information about drivers, buses and bus routes. </h3>
    </div>
    <br>
    <div class="alert alert-info" role="alert" align="centre">
        <form action="LoginServlet" method="post">

            <label for="login" class="col-sm-2 col-form-label">Login:</label>
            <input type="text" name="login" id="login" class="form-control" required="true">
            <br>
            <label for="password" class="col-sm-2 col-form-label">Passwod:</label>
            <input type="password" name="password" id="password" class="form-control" required="true">
            <br>
            <button type="submit" class="btn btn-success btn-md">Login</button>
        </form>

    </div>
</div>

<%@include file="/views/commonView/footer.jsp"%>



