package wcd.jpa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/liked-student")
public class LikedStudentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<Integer> likedStudents = (List<Integer>) session.getAttribute("likedStudents");
        if (likedStudents == null) {
            likedStudents = new ArrayList<>();
        }
        req.setAttribute("likedStudents", likedStudents);
        req.getRequestDispatcher("student/liked.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Xử lý yêu cầu POST từ trang danh sách sinh viên (list.jsp) ở đây
        String studentId = req.getParameter("id");

        HttpSession session = req.getSession();
        List<Integer> likedStudents = (List<Integer>) session.getAttribute("likedStudents");
        if (likedStudents == null) {
            likedStudents = new ArrayList<>();
            session.setAttribute("likedStudents", likedStudents);
        }
        likedStudents.add(Integer.parseInt(studentId));

        resp.getWriter().write("Student liked successfully!");
    }
}

