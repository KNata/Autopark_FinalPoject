package Servlets;

import DAO.VisitorDAO;
import Model.Visitor;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicReference;

import static java.util.Objects.nonNull;

@WebServlet(name = "login", urlPatterns = {"/index"})
public class AuthorizationServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String language = request.getParameter("language");

        @SuppressWarnings("unchecked")
        final AtomicReference<VisitorDAO> visitorDAO = (AtomicReference<VisitorDAO>) request.getServletContext()
                .getAttribute("visitorDAO");
        final HttpSession session = request.getSession();

        if (login != null && password != null) {
            if ((visitorDAO.get().findByLoginAndPassword(login, password)) != null) {
                session.setAttribute("login", login);
                session.setAttribute("password", password);
          //      session.setAttribute("language", "");
                if (visitorDAO.get().getRoleByLoginAndPassword(login, password) == Visitor.ROLE.ADMIN) {
                    session.setAttribute("role", Visitor.ROLE.ADMIN);
                    moveToMenu(request, response, Visitor.ROLE.ADMIN);
                } else if (visitorDAO.get().getRoleByLoginAndPassword(login, password) == Visitor.ROLE.DRIVER) {
                    session.setAttribute("role", Visitor.ROLE.DRIVER);
                    moveToMenu(request, response, Visitor.ROLE.DRIVER);
                }
                response.sendRedirect("/");
            }
        } else {
            response.sendRedirect("/index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/index.jsp");
    }

    private void moveToMenu(HttpServletRequest request, HttpServletResponse response, final Visitor.ROLE role) throws ServletException, IOException{
        if (role.equals(Visitor.ROLE.ADMIN)) {
            response.sendRedirect("/views/adminMainPage.jsp");
        } else if (role.equals(Visitor.ROLE.DRIVER)) {
            response.sendRedirect("/views/driverMainPage.jsp");
        }

    }
}
