package Servlets.filter;

import Model.Visitor;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/views/adminView/*"})
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false);
        if (isLogged(session)) {
            Visitor.ROLE requestedRole = (Visitor.ROLE)session.getAttribute("role");
            if (requestedRole != Visitor.ROLE.ADMIN) {
                response.sendRedirect("accessDenied.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    public void destroy() {

    }

    public boolean isLogged(HttpSession session) {
        return (session != null && session.getAttribute("login") != null && session.getAttribute("password") != null);
    }
}
