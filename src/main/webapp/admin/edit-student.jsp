<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.sms.model.Student" %>

<%
Student student = (Student) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>

    <style>
        body{
            font-family: Arial, sans-serif;
            background:#f4f6f9;
            padding:30px;
        }

        .container{
            width:500px;
            margin:auto;
            background:white;
            padding:20px;
            border-radius:8px;
        }

        input, textarea{
            width:100%;
            padding:10px;
            margin:8px 0;
            box-sizing:border-box;
        }

        button{
            background:#4CAF50;
            color:white;
            padding:10px 20px;
            border:none;
            cursor:pointer;
        }
    </style>
</head>

<body>

<div class="container">

<h2>Edit Student</h2>

<form action="${pageContext.request.contextPath}/UpdateStudentServlet" method="post">

<input type="hidden" name="id" value="<%=student.getId()%>">

<label>Student ID</label>
<input type="text" name="studentId" value="<%=student.getStudentId()%>" required>

<label>Full Name</label>
<input type="text" name="fullName" value="<%=student.getFullName()%>" required>

<label>Email</label>
<input type="email" name="email" value="<%=student.getEmail()%>" required>

<label>Phone</label>
<input type="text" name="phone" value="<%=student.getPhone()%>" required>

<label>Course</label>
<input type="text" name="course" value="<%=student.getCourse()%>" required>

<label>Semester</label>
<input type="text" name="semester" value="<%=student.getSemester()%>" required>

<label>Address</label>
<textarea name="address"><%=student.getAddress()%></textarea>

<br><br>

<button type="submit">Update Student</button>

</form>

</div>

</body>
</html>