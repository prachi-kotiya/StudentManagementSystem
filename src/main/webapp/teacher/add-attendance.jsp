<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.sms.model.Student"%>

<%
List<Student> studentList =
        (List<Student>) request.getAttribute("studentList");

String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Attendance</title>

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

        <div class="card-header bg-success text-white">

            <h3 class="mb-0">
                Add Attendance
            </h3>

        </div>


        <div class="card-body">

            <form
                action="<%=path%>/TeacherAddAttendanceServlet"
                method="post">


                <!-- STUDENT -->

                <div class="mb-3">

                    <label class="form-label">
                        Student
                    </label>

                    <select
                        name="studentId"
                        class="form-select"
                        required>

                        <option value="">
                            -- Select Student --
                        </option>

                        <%
                        if(studentList != null){

                            for(Student student : studentList){
                        %>

                        <option value="<%=student.getId()%>">

                            <%=student.getStudentId()%>
                            -
                            <%=student.getFullName()%>

                        </option>

                        <%
                            }
                        }
                        %>

                    </select>

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

                        <option value="">
                            -- Select Status --
                        </option>

                        <option value="Present">
                            Present
                        </option>

                        <option value="Absent">
                            Absent
                        </option>

                        <option value="Late">
                            Late
                        </option>

                        <option value="Leave">
                            Leave
                        </option>

                    </select>

                </div>


                <button
                    type="submit"
                    class="btn btn-success">

                    Add Attendance

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