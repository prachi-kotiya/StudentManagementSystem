<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Course</title>

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
                border-radius:10px;
                box-shadow:0 2px 10px rgba(0,0,0,.2);
            }

            input,textarea{
                width:100%;
                padding:10px;
                margin:10px 0;
                box-sizing:border-box;
            }

            button{
                background:#2c3e50;
                color:white;
                padding:12px 25px;
                border:none;
                cursor:pointer;
                border-radius:5px;
            }

            button:hover{
                background:#34495e;
            }

        </style>

    </head>

    <body>

        <div class="container">

            <h2>Add Course</h2>

            <form action="${pageContext.request.contextPath}/AddCourseServlet" method="post">

                <label>Course Code</label>
                <input type="text" name="courseCode" required>

                <label>Course Name</label>
                <input type="text" name="courseName" required>

                <label>Duration</label>
                <input type="text" name="duration" required>

                <label>Semester</label>
                <input type="text" name="semester" required>

                <label>Fee</label>
                <input type="number" step="0.01" name="fee" required>

                <label>Description</label>
                <textarea name="description" rows="4"></textarea>

                <br><br>

                <button type="submit">Save Course</button>

            </form>

        </div>

    </body>
</html>