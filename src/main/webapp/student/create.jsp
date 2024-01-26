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
    <title>Create Student</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">

    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <div class="row">
                <a href="student">
                    <h1>List Student</h1>
                </a>
            </div>
            <form action="student-create" method="post">
        <div class="row mb-3" style="margin-top: 30px">
            <label for="inputName3" class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-10">
                <input type="text" name="name" class="form-control" id="inputName3">
            </div>
        </div>
        <div class="row mb-3">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-10">
                <input type="email" name="email" class="form-control" id="inputEmail3">
            </div>
        </div>
        <div class="row mb-3">
            <label for="inputAddress3" class="col-sm-2 col-form-label">Address</label>
            <div class="col-sm-10">
                <input type="text" name="address" class="form-control" id="inputAddress3">
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
