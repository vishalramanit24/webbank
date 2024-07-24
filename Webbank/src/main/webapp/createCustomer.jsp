<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Customer</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #ff9966, #ff5e62);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .form-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
            width: 100%;
            max-width: 500px;
        }
        h1 {
            color: #ff5e62;
            text-align: center;
            margin-bottom: 2rem;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 0.5rem;
            color: #333;
        }
        input, select {
            padding: 0.8rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }
        button {
            padding: 1rem;
            background-color: #ff5e62;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #ff4b4e;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Create New Customer</h1>
        <form action="AdminController" method="post">
            <input type="hidden" name="action" value="create">
            
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>
            
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            
            <label for="mobileNo">Mobile No:</label>
            <input type="text" id="mobileNo" name="mobileNo" required>
            
            <label for="emailId">Email ID:</label>
            <input type="email" id="emailId" name="emailId" required>
            
            <label for="accountType">Account Type:</label>
            <select id="accountType" name="accountType">
                <option value="Saving">Saving</option>
                <option value="Current">Current</option>
            </select>
            
            <label for="initialBalance">Initial Balance:</label>
            <input type="number" id="initialBalance" name="initialBalance" min="1000" required>
            
            <label for="dateOfBirth">Date of Birth:</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" required>
            
            <label for="idProof">ID Proof:</label>
            <input type="text" id="idProof" name="idProof" required>
            
            <button type="submit">Create Customer</button>
        </form>
    </div>
</body>
</html>