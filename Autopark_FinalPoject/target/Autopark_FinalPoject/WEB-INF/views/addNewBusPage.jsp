<%--
  Created by IntelliJ IDEA.
  User: nataliakiselyk
  Date: 12/19/18
  Time: 2:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="index.css">
    <title>Add a bus</title>
</head>
<body>
<div class="container-fluid">

    <h3>Add a new bus to Autopark</h3>
    <h7><i>Please properly fill all text boxes</i></h7>

    <form>
        <div class="form-group">
            <%--@declare id="1"--%><label for="1">Bus ID:</label>
            <input type="text" class="form-control" id="busID" placeholder="FK3455">
        </div>
        <div class="form-group col-md-6">
            <%--@declare id="32"--%><label for="32">Model of a Bus:</label>
            <input type="text" class="form-control" id="busModel" placeholder="Scania">
        </div>
        <div class="form-group">
            <%--@declare id="inputaddress3"--%><label for="inputAddress3">Max passangers count:</label>
            <input type="text" class="form-control" id="maxPassegers" placeholder="100">
        </div>
        <div class="form-group">
            <%--@declare id="6"--%><label for="6">How much miles does the bus went: </label>
            <input type="text" class="form-control" id="miles" placeholder="1000">
        </div>
        <div class="form-group">
            <%--@declare id="5"--%><label for="5">Was on service:</label>
            <input type="text" class="form-control" id="maintance" placeholder="true / false">
        </div>
        <button type="submit" class="btn btn-primary">Register</button> <button type="button" class="btn btn-secondary">Cancel</button>
    </form>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>