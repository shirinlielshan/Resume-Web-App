<%@ page import="com.company.entity.User" %>
<%@ page import="com.company.dao.inter.CountryDaoInter" %>
<%@ page import="com.company.main.Context" %>
<%@ page import="com.company.entity.Country" %>
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
    <title>User Details</title>
</head>
<body>
<%
    User user = (User) request.getAttribute("user");
    @SuppressWarnings("unchecked")
    List<Country> countryList = (List<Country>) request.getAttribute("countries");
%>
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">User Details</h2>
                </div>
                <div class="card-body">
                    <form action="user_details" method="post">
                        <input type="hidden" name="id" value="<%=user.getId()%>">
                        <input type="hidden" name="action" value="update">
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" value="<%=user.getFirstName()%>">
                        </div>
                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" value="<%=user.getLastName()%>">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%=user.getEmail()%>">
                        </div>
                        <div class="form-group">
                            <label for="phoneNumber">Phone Number</label>
                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="<%=user.getPhoneNumber()%>">
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" name="address" value="<%=user.getAddress()%>">
                        </div>
                        <div class="form-group">
                            <label for="profileDescription">Profile Description</label>
                            <textarea class="form-control" id="profileDescription" name="profileDescription" rows="3" >
                                <%=user.getProfileDescription()%>
                            </textarea>
                        </div>
                        <div class="form-group">
                            <label for="birthdate">Birthdate</label>
                            <input type="date" class="form-control" id="birthdate" name="birthdate" value="<%=user.getBirthdate()%>">
                        </div>
                        <div class="form-group">
                            <label for="country">Country</label>
                            <select class="form-control" id="country" name="country">
<%--                                <option selected = "<%=country.getId()%>"><%=country.getName()%></option>--%>

                                <%for(int i = 0;i < countryList.size(); i++){%>

                                    <option value="<%=i+1%>"> <%=countryList.get(i).getName()%></option>

                                <%}%>

                            </select>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary" id="saveButton">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
