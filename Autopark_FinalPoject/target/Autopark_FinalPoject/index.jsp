<%@include file="/views/commonView/header.jsp"%>

<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">About Autopark</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Routes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Buses</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Drivers</a>
                </li>
            </ul>
            <div align="right">
                <jsp:useBean id="now" class="java.util.Date" />
                <fmt:setLocale value="us-US"/>
                <fmt:formatDate value="${now}"/>
            </div>
        </div>
    </nav>
    <div class="introductoryText">
        <h3> Welcome to our autopark. Here you can find all needed information about drivers, buses and bus routes. </h3>
    </div>
    <br>
    <div class="alert alert-info" role="alert" align="centre">
        <form action="LoginServlet" method="post">

            Login: <input type="text" name="login">
            <br>
            Password: <input type="password" name="password">
            <br>
            <input type="submit" value="Login">
        </form>

    </div>
</div>

<%@include file="/views/commonView/footer.jsp"%>



