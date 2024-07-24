<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Customer</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #2193b0;
            margin-bottom: 30px;
        }
        form {
            display: grid;
            gap: 15px;
        }
        input[type="text"], input[type="email"], input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #2193b0;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #1c7430;
        }
        label {
            font-weight: bold;
            color: #2193b0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Customer Details</h1>
        <% Customer customer = (Customer) request.getAttribute("customer"); %>
        <form action="AdminController" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
            
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="<%= customer.getFullName() %>" required>
            
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="<%= customer.getAddress() %>" required>
            
            <label for="mobileNo">Mobile No:</label>
            <input type="text" id="mobileNo" name="mobileNo" value="<%= customer.getMobileNo() %>" required>
            
            <label for="emailId">Email ID:</label>
            <input type="email" id="emailId" name="emailId" value="<%= customer.getEmailId() %>" required>
            
            <label for="accountType">Account Type:</label>
            <input type="text" id="accountType" name="accountType" value="<%= customer.getAccountType() %>" required>
            
            <label for="dateOfBirth">Date of Birth:</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" value="<%= customer.getDateOfBirth() %>" required>
            
            <label for="idProof">ID Proof:</label>
            <input type="text" id="idProof" name="idProof" value="<%= customer.getIdProof() %>" required>
            
            <input type="submit" value="Update Customer">
        </form>
    </div>
</body>
</html>