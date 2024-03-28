<%@ page import="java.util.List" %>
<%@ page import="wcd.jpa.entities.Student" %><%--
  Created by IntelliJ IDEA.
  User: duchoang
  Date: 22/01/2024
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Student Liked</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">
    <jsp:include page="/layout/header.jsp"/>

    <div class="row">
        <div class="col-lg-10">
            <h1>List Student</h1>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Integer> likedStudents = (List<Integer>) request.getAttribute("likedStudents");
            if (likedStudents != null) {
                for (Integer studentId : likedStudents) {
        %>
        <tr>
            <th scope="row"><%= studentId %></th>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
