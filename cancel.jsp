<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.cab.DBConnection" %>
<html lang="en" data-bs-theme="dark">
<head>
 <meta charset="UTF-8">
 <title>Cab Booking System</title>
 <link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
rel="stylesheet" integrity="sha384-
T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
crossorigin="anonymous">
 <script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
 <div class="container-fluid">
 <a class="navbar-brand" href="./">Xpress Taxi</a>
 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bstarget="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle
navigation">
 <span class="navbar-toggler-icon"></span>
 </button>
 <div class="collapse navbar-collapse" id="navbarNav">
 <ul class="navbar-nav">
 <li class="nav-item">
 <a class="nav-link" aria-current="page" href="./">Book</a>
 </li>
 <li class="nav-item">
 <a class="nav-link active" href="./cancel">Manage</a>
 </li>
 <li class="nav-item">
 <a class="nav-link" href="./bookings">View Bookings</a>
 </li>
 <li class="nav-item">
 <a class="nav-link" href="./book">Calculate Fare</a>
 </li>
 <li class="nav-item">
 <a class="nav-link" href="./register">Register Vehicle</a>
 </li>
 </ul>
 </div>
 </div>
</nav>
<div class="container mt-5">
<div class = "row">
<div class = "col-md-4">
 <h2>Manage Bookings</h2>
 <form method="post" class="mt-3">
 <div class="mb-3">
 <label for="mobile" class="form-label">Mobile:</label>
 <input type="text" id="mobile" name="mobile" class="form-control" required>
 </div>
 <div class="mb-3">
 <label for="id" class="form-label">Booking ID:</label>
 <input type="number" id="id" name="id" class="form-control" required>
 </div>
 <button type="submit" class="btn btn-danger mt-2">Cancel Ride</button>
 </form>
 <%
 if (request.getMethod().equalsIgnoreCase("post")) {
 String mobile = request.getParameter("mobile");
 int id = Integer.parseInt(request.getParameter("id"));
 Connection connection = null;
 Statement statement = null;
 ResultSet resultSet = null;
 try {
 connection = DBConnection.getConnection();
 statement = connection.createStatement();
 String sql = "SELECT * FROM bookings WHERE mobile = '" + mobile + "'
AND id = " + id;
 resultSet = statement.executeQuery(sql);
 out.println("<h2 class='mt-5 mb-3'>Canceled Ride:</h2>");
 out.println("<table class='table table-bordered table-striped'>");
 out.println("<thead class='theaddark'><tr><th>ID</th><th>Name</th><th>Mobile</th><th>Pickup</th><th>Destination</th><th
>Vehicle</th></tr></thead><tbody>");
 while (resultSet.next()) {
 int id1 = resultSet.getInt(1);
String name = resultSet.getString(2);
String mobilen = resultSet.getString(3);
String pickup = resultSet.getString(4);
String destination = resultSet.getString(5);
String vehicle = resultSet.getString(6);
 out.println("<tr>");
out.println("<td>" + id1 + "</td>");
 out.println("<td>" + name + "</td>");
 out.println("<td>" + mobilen + "</td>");
 out.println("<td>" + pickup + "</td>");
 out.println("<td>" + destination + "</td>");
 out.println("<td>" + vehicle + "</td>");
 out.println("</tr>");
 }
 out.println("</tbody></table>");
 String delete = "DELETE FROM bookings WHERE id =" + id;
 statement.executeUpdate(delete);
 } catch (Exception e) {
 e.printStackTrace();
 } finally {
 try {
 if (resultSet != null) resultSet.close();
 if (statement != null) statement.close();
 if (connection != null) connection.close();
 } catch (SQLException e) {
 e.printStackTrace();
 }
 }
 }
 %>
 </div>
 </div>
 </div>
</body>
</html>
