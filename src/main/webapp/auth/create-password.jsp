<%--
  Created by IntelliJ IDEA.
  User: duchoang
  Date: 01/02/2024
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Password</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">

    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <div class="row">
                <h1>Create Password</h1>
            </div>
            <form action="" method="post">
<%--                <div class="mb-3">--%>
<%--                    <label for="formGroupExampleInput0" class="form-label">Your Email</label>--%>
<%--                    <input type="text" value="<%= request.getAttribute("studentEmail") %>" class="form-control" id="formGroupExampleInput0" disabled>--%>
<%--                </div>--%>
                <div class="mb-3">
                    <label for="formGroupExampleInput1" class="form-label">Enter Password</label>
                    <input type="text" name="password" class="form-control" id="formGroupExampleInput1">
                </div>
<%--                <div class="mb-3">--%>
<%--                    <label for="formGroupExampleInput2" class="form-label">Confirm Password</label>--%>
<%--                    <input type="text" class="form-control" id="formGroupExampleInput2">--%>
<%--                </div>--%>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary">Create Password</button>
                </div>
            </form>
        </div>
        <div class="col-lg-3"></div>
    </div>
</div>
</body>
</html>
