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
    <title>List Student</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">
    <jsp:include page="/layout/header.jsp"/>

    <div class="row">
        <div class="col-lg-10">
            <h1>List Student</h1>
        </div>
        <div class="col-lg-2">
            <a href="student-create">
                <button type="button" class="btn btn-primary">Create Student</button>
            </a>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
            <% for (Student s : (List<Student>) request.getAttribute("students")) { %>
            <tr>
            <th scope="row"><%= s.id %>
            </th>
            <td><%= s.name %>
            </td>
            <td><%= s.email %>
            </td>
            <td><%= s.address %>
            </td>
            <td><button type="button" class="btn btn-info">Edit</button>
                <button type="button" class="btn btn-danger">Delete</button>
            </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
