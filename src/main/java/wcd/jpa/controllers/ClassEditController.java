package wcd.jpa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import wcd.jpa.entities.Classes;

import java.io.IOException;

@WebServlet(value = "/edit-class")
public class ClassEditController extends HttpServlet {
    private SessionFactory sessionFactory;

    @Override
    public void init() throws ServletException {
        try {
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml").buildSessionFactory();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Classes c = session.get(Classes.class, Integer.parseInt(entityId));
            session.getTransaction().commit();
            if (c != null) {
                req.setAttribute("c", c);
                req.getRequestDispatcher("classes/edit.jsp").forward(req, resp);
            } else
                resp.setStatus(404);
        } catch (Exception e) {
            resp.setStatus(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Classes c = session.get(Classes.class, Integer.parseInt(entityId));
            if (c != null) {
                c.setName(req.getParameter("name"));
                c.setRoom(req.getParameter("room"));
                c.setSemester(Integer.parseInt(req.getParameter("semester")));
                session.update(c);
            }
            session.getTransaction().commit();
            resp.sendRedirect("list-class");
        } catch (Exception e) {
            resp.setStatus(500);
        }
    }
}
