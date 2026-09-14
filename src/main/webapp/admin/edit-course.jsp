<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.sms.model.Course" %>

<%
    Course course = (Course) request.getAttribute("course");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Course</title>

        <style>
            body{
                font-family:Arial;
                background:#f4f6f9;
                padding:30px;
            }

            .container{
                width:600px;
                margin:auto;
                background:white;
                padding:25px;
                border-radius:8px;
            }

            input,textarea{
                width:100%;
                padding:10px;
                margin:10px 0;
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

            <h2>Edit Course</h2>

            <form action="${pageContext.request.contextPath}/UpdateCourseServlet" method="post">

                <input type="hidden" name="id" value="<%=course.getId()%>">

                <label>Course Code</label>
                <input type="text" name="courseCode" value="<%=course.getCourseCode()%>" required>

                <label>Course Name</label>
                <input type="text" name="courseName" value="<%=course.getCourseName()%>" required>

                <label>Duration</label>
                <input type="text" name="duration" value="<%=course.getDuration()%>" required>

                <label>Semester</label>
                <input type="text" name="semester" value="<%=course.getSemester()%>" required>

                <label>Fee</label>
                <input type="number" step="0.01" name="fee" value="<%=course.getFee()%>" required>

                <label>Description</label>
                <textarea name="description"><%=course.getDescription()%></textarea>

                <br><br>

                <button type="submit">Update Course</button>

            </form>

        </div>

    </body>
</html>