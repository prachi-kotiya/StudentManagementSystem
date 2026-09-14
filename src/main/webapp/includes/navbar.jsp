<%@ page import="com.sms.model.User" %>

<%
User user = (User) session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">

    <div class="container-fluid">

        <span class="navbar-brand">
            Student Management System
        </span>

        <span class="text-white ms-auto">

            Welcome,
            <%= user != null ? user.getFullname() : "Admin" %>

        </span>

    </div>

</nav>