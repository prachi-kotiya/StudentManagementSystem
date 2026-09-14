<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.sms.model.Student"%>

<%
List<Student> studentList =
        (List<Student>) request.getAttribute("studentList");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Result</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

body{
    margin:0;
    background:#f5f6fa;
    font-family:Arial,sans-serif;
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
    color:white;
    text-align:center;
    margin:20px 0;
}

.sidebar a{
    display:block;
    color:white;
    padding:15px 25px;
    text-decoration:none;
}

.sidebar a:hover{
    background:#0d6efd;
}

.main-content{
    margin-left:250px;
    padding:30px;
}

.card{
    border:none;
    border-radius:12px;
    box-shadow:0 2px 10px rgba(0,0,0,.15);
}

</style>

</head>

<body>

<div class="sidebar">

<h3>Teacher Panel</h3>

<a href="<%=request.getContextPath()%>/TeacherDashboardServlet">
Dashboard
</a>

<a href="<%=request.getContextPath()%>/TeacherStudentsServlet">
Students
</a>

<a href="<%=request.getContextPath()%>/TeacherAttendanceServlet">
Attendance
</a>

<a href="<%=request.getContextPath()%>/TeacherResultsServlet">
Results
</a>

<a href="<%=request.getContextPath()%>/TeacherProfileServlet">
Profile
</a>

<a href="<%=request.getContextPath()%>/LogoutServlet">
Logout
</a>

</div>


<div class="main-content">

<div class="card p-4">

<h3 class="mb-4">Add Student Result</h3>

<form action="<%=request.getContextPath()%>/AddTeacherResultServlet"
      method="post">


<!-- Student -->

<div class="mb-3">

<label class="form-label">
Student
</label>

<select name="studentId"
        class="form-select"
        required>

<option value="">
-- Select Student --
</option>

<%
if(studentList != null){

    for(Student s : studentList){
%>

<option value="<%=s.getId()%>">

<%=s.getFullName()%>

</option>

<%
    }
}
%>

</select>

</div>


<!-- Subject -->

<div class="mb-3">

<label class="form-label">
Subject
</label>

<input type="text"
       name="subject"
       class="form-control"
       placeholder="Enter subject"
       required>

</div>


<!-- Marks -->

<div class="mb-3">

<label class="form-label">
Marks
</label>

<input type="number"
       name="marks"
       class="form-control"
       min="0"
       max="100"
       step="0.01"
       placeholder="Enter marks"
       required>

</div>


<!-- Grade -->

<div class="mb-3">

<label class="form-label">
Grade
</label>

<select name="grade"
        class="form-select"
        required>

<option value="">
-- Select Grade --
</option>

<option value="A+">A+</option>
<option value="A">A</option>
<option value="B+">B+</option>
<option value="B">B</option>
<option value="C">C</option>
<option value="D">D</option>
<option value="F">F</option>

</select>

</div>


<!-- Exam Date -->

<div class="mb-3">

<label class="form-label">
Exam Date
</label>

<input type="date"
       name="examDate"
       class="form-control"
       required>

</div>


<button type="submit"
        class="btn btn-success">

Add Result

</button>


<a href="<%=request.getContextPath()%>/TeacherResultsServlet"
   class="btn btn-secondary">

Cancel

</a>

</form>

</div>

</div>

</body>

</html>