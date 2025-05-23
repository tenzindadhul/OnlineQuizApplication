package com.example.demo1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "SubmitAnswer3Servlet", value = "/SubmitAnswer3Servlet")
public class AnswerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession(false);
        if (httpSession == null || httpSession.getAttribute("username") == null || httpSession.getAttribute("score") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        int score = (int) httpSession.getAttribute("score");
        Map<String, String> questionAndAnswers = (HashMap<String, String>) httpSession.getAttribute("questionAndAnswer");
        for (int i = 0; i < questionAndAnswers.size(); i++) {
            String question = request.getParameter("question" + (i+1));
            String answer = request.getParameter("answer" + (i+1));
            if (questionAndAnswers.get(question).equals(answer))
            {
                score++;
            }
        }
        httpSession.setAttribute("score", score);
        System.out.println("User : " + httpSession.getAttribute("username")+ ", Session ID " + httpSession.getId());
        response.sendRedirect("report.jsp");
    }
}
