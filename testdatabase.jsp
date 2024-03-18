<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.cab.DBConnection" %>
<html data-bs-theme="dark">
<head>
 <meta charset="UTF-8">
 <title>Your Bookings - Cab Booking System</title>
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
 <a class="nav-link active" aria-current="page" href="./">Book</a>
 </li>
 <li class="nav-item">
 <a class="nav-link" href="./cancel">Manage</a>
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
 <h2>Your Bookings</h2>
 <%
 Connection connection = null;
 Statement statement = null;
 ResultSet resultSet = null;
 try {
 connection = DBConnection.getConnection();
 statement = connection.createStatement();
 if (request.getMethod().equalsIgnoreCase("post")) {
 String name = request.getParameter("name");
 String mobile = request.getParameter("mobile");
 String pickup = request.getParameter("pickup");
 String destination = request.getParameter("destination");
 String vehicle = request.getParameter("vehicle");
 connection = DBConnection.getConnection();
 statement = connection.createStatement();
 String sql = "INSERT INTO bookings (name, mobile, pickup, destination,
vehicle) VALUES ('" + name + "','" + mobile + "','" + pickup + "', '" + destination +
"', '" + vehicle + "')";
 statement.executeUpdate(sql);
 resultSet = statement.executeQuery("SELECT * FROM bookings WHERE mobile
= '" + mobile + "'");
 }
 %>
 <div class="table-responsive mt-4">
 <table class="table table-bordered table-striped">
 <thead class="thead-dark">
 <tr>
 <th>ID</th>
<th>Name</th>
<th>Mobile</th>
<th>Pickup</th>
<th>Destination</th>
<th>Vehicle</th>
 </tr>
 </thead>
 <tbody>
 <%
 while (resultSet.next()) {
 int id = resultSet.getInt(1);
String name = resultSet.getString(2);
String mobile = resultSet.getString(3);
String pickup = resultSet.getString(4);
String destination = resultSet.getString(5);
String vehicle = resultSet.getString(6);
 out.println("<tr>");
out.println("<td>" + id + "</td>");
 out.println("<td>" + name + "</td>");
 out.println("<td>" + mobile + "</td>");
 out.println("<td>" + pickup + "</td>");
 out.println("<td>" + destination + "</td>");
 out.println("<td>" + vehicle + "</td>");
 out.println("</tr>");
 }
 %>
 </tbody>
 </table>
 </div>
 <%
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
 %>
</div>
</body>
</html>
