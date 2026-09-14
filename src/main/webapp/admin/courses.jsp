<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sms.model.Course" %>
<%
    List<Course> list = (List<Course>) request.getAttribute("courseList");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Courses</title>

        <style>

            body{
                font-family:Arial;
                background:#f4f6f9;
                margin:30px;
            }

            table{
                width:100%;
                border-collapse:collapse;
                background:white;
            }

            th,td{
                padding:12px;
                border:1px solid #ddd;
                text-align:center;
            }

            th{
                background:#2c3e50;
                color:white;
            }

            tr:nth-child(even){
                background:#f2f2f2;
            }

            .btn{
                padding:8px 15px;
                color:white;
                text-decoration:none;
                border-radius:5px;
            }

            .add{
                background:#4CAF50;
            }

            .edit{
                background:#2196F3;
            }

            .delete{
                background:#f44336;
            }

        </style>

    </head>

    <body>

        <h2>Course List</h2>

        <a href="${pageContext.request.contextPath}/admin/add-course.jsp" class="btn add">
            + Add Course
        </a>

        <br><br>

        <table>

            <tr>
                <th>ID</th>
                <th>Code</th>
                <th>Name</th>
                <th>Duration</th>
                <th>Semester</th>
                <th>Fee</th>
                <th>Action</th>
            </tr>

            <%
                if (list != null) {
                    for (Course c : list) {
            %>

            <tr>

                <td><%=c.getId()%></td>
                <td><%=c.getCourseCode()%></td>
                <td><%=c.getCourseName()%></td>
                <td><%=c.getDuration()%></td>
                <td><%=c.getSemester()%></td>
                <td><%=c.getFee()%></td>

                <td>

                    <a href="${pageContext.request.contextPath}/EditCourseServlet?id=<%=c.getId()%>"
                       class="btn edit">
                        Edit
                    </a>

                    <a href="${pageContext.request.contextPath}/DeleteCourseServlet?id=<%=c.getId()%>"
                       class="btn delete"
                       onclick="return confirm('Delete this course?');">
                        Delete
                    </a>

                </td>

            </tr>

            <%
                    }
                }
            %>

        </table>

    </body>
</html>