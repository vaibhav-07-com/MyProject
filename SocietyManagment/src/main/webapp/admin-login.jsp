<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    
        <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Roboto', sans-serif;
            background: url('admin/img/971.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .login-box {
            width: 100%;
            max-width: 380px;
            padding: 40px;
            background-color: rgba(0, 0, 0, 0.75);
            border-radius: 10px;
            text-align: center;
            color: #fff;
        }
        .login-box h2 {
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 24px;
        }
        .login-box .textbox {
            position: relative;
            margin-bottom: 30px;
        }
        .login-box .textbox input {
            width: 100%;
            padding: 10px;
            background: none;
            border: none;
            border-bottom: 2px solid #fff;
            outline: none;
            color: #fff;
            font-size: 18px;
        }
        .login-box .textbox i {
            position: absolute;
            left: 100%;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
        }
        .login-box .btn {
            width: 100%;
            background-color: #03a9f4;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            cursor: pointer;
        }
        .login-box .btn:hover {
            background-color: #0288d1;
        }
        .login-box .bottom-text {
            margin-top: 20px;
            font-size: 14px;
        }
        .login-box .bottom-text a {
            color: #03a9f4;
            text-decoration: none;
        }
        .login-box .bottom-text a:hover {
            text-decoration: underline;
        }
        .login-btn {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .login-btn:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h1>Admin Login</h1>
        <% String errorMessage = (String) request.getAttribute("msg"); %>
        <% if (errorMessage != null) { %>
            <div class="error"><%= errorMessage %></div>
        <% } %>
        <form action="admin" method="post">
            <div class="textbox">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="textbox">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button name=action value=login type="submit" class="login-btn">Login</button>
            
            <div class="bottom-text">
                <hr />
                <a href="../index.jsp">Back to Home Page</a>
            </div>
        </form>
    </div>
</body>
</html>
