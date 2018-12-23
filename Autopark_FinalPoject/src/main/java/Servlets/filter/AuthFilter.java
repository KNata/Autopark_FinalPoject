package Controller.filter;

import DAO.VisitorDAO;
import Model.Visitor;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicReference;

import static java.util.Objects.nonNull;

@WebFilter("/autentificationFilter")
public class AuthFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(final ServletRequest servletRequest, final ServletResponse servletResponse, final FilterChain filterChain) throws  ServletException, IOException{
        final HttpServletRequest request = (HttpServletRequest) servletRequest;
        final HttpServletResponse response = (HttpServletResponse) servletResponse;

        final String login = request.getParameter("login");
        final String password = request.getParameter("password");

        @SuppressWarnings("unchecked")
        final AtomicReference<VisitorDAO> visitorDAO = (AtomicReference<VisitorDAO>) request.getServletContext()
                .getAttribute("visitorDAO");
        final HttpSession session = request.getSession();

        if (nonNull(session) && nonNull(session.getAttribute("login")) && nonNull(session.getAttribute("password"))) {
            final Visitor.ROLE role = (Visitor.ROLE) session.getAttribute("role");
            moveToMenu(request, response, role);
        } else if (visitorDAO.get().findByLogin(login) != null) {
            final Visitor.ROLE role = visitorDAO.get().getRoleByLoginAndPassword(login, password);
            request.getSession().setAttribute("login", login);
            request.getSession().setAttribute("password", password);
            request.getSession().setAttribute("role", role);
            moveToMenu(request, response, role);
        } else {
            moveToMenu(request, response, Visitor.ROLE.UNKNOWN);
        }
    }

    @Override
    public void destroy() {

    }

    private void moveToMenu(HttpServletRequest request, HttpServletResponse response, final Visitor.ROLE role) throws ServletException, IOException{
        if (role.equals(Visitor.ROLE.ADMIN)) {
            request.getRequestDispatcher("/WEB-INF/views/adminMainPage.jsp").forward(request, response);
        } else if (role.equals(Visitor.ROLE.DRIVER)) {
            request.getRequestDispatcher("/WEB-INF/views/driverMainPage.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/views/errorPage.jsp").forward(request, response);
        }

    }
}
