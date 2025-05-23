<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%
    HttpSession session = request.getSession(false); // Don't create a new session
    String username = null;

    if (session == null) {
        // Session expired or not logged in → redirect to login page
        response.sendRedirect("index.jsp");
        return; // Stop further JSP execution
    } else {
        username = (String) session.getAttribute("username");
        System.out.println("Creation Time : " + session.getCreationTime());
        System.out.println("Last Accessed time : " + session.getLastAccessedTime());
    }
%>
<html>
<head>
    <title>Session Check</title>
</head>
<body>

<h1>Hello, world <%= username %></h1>

</body>
</html>
