<%@ page import="wcd.jpa.entities.Classes" %>
<%@ page import="java.util.List" %>
<%@ page import="wcd.jpa.entities.Subject" %><%--
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
                <a href="list-student">
                    <h1>List Student</h1>
                </a>
            </div>
            <form action="create-student" method="post">
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
                <div class="row mb-3">
                    <label for="inputClass3" class="col-sm-2 col-form-label">Classes</label>
                    <div class="col-sm-10">
                        <select class="form-select" name="class_id" aria-label="Default select example"
                                id="inputClass3">
                            <option selected>Select class</option>
                            <% for (Classes c : (List<Classes>) request.getAttribute("classes")) { %>
                            <option value="<%= c.getId() %>"><%= c.getName() %>
                            </option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputClass3" class="col-sm-2 col-form-label">Subject</label>
                    <% for (Subject s: (List<Subject>)request.getAttribute("subjects")){ %>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input name="subject_id[]" class="form-check-input" type="checkbox" value="<%= s.getId() %>">
                            <%= s.getName() %>
                        </label>
                    </div>
                    <% } %>
                </div>
                <button type="submit" class="btn btn-primary">Create</button>
            </form>
        </div>
        <div class="col-lg-3"></div>
    </div>

</div>
</body>
</html>
