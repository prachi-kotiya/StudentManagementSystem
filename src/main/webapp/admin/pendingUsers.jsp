<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.User" %>

<%
List<User> pendingUsers = (List<User>) request.getAttribute("pendingUsers");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Pending User Approvals</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

    <h2 class="mb-4 text-center">Pending User Approvals</h2>

    <table class="table table-bordered table-striped">

        <thead class="table-dark">

            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

        </thead>

        <tbody>

        <%
        if (pendingUsers != null && !pendingUsers.isEmpty()) {

            for (User user : pendingUsers) {
        %>

        <tr>

            <td><%= user.getId() %></td>

            <td><%= user.getFullname() %></td>

            <td><%= user.getEmail() %></td>

            <td><%= user.getPhone() %></td>

            <td><%= user.getRole() %></td>

            <td>
                <span class="badge bg-warning text-dark">
                    <%= user.getStatus() %>
                </span>
            </td>

            <td>

               <a href="<%= request.getContextPath() %>/ApproveUserServlet?id=<%= user.getId() %>"
   class="btn btn-success btn-sm">

                    Approve

                </a>

            </td>

        </tr>

        <%
            }
        } else {
        %>

        <tr>

            <td colspan="7" class="text-center">

                No Pending Users Found

            </td>

        </tr>

        <%
        }
        %>

        </tbody>

    </table>

    <div class="text-center mt-3">
       <a href="<%= request.getContextPath() %>/admin/admin-dashboard.jsp"
   class="btn btn-primary">
            Back to Dashboard
        </a>
    </div>

</div>

</body>
</html>