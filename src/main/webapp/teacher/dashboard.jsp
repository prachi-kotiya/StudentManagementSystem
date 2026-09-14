<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Teacher Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>

body{
    margin:0;
    background:#f4f6f9;
    font-family:Arial,Helvetica,sans-serif;
}

.sidebar{
    position:fixed;
    top:0;
    left:0;
    width:250px;
    height:100%;
    background:#212529;
}

.sidebar h3{
    color:#fff;
    text-align:center;
    padding:20px;
}

.sidebar a{
    display:block;
    color:#fff;
    text-decoration:none;
    padding:15px 25px;
    font-size:17px;
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
    border-radius:15px;
    box-shadow:0 3px 10px rgba(0,0,0,.15);
    transition:.3s;
}

.card:hover{
    transform:translateY(-5px);
}

.icon{
    font-size:45px;
}

.notice{
    border-left:5px solid #0d6efd;
}

</style>

</head>

<body>

<div class="sidebar">

<h3>Teacher Panel</h3>

<a href="<%=request.getContextPath()%>/TeacherDashboardServlet">
<i class="bi bi-speedometer2"></i> Dashboard
</a>

<a href="<%=request.getContextPath()%>/TeacherStudentsServlet">
<i class="bi bi-people"></i> Students
</a>

<a href="<%=request.getContextPath()%>/TeacherAttendanceServlet">
<i class="bi bi-calendar-check"></i> Attendance
</a>

<a href="<%=request.getContextPath()%>/TeacherResultsServlet">
<i class="bi bi-bar-chart"></i> Results
</a>

<a href="<%=request.getContextPath()%>/TeacherProfileServlet">
<i class="bi bi-person"></i> Profile
</a>

<a href="<%=request.getContextPath()%>/LogoutServlet">
<i class="bi bi-box-arrow-right"></i> Logout
</a>

</div>

<div class="main">

<h2 class="mb-4">
👋 Welcome Teacher
</h2>

<div class="row g-4">

<div class="col-md-4">

<div class="card bg-primary text-white p-4">

<div class="icon">
<i class="bi bi-people-fill"></i>
</div>

<h4 class="mt-3">Students</h4>

<h2>${studentCount}</h2>

</div>

</div>

<div class="col-md-4">

<div class="card bg-success text-white p-4">

<div class="icon">
<i class="bi bi-calendar-check-fill"></i>
</div>

<h4 class="mt-3">Attendance</h4>

<h2>${attendanceCount}</h2>

</div>

</div>

<div class="col-md-4">

<div class="card bg-warning text-dark p-4">

<div class="icon">
<i class="bi bi-bar-chart-fill"></i>
</div>

<h4 class="mt-3">Results</h4>

<h2>${resultCount}</h2>

</div>

</div>

</div>

<div class="row mt-5">

<div class="col-md-6">

<div class="card p-4">

<h4>Quick Actions</h4>

<hr>

<a href="<%=request.getContextPath()%>/TeacherStudentsServlet"
class="btn btn-primary w-100 mb-2">

Manage Students

</a>

<a href="<%=request.getContextPath()%>/TeacherAttendanceServlet"
class="btn btn-success w-100 mb-2">

Manage Attendance

</a>

<a href="<%=request.getContextPath()%>/TeacherResultsServlet"
class="btn btn-warning w-100">

Manage Results

</a>

</div>

</div>

<div class="col-md-6">

<div class="card notice p-4">

<h4>Latest Notices</h4>

<hr>

<ul>

<li>📢 Attendance should be updated daily.</li>

<li>📢 Upload student results after exams.</li>

<li>📢 Check student records regularly.</li>

<li>📢 Keep student attendance accurate.</li>

</ul>

</div>

</div>

</div>

</div>

</body>
</html>