<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.CustomerDao"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Customer"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }
        .container {
            width: 90%;
            margin: 2rem auto;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 2rem;
            font-weight: 300;
            letter-spacing: 2px;
        }
        .action-buttons {
            display: flex;
            justify-content: space-around;
            margin-bottom: 2rem;
        }
        .btn {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 25px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .btn-primary { background-color: #4CAF50; }
        .btn-primary:hover { background-color: #45a049; }
        .btn-danger { background-color: #f44336; }
        .btn-danger:hover { background-color: #da190b; }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr { background-color: #f8f8f8; }
        tr:hover { background-color: #f1f1f1; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        
        <div class="action-buttons">
            <a href="createCustomer.jsp" class="btn btn-primary">Create Customer</a>
            <a href="deleteCustomer.jsp" class="btn btn-primary">Delete Customer</a>
            <form action="LogoutController" method="post" style="display:inline;">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Account No</th>
                    <th>Full Name</th>
                    <th>Email ID</th>
                    <th>Account Type</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                CustomerDao customerDao = new CustomerDao();
                List<Customer> customers = customerDao.getAllCustomers();
                for (Customer customer : customers) {
                %>
                <tr>
                    <td><%= customer.getAccountNo() %></td>
                    <td><%= customer.getFullName() %></td>
                    <td><%= customer.getEmailId() %></td>
                    <td><%= customer.getAccountType() %></td>
                    <td>
                        <form action="AdminController" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
                            <button type="submit" class="btn btn-primary">Edit</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>