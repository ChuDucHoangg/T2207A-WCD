package wcd.jpa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import wcd.jpa.entities.Student;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/list-student")
public class StudentController extends HttpServlet {
    private SessionFactory sessionFactory;

    @Override
    public void init() throws ServletException {
        try {
            sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        } catch (Exception e) {
            System.out.printf(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            List<Student> list = session.createQuery("SELECT DISTINCT s FROM Student s " +
                            "JOIN FETCH s.classes " +
                            "LEFT JOIN FETCH s.subjects", Student.class)
                    .getResultList();
            session.getTransaction().commit();
            req.setAttribute("students", list);
        }
        req.getRequestDispatcher("student/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Student student = session.get(Student.class, Integer.parseInt(entityId));
            if (student != null) {
                session.delete(student);
            }
            session.getTransaction().commit();
            resp.setStatus(200);
        } catch (Exception e) {
            resp.setStatus(403);
        }
    }
}
