<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
</head>
<body>
<h2>Login</h2>
<%
    String error = request.getParameter("error");
    if ("true".equals(error)) {
%>
<p style="color:red;">Invalid username or password!</p>
<%
    }
%>
<form method="post" action="hello-servlet">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>

    <button type="submit">Login</button>
</form>
</body>
</html>
