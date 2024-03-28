package wcd.jpa.controllers;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import wcd.jpa.entities.Classes;
import wcd.jpa.entities.Student;
import wcd.jpa.entities.Subject;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@WebServlet("/create-student")
public class StudentCreateController extends HttpServlet {
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
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            List<Classes> list = session.createQuery("FROM Classes", Classes.class).getResultList();
            List<Subject> subject = session.createQuery("FROM Subject ", Subject.class).getResultList();
            session.getTransaction().commit();
            req.setAttribute("classes", list);
            req.setAttribute("subjects", subject);
        }
        req.getRequestDispatcher("student/create.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student student = new Student();
        student.setName(req.getParameter("name"));
        student.setEmail(req.getParameter("email"));
        student.setAddress(req.getParameter("address"));
        int classId = Integer.parseInt(req.getParameter("class_id"));
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();

            //get classes
            Classes classes = session.get(Classes.class, classId);
            student.setClasses(classes);

            //get subjects
            List<Integer> s_ids = Arrays.stream(req.getParameterValues("subject_id[]"))
                    .map(Integer::parseInt).collect(Collectors.toList());
            Query<Subject> query = session.createQuery("FROM Subject WHERE id IN (:ids)", Subject.class);
            query.setParameter("ids", s_ids);
            List<Subject> subjects = query.getResultList();
            student.setSubjects(subjects);

            session.save(student);
            session.getTransaction().commit();

            // send email to student
            String senderEmail = "hoangcdth2205001@fpt.edu.vn ";
            String passwordEmail = "oiww fijg ntwf schg";

            // cấu hình kết nối
            Properties prop = new Properties();
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
            prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            prop.put("mail.smtp.starttls.enable", "true");
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "587");

            javax.mail.Session mailSession = javax.mail.Session.getInstance(prop,
                    new Authenticator()  {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(senderEmail, passwordEmail);
                        }
                    }
            );
            try {
                Message message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(senderEmail));
                message.setRecipient(Message.RecipientType.TO,
                        new InternetAddress(student.getEmail()));
                message.setSubject("Create new a student!");

                // set Content mail as HTML
                req.setAttribute("student",student);
                RequestDispatcher dispatcher = req.getRequestDispatcher("mails/mail.jsp");
                StringWriter stringWriter = new StringWriter();
                PrintWriter writer = new PrintWriter(stringWriter);
                HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper(resp){
                    public PrintWriter getWriter(){
                        return writer;
                    }
                };
                dispatcher.include(req,wrapper);
                String content = stringWriter.toString();
                message.setContent(content,"text/html");

                // gui email
                Transport.send(message);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("list-student");
    }


}