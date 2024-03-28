<%--
  Created by IntelliJ IDEA.
  User: duchoang
  Date: 24/01/2024
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Class</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">

    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <div class="row">
                <a href="list-class">
                    <h1>List Class</h1>
                </a>
            </div>
            <form action="create-class" method="post">
                <div class="row mb-3" style="margin-top: 30px">
                    <label for="inputName3" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="inputName3">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputRoom3" class="col-sm-2 col-form-label">Room</label>
                    <div class="col-sm-10">
                        <input type="text" name="room" class="form-control" id="inputRoom3">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputSem3" class="col-sm-2 col-form-label">Sem</label>
                    <div class="col-sm-10">
                        <input type="number" name="semester" class="form-control" id="inputSem3">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Create</button>
            </form>
        </div>
        <div class="col-lg-3"></div>
    </div>

</div>
</body>
</html>
