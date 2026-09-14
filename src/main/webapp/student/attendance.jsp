<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.sms.model.Attendance"%>

<%
List<Attendance> attendanceList =
        (List<Attendance>) request.getAttribute("attendanceList");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Attendance</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow">

        <div class="card-header bg-success text-white">
            <h3>📅 My Attendance</h3>
        </div>

        <div class="card-body">

            <table class="table table-bordered table-hover">

                <thead class="table-dark">

                    <tr>
                        <th>ID</th>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>

                </thead>

                <tbody>

                <%
                if(attendanceList != null && !attendanceList.isEmpty()){

                    for(Attendance attendance : attendanceList){
                %>

                    <tr>

                        <td><%=attendance.getId()%></td>

                        <td><%=attendance.getAttendanceDate()%></td>

                        <td><%=attendance.getStatus()%></td>

                    </tr>

                <%
                    }

                } else {
                %>

                    <tr>

                        <td colspan="3" class="text-center">
                            No Attendance Records Found
                        </td>

                    </tr>

                <%
                }
                %>

                </tbody>

            </table>

            <a href="<%= request.getContextPath() %>/student/dashboard.jsp"
   class="btn btn-primary">
    Back to Dashboard
</a>

        </div>

    </div>

</div>

</body>
</html>