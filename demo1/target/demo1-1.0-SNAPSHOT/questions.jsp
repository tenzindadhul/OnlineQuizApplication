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

  if (session == null) {
    // Session expired or not logged in → redirect to login page
    response.sendRedirect("index.jsp");
    return; // Stop further JSP execution
  }
  username = (String) session.getAttribute("username");
%>
<html>
<head>
  <title>Quiz Question</title>
</head>
<body>

<h2>--List of questions--</h2>
<h3>Username : <%= username %></h3>
<form method="post" action="submit-answer">
  <label>What is the capital of France?</label><br>
  <input type="hidden" name="question1" value="What is the capital of France?"><br>
  <input type="radio" id="paris-question1" name="answer1" value="Paris" required>
  <label for="paris-question1">Paris</label><br>
  <input type="radio" id="london-question1" name="answer1" value="London">
  <label for="london-question1">London</label><br>
  <input type="radio" id="berlin-question1" name="answer1" value="Berlin">
  <label for="berlin-question1">Berlin</label><br>
  <input type="radio" id="rome-question1" name="answer1" value="Rome">
  <label for="rome-question1">Rome</label><br><br>

  <label >What is the capital of Germany?</label><br>
  <input type="hidden" name="question2" value="What is the capital of Germany?"><br>
  <input type="radio" id="paris-question2" name="answer2" value="Paris" required>
  <label for="paris-question2">Paris</label><br>
  <input type="radio" id="london-question2" name="answer2" value="London">
  <label for="london-question2">London</label><br>
  <input type="radio" id="berlin-question2" name="answer2" value="Berlin">
  <label for="berlin-question2">Berlin</label><br>
  <input type="radio" id="rome-question2" name="answer2" value="Rome">
  <label for="rome-question2">Rome</label><br><br>

  <label >What is the capital of England?</label><br>
  <input type="hidden" name="question3" value="What is the capital of England?"><br>
  <input type="radio" id="paris-question3" name="answer3" value="Paris" required>
  <label for="paris-question3">Paris</label><br>
  <input type="radio" id="london-question3" name="answer3" value="London">
  <label for="london-question3">London</label><br>
  <input type="radio" id="berlin-question3" name="answer3" value="Berlin">
  <label for="berlin-question3">Berlin</label><br>
  <input type="radio" id="rome-question3" name="answer3" value="Rome">
  <label for="rome-question3">Rome</label><br><br>

  <button type="submit">Submit</button>
</form>

</body>
</html>

