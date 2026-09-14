<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sms.model.Attendance"%>

<%
Attendance attendance =
        (Attendance) request.getAttribute("attendance");

String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Attendance</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
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
    padding:20px 0;
    margin:0;
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

</style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <h3>Teacher Panel</h3>

    <a href="<%=path%>/TeacherDashboardServlet">
        Dashboard
    </a>

    <a href="<%=path%>/TeacherStudentsServlet">
        Students
    </a>

    <a href="<%=path%>/TeacherAttendanceServlet">
        Attendance
    </a>

    <a href="<%=path%>/TeacherResultsServlet">
        Results
    </a>

    <a href="<%=path%>/TeacherProfileServlet">
        Profile
    </a>

    <a href="<%=path%>/LogoutServlet">
        Logout
    </a>

</div>


<!-- MAIN -->

<div class="main">

    <div class="card">

        <div class="card-header bg-warning">

            <h3 class="mb-0">
                Edit Attendance
            </h3>

        </div>


        <div class="card-body">

            <form
                action="<%=path%>/TeacherUpdateAttendanceServlet"
                method="post">


                <input
                    type="hidden"
                    name="id"
                    value="<%=attendance.getId()%>">


                <!-- STUDENT ID -->

                <div class="mb-3">

                    <label class="form-label">
                        Student ID
                    </label>

                    <input
                        type="number"
                        name="studentId"
                        class="form-control"
                        value="<%=attendance.getStudentId()%>"
                        required>

                </div>


                <!-- DATE -->

                <div class="mb-3">

                    <label class="form-label">
                        Attendance Date
                    </label>

                    <input
                        type="date"
                        name="attendanceDate"
                        class="form-control"
                        value="<%=attendance.getAttendanceDate()%>"
                        required>

                </div>


                <!-- STATUS -->

                <div class="mb-3">

                    <label class="form-label">
                        Status
                    </label>

                    <select
                        name="status"
                        class="form-select"
                        required>

                        <option
                            value="Present"
                            <%= "Present".equalsIgnoreCase(attendance.getStatus())
                                ? "selected" : "" %>>

                            Present

                        </option>

                        <option
                            value="Absent"
                            <%= "Absent".equalsIgnoreCase(attendance.getStatus())
                                ? "selected" : "" %>>

                            Absent

                        </option>

                        <option
                            value="Late"
                            <%= "Late".equalsIgnoreCase(attendance.getStatus())
                                ? "selected" : "" %>>

                            Late

                        </option>

                        <option
                            value="Leave"
                            <%= "Leave".equalsIgnoreCase(attendance.getStatus())
                                ? "selected" : "" %>>

                            Leave

                        </option>

                    </select>

                </div>


                <button
                    type="submit"
                    class="btn btn-success">

                    Update Attendance

                </button>


                <a
                    href="<%=path%>/TeacherAttendanceServlet"
                    class="btn btn-secondary">

                    Cancel

                </a>

            </form>

        </div>

    </div>

</div>

</body>

</html>