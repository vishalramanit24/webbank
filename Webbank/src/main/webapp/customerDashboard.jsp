<%@ page import="dao.CustomerDao" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("login.jsp?error=SessionExpired");
        return;
    }
%>

<%
String error = request.getParameter("error");
String success = request.getParameter("success");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        p {
            background-color: #fff;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 15px;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="number"], input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #0056b3;
        }
        #logoutForm {
            text-align: center;
        }
        #logoutForm button {
            background-color: #dc3545;
        }
        #logoutForm button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<h1>Welcome, <%= customer.getFullName() %></h1>
<% if (error != null) { %>
    <p style="color: red;">
        <% if ("PasswordsMismatch".equals(error)) { %>
            New passwords do not match.
        <% } else if ("InvalidCurrentPassword".equals(error)) { %>
            Current password is incorrect.
        <% } else if ("PasswordChangeFailed".equals(error)) { %>
            Failed to change password. Please try again.
        <% } %>
    </p>
<% } %>

<% if ("PasswordChanged".equals(success)) { %>
    <p style="color: green;">Password changed successfully.</p>
<% } %>
<p>Account Number: <%= customer.getAccountNo() %></p>
<p>Balance: <%= customer.getBalance() %></p>

<form action="CustomerController" method="post">
    <input type="hidden" name="action" value="deposit">
    <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
    <label for="amount">Deposit Amount:</label>
    <input type="number" id="amount" name="amount" required>
    <button type="submit">Deposit</button>
</form>

<form action="CustomerController" method="post">
    <input type="hidden" name="action" value="withdraw">
    <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
    <label for="amount">Withdraw Amount:</label>
    <input type="number" id="amount" name="amount" required>
    <button type="submit">Withdraw</button>
</form>

<form action="CustomerController" method="post">
    <input type="hidden" name="action" value="transfer">
    <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
    <label for="transferAmount">Transfer Amount:</label>
    <input type="number" id="transferAmount" name="transferAmount" required>
    <label for="transferAccountNo">Transfer Account No:</label>
    <input type="text" id="transferAccountNo" name="transferAccountNo" required>
    <button type="submit">Transfer</button>
</form>

<form action="CustomerController" method="post">
    <input type="hidden" name="action" value="viewTransactions">
    <button type="submit">View Transactions</button>
</form>

<form action="CustomerController" method="post">
    <input type="hidden" name="action" value="changePassword">
    <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
    <label for="currentPassword">Current Password:</label>
    <input type="password" id="currentPassword" name="currentPassword" required>
    <label for="newPassword">New Password:</label>
    <input type="password" id="newPassword" name="newPassword" required>
    <label for="confirmPassword">Confirm New Password:</label>
    <input type="password" id="confirmPassword" name="confirmPassword" required><br>
    <button type="submit">Change Password</button>
</form>

<form id="logoutForm" action="CustomerController" method="post">
    <input type="hidden" name="action" value="logout">
    <button type="submit">Logout</button>
</form>

</body>
</html>
