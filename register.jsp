<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.example.cab.DBConnection" %>
<html lang="en" data-bs-theme="dark">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-tofit=no">
 <link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
rel="stylesheet" integrity="sha384-
T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
crossorigin="anonymous">
 <script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
crossorigin="anonymous"></script>
 <title>Vehicle Registration Form</title>
</head>
<body>
 <nav class="navbar navbar-expand-lg bg-body-tertiary">
 <div class="container-fluid">
 <a class="navbar-brand" href="./">Xpress Taxi</a>
 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" databs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" arialabel="Toggle navigation">
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
 <a class="nav-link active" href="./register">Register Vehicle</a>
 </li>
 </ul>
 </div>
 </div>
 </nav>
 <div class="container mt-4">
 <div class = "row">
 <div class = "col-md-4">
 <h2 class="mb-4">Vehicle Registration Form</h2>
 <form method="post">
 <div class="form-group mb-2">
 <label for="registrationNumber">Registration Number:</label>
 <input type="text" class="form-control" name="registrationNumber"
required>
 </div>
 <div class="form-group mb-2">
 <label for="brand">Brand:</label>
 <input type="text" class="form-control" name="brand" required>
 </div>
 <div class="form-group mb-2">
 <label for="model">Model:</label>
 <input type="text" class="form-control" name="model" required>
 </div>
 <div class="form-group mb-2">
 <label for="capacity">Capacity:</label>
 <input type="number" class="form-control" name="capacity" required>
 </div>
 <button type="submit" class="btn btn-primary mt-2">Register
Vehicle</button>
 </form>
 </div>
 </div>
 </div>
 <%
 if (request.getMethod().equalsIgnoreCase("post")) {
 String registrationNumber = request.getParameter("registrationNumber");
 String brand = request.getParameter("brand");
 String model = request.getParameter("model");
 int capacity = Integer.parseInt(request.getParameter("capacity"));
 Connection connection = null;
 Statement statement = null;
 try {
 connection = DBConnection.getConnection();
 statement = connection.createStatement();
 String insertVehicleQuery = "INSERT INTO vehicles (registration_number,
brand, model, capacity) VALUES (?, ?, ?, ?)";
 PreparedStatement vehicleStatement =
connection.prepareStatement(insertVehicleQuery);
 vehicleStatement.setString(1, registrationNumber);
 vehicleStatement.setString(2, brand);
 vehicleStatement.setString(3, model);
 vehicleStatement.setInt(4, capacity);
 vehicleStatement.executeUpdate();
 vehicleStatement.close();
 out.println("Vehicle registration successful!");
 }
 catch (SQLException e) {
 out.println("Error: " + e.getMessage());
 }
 finally {
 try {
 if (statement != null) statement.close();
 if (connection != null) connection.close();
 } catch (SQLException e) {
 e.printStackTrace();
 }
 }
 }
 %>
</body>
</html>
