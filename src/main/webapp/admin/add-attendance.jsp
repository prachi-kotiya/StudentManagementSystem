<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sms.model.Student"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <title>Add Attendance</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>

    <body>

        <div class="container mt-5">

            <h2 class="mb-4">Add Attendance</h2>

            <form action="${pageContext.request.contextPath}/AddAttendanceServlet"
                  method="post">

                <!-- Student Dropdown -->
                <div class="mb-3">

                    <label class="form-label">Select Student</label>

                    <select name="studentId" class="form-select" required>

                        <option value="">-- Select Student --</option>

                        <%
                            List<Student> studentList
                                    = (List<Student>) request.getAttribute("studentList");

                            if (studentList != null) {

                                for (Student s : studentList) {
                        %>

                        <option value="<%= s.getId()%>">
                            <%= s.getStudentId()%> - <%= s.getFullName()%>
                        </option>

                        <%
                                }
                            }
                        %>

                    </select>

                </div>

                <!-- Attendance Date -->
                <div class="mb-3">

                    <label class="form-label">Attendance Date</label>

                    <input
                        type="date"
                        name="attendanceDate"
                        class="form-control"
                        required>

                </div>

                <!-- Attendance Status -->
                <div class="mb-3">

                    <label class="form-label">Status</label>

                    <select
                        name="status"
                        class="form-select"
                        required>

                        <option value="Present">Present</option>

                        <option value="Absent">Absent</option>

                        <option value="Late">Late</option>

                        <option value="Leave">Leave</option>

                    </select>

                </div>

                <button type="submit" class="btn btn-success">
                    Save Attendance
                </button>

                <a href="${pageContext.request.contextPath}/AttendanceListServlet"
                   class="btn btn-secondary">
                    Back
                </a>

            </form>

        </div>

    </body>

</html>