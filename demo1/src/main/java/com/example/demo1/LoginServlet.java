package com.example.demo1;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.*;
import java.util.HashMap;
import java.util.Map;


public class LoginServlet extends HttpServlet {
    private String message;
    private Map<String, String> authorisedUsers = new HashMap<String, String>();
    private Map<String, String> questionAndAnswers = new HashMap<>();

    public void init() {

        message = "Hello World Tenzin Dadhul!";

        authorisedUsers.put("tenzin", "dadhul");
        authorisedUsers.put("dechen", "lhamo");

        questionAndAnswers.put("What is the capital of France?", "Paris");
        questionAndAnswers.put("What is the capital of Germany?", "Berlin");
        questionAndAnswers.put("What is the capital of England?", "London");

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("<img src=\"images/dechenlhamo.jpg\" alt=\"A cute dog\" width=\"300\" height=\"200\"></br>");
        out.println("<img src=\"https://www.empoweringvision.org/wp-content/uploads/2021/01/WhatsApp-Image-2021-01-14-at-6.01.23-PM-1-e1611832524892.jpeg\" alt=\"A cute dog\" width=\"300\" height=\"200\"></br>");
        out.println("</body></html>");

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (authorisedUsers.containsKey(username) && authorisedUsers.get(username).equals(password)) {
            // dispatcher = request.getRequestDispatcher("/successful.jsp");

           // dispatcher.forward(request, response);
             HttpSession httpSession = request.getSession();
             httpSession.setAttribute("username", username);
             httpSession.setAttribute("score", 0);
             httpSession.setAttribute("questionAndAnswer", questionAndAnswers);
             response.sendRedirect("questions.jsp");
        } else {
            // dispatcher = request.getRequestDispatcher("/long-error.jsp");
            // dispatcher.forward(request, response);
            response.sendRedirect("index.jsp?error=true");
        }

    }

    public void destroy() {
    }
}