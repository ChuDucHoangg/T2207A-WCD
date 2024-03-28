<%@ page import="java.util.List" %>
<%@ page import="wcd.jpa.entities.Classes" %><%--
  Created by IntelliJ IDEA.
  User: duchoang
  Date: 22/01/2024
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Class</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">
    <jsp:include page="/layout/header.jsp"/>

    <div class="row">
        <div class="col-lg-10">
            <h1>List Class</h1>
        </div>
        <div class="col-lg-2">
            <a href="create-class">
                <button type="button" class="btn btn-primary">Create Class</button>
            </a>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Room</th>
            <th scope="col">Semester</th>
            <th scope="col">Student Count</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <% for (Classes s : (List<Classes>) request.getAttribute("classes")) { %>
        <tr>
            <th scope="row"><%= s.getId() %>
            </th>
            <td><%= s.getName() %>
            </td>
            <td><%= s.getRoom() %>
            </td>
            <td><%= s.getSemester() %>
            </td>
            <td><%= s.getStudents().size() %>
            </td>
            <td><a href="edit-class?id=<%= s.getId() %>">
                <button type="button" class="btn btn-info">Edit</button>
            </a>
                <a href="javascript:void(0);"></a>
                <button onclick="deleteClass(<%= s.getId() %>)" type="button" class="btn btn-danger">Delete</button>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function deleteClass(id) {
        if (confirm("Are you sure?")) {
            var url = `list-class?id=` + id
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
