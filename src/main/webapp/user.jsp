<%@ page import="com.company.dao.inter.UserDaoInter" %>
<%@ page import="com.company.dao.impl.UserDaoImpl" %>
<%@ page import="com.company.entity.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Ghost
  Date: 10/3/2023
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="assets/users.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>User Search</title>
</head>
<body>
<%
    @SuppressWarnings("unchecked")
    List<User> users = (List<User>) request.getAttribute("users");
%>
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">User Search</h2>
                </div>
                <div class="card-body">
                    <form action="user" method="get">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="First Name" id="firstNameInput" name="firstname">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Last Name" id="lastNameInput" name="lastname">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Email" id="emailInput" name="email">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary" id="searchButton">Search</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-lg-8 mx-auto">
            <table class="table table-bordered">
                <thead class="thead-dark">
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody id="userTableBody">
                <% for (User u : users) { %>
                <tr>
                    <td><%= u.getFirstName() %></td>
                    <td><%= u.getLastName() %></td>
                    <td><%= u.getEmail() %></td>
                    <td>
                        <div class="d-flex justify-content-between">
                            <!-- Delete button with icon -->
                            <form>
                                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#exampleModal" onclick="setIdForDelete(<%=u.getId()%>)">
                                    <i class="fas fa-trash"></i> Delete
                                </button>
                            </form>
                            <!-- Update button with icon -->
                            <form type="submit" action="user_details" method="get" name="update_action">
                                <input type="hidden" name="id" value="<%=u.getId()%>">
                                <button class="btn btn-primary btn-sm">
                                    <i class="fas fa-edit"></i> Update
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure?
                </div>
                <div class="modal-footer">

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <form type="submit" action="user_details" method="post">
                        <input type="hidden" name = "id" value="" id = "idForDelete">
                        <input type="hidden" name = "action" value="delete">
                        <input type="submit" class="btn btn-primary" value="Delete"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
