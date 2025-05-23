<%--
  Created by IntelliJ IDEA.
  User: tenzind
  Date: 22-05-2025
  Time: 06:25 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session = request.getSession(false); // Don't create a new session
    String username = null;
    int score;

    if (session == null || session.getAttribute("username") == null || session.getAttribute("score") == null) {
        response.sendRedirect("index.jsp");
        return;
    } else {
        username = (String) session.getAttribute("username");
        score = (int) session.getAttribute("score");
    }
%>
<html>
<head>
    <title>Test Report</title>
</head>
<body>
<h1><%= username %> report </h1>
<h1>Score <%= score %></h1>
</body>
</html>
