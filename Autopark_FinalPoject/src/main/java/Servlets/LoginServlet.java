package Servlets;

import DAO.VisitorDAO;
import Model.Visitor;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        // get request parameters for userID and password
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        VisitorDAO visitorDAO = new VisitorDAO();
        Visitor theVisitor = visitorDAO.findByLoginAndPassword(login, password);
        if(theVisitor != null) {
            System.out.println("Hi");
            HttpSession session = request.getSession();
            System.out.println("Hi 2");
            session.setAttribute("user", login);
            System.out.println("Hi 3");
            //setting session to expiry in 30 mins
            session.setMaxInactiveInterval(30*60);
            System.out.println("Hi 4");
            Cookie userName = new Cookie("user", login);
            userName.setMaxAge(30*60);
            System.out.println("Hi 7");
            response.sendRedirect("/views/adminView/seeAllDrivers.jsp");
            System.out.println(theVisitor.getVisitorRole());
            response.addCookie(userName);
            if (theVisitor.getRole() == Visitor.ROLE.ADMIN) {
                System.out.println("Hi 5");
                response.sendRedirect("/adminView/adminMainPage.jsp");
            } else if (theVisitor.getRole() == Visitor.ROLE.DRIVER) {
                System.out.println("Hi 6");
                response.sendRedirect("/main/webapp/views/userView/driverMainPage.jsp");
            }
        }else{
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            PrintWriter out= response.getWriter();
            out.println("<font color=red>Either user name or password is wrong.</font>");
            rd.include(request, response);
        }

    }

}

