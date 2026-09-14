<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Teacher</title>

        <style>
            body{
                font-family:Arial;
                background:#f4f6f9;
                padding:30px;
            }
            .container{
                width:550px;
                margin:auto;
                background:white;
                padding:25px;
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

            <h2>Add Teacher</h2>

            <form action="${pageContext.request.contextPath}/AddTeacherServlet" method="post">

                <label>Full Name</label>
                <input type="text" name="fullName" required>

                <label>Email</label>
                <input type="email" name="email" required>

                <label>Phone</label>
                <input type="tel" name="phone" maxlength="10" required>

                <label>Department</label>
                <input type="text" name="department" required>

                <label>Qualification</label>
                <input type="text" name="qualification" required>

                <label>Address</label>
                <textarea name="address" rows="4"></textarea>

                <br><br>

                <button type="submit">Add Teacher</button>

            </form>

        </div>

    </body>
</html>