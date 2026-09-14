<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sms.model.Attendance"%>

<%
    Attendance attendance = (Attendance) request.getAttribute("attendance");
%>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">

        <title>Edit Attendance</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>

    <body>

        <div class="container mt-5">

            <div class="card shadow">

                <div class="card-header bg-warning text-dark">
                    <h3>Edit Attendance</h3>
                </div>

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/UpdateAttendanceServlet" method="post">

                        <input type="hidden" name="id" value="<%=attendance.getId()%>">

                        <div class="mb-3">

                            <label class="form-label">Student ID</label>

                            <input
                                type="number"
                                name="studentId"
                                class="form-control"
                                value="<%=attendance.getStudentId()%>"
                                required>

                        </div>

                        <div class="mb-3">

                            <label class="form-label">Attendance Date</label>

                            <input
                                type="date"
                                name="attendanceDate"
                                class="form-control"
                                value="<%=attendance.getAttendanceDate()%>"
                                required>

                        </div>

                        <div class="mb-3">

                            <label class="form-label">Status</label>

                            <select name="status" class="form-select">

                                <option value="Present"
                                        <%=attendance.getStatus().equals("Present") ? "selected" : ""%>>
                                    Present
                                </option>

                                <option value="Absent"
                                        <%=attendance.getStatus().equals("Absent") ? "selected" : ""%>>
                                    Absent
                                </option>

                                <option value="Late"
                                        <%=attendance.getStatus().equals("Late") ? "selected" : ""%>>
                                    Late
                                </option>

                                <option value="Leave"
                                        <%=attendance.getStatus().equals("Leave") ? "selected" : ""%>>
                                    Leave
                                </option>

                            </select>

                        </div>

                        <button type="submit" class="btn btn-success">
                            Update Attendance
                        </button>

                        <a href="${pageContext.request.contextPath}/AttendanceListServlet"
                           class="btn btn-secondary">
                            Cancel
                        </a>

                    </form>

                </div>

            </div>

        </div>

    </body>
</html>