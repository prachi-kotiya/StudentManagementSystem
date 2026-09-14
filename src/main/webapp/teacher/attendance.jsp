<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.sms.model.Attendance"%>

<%
List<Attendance> attendanceList =
        (List<Attendance>) request.getAttribute("attendanceList");

String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Teacher Attendance</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
rel="stylesheet">

<style>

body{
    margin:0;
    background:#f5f6fa;
    font-family:Arial, Helvetica, sans-serif;
}

.sidebar{
    position:fixed;
    left:0;
    top:0;
    width:250px;
    height:100vh;
    background:#212529;
}

.sidebar h3{
    color:white;
    text-align:center;
    margin:20px 0;
}

.sidebar a{
    display:block;
    color:white;
    text-decoration:none;
    padding:14px 25px;
}

.sidebar a:hover{
    background:#0d6efd;
}

.main{
    margin-left:250px;
    padding:30px;
}

.card{
    border:none;
    border-radius:12px;
    box-shadow:0 3px 10px rgba(0,0,0,.15);
}

.table th{
    background:#0d6efd;
    color:white;
}

</style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <h3>Teacher Panel</h3>

    <a href="<%=path%>/TeacherDashboardServlet">
        <i class="bi bi-house"></i>
        Dashboard
    </a>

    <a href="<%=path%>/TeacherStudentsServlet">
        <i class="bi bi-people"></i>
        Students
    </a>

    <a href="<%=path%>/TeacherAttendanceServlet">
        <i class="bi bi-calendar-check"></i>
        Attendance
    </a>

    <a href="<%=path%>/TeacherResultsServlet">
        <i class="bi bi-bar-chart"></i>
        Results
    </a>

    <a href="<%=path%>/TeacherProfileServlet">
        <i class="bi bi-person"></i>
        Profile
    </a>

    <a href="<%=path%>/LogoutServlet">
        <i class="bi bi-box-arrow-right"></i>
        Logout
    </a>

</div>


<!-- MAIN -->

<div class="main">

    <div class="card p-4">


        <!-- HEADER -->

        <div class="d-flex justify-content-between align-items-center mb-4">

            <h3 class="mb-0">
                Attendance Records
            </h3>

            <a
                href="<%=path%>/TeacherAttendanceFormServlet"
                class="btn btn-success">

                <i class="bi bi-plus-circle"></i>
                Add Attendance

            </a>

        </div>


        <!-- TABLE -->

        <div class="table-responsive">

            <table class="table table-bordered table-hover align-middle">

                <thead>

                    <tr>

                        <th>ID</th>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Action</th>

                    </tr>

                </thead>


                <tbody>

                <%
                if(attendanceList != null &&
                   !attendanceList.isEmpty()){

                    for(Attendance a : attendanceList){
                %>

                    <tr>

                        <td>
                            <%=a.getId()%>
                        </td>

                        <td>
                            <%=a.getStudentId()%>
                        </td>

                        <td>
                            <%=a.getStudentName()%>
                        </td>

                        <td>
                            <%=a.getAttendanceDate()%>
                        </td>

                        <td>

                            <%
                            if("Present".equalsIgnoreCase(a.getStatus())){
                            %>

                                <span class="badge bg-success">
                                    Present
                                </span>

                            <%
                            }else if("Late".equalsIgnoreCase(a.getStatus())){
                            %>

                                <span class="badge bg-warning text-dark">
                                    Late
                                </span>

                            <%
                            }else if("Leave".equalsIgnoreCase(a.getStatus())){
                            %>

                                <span class="badge bg-info text-dark">
                                    Leave
                                </span>

                            <%
                            }else{
                            %>

                                <span class="badge bg-danger">
                                    Absent
                                </span>

                            <%
                            }
                            %>

                        </td>


                        <td>

                            <a
                                href="<%=path%>/TeacherEditAttendanceServlet?id=<%=a.getId()%>"
                                class="btn btn-warning btn-sm">

                                <i class="bi bi-pencil"></i>
                                Edit

                            </a>


                            <a
                                href="<%=path%>/TeacherDeleteAttendanceServlet?id=<%=a.getId()%>"
                                class="btn btn-danger btn-sm"
                                onclick="return confirm('Are you sure you want to delete this attendance record?');">

                                <i class="bi bi-trash"></i>
                                Delete

                            </a>

                        </td>

                    </tr>

                <%
                    }

                }else{
                %>

                    <tr>

                        <td
                            colspan="6"
                            class="text-center text-muted">

                            No attendance records found.

                        </td>

                    </tr>

                <%
                }
                %>

                </tbody>

            </table>

        </div>

    </div>

</div>

</body>

</html>