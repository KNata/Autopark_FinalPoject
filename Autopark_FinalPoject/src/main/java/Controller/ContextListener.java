package Controller;

import DAO.VisitorDAO;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.concurrent.atomic.AtomicReference;

public class ContextListener implements ServletContextListener {

    private AtomicReference<VisitorDAO> visitorDAO;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        visitorDAO = new AtomicReference<>(new VisitorDAO());

        final ServletContext servletContext = servletContextEvent.getServletContext();
        servletContext.setAttribute("visitorDAO", visitorDAO);

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        visitorDAO = null;
    }
}
