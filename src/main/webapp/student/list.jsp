<%@ page import="java.util.List" %>
<%@ page import="wcd.jpa.entities.Student" %>
<%@ page import="wcd.jpa.entities.Subject" %><%--
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
        <div class="col-lg-10">
            <a href="liked-student">
            <h1>Liked</h1>
                </a>
        </div>
        <div class="col-lg-2">
            <a href="create-student">
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
            <th scope="col">Class</th>
            <th scope="col">Subject</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <% for (Student s : (List<Student>) request.getAttribute("students")) { %>
        <tr>
            <th scope="row"><%= s.getId() %>
            </th>
            <td><%= s.getName() %>
            </td>
            <td><%= s.getEmail() %>
            </td>
            <td><%= s.getAddress() %>
            </td>
            <td><%= s.getClasses().getName() %>
            </td>
            <td>
                <% for (Subject j : s.getSubjects()) { %>
                <span class="badge text-bg-success"><%= j.getName() %>
                    </span>
                <% }%>
            </td>
            <td>
                <a href="edit-student?id=<%= s.getId() %>">
                    <button type="button" class="btn btn-info">Edit</button>
                </a>
                <button onclick="deleteStudent(<%= s.getId() %>)" type="button" class="btn btn-danger">Delete</button>
                <form action="liked-student" method="post">
                    <input type="hidden" name="id" value="<%= s.getId() %>">
                    <button type="submit" class="btn btn-primary">Like</button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function deleteStudent(id) {
        if (confirm("Are you sure?")) {
            var url = `list-student?id=` + id
            fetch(url, {
                method: 'DELETE'
            }).then(rs => {
                window.location.reload();
            }).error(err => {
                alert(err)
            })
        }
    }
</script>
</body>
</html>
