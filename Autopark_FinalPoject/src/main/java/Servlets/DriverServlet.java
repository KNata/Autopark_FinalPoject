package Servlets;

import DAO.DriverDAO;
import Model.Driver;
import Servlets.commands.driverCommands.AddDriver;
import Servlets.commands.driverCommands.DeleteDriver;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
/*
@WebServlet(name = "driverServlet", urlPatterns = "/DriverServlet")
public class DriverServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        try {
            switch (action) {
                case "/new":
                    addDriverForm(request, response);
                    break;
                case "/insert":
                    addDriverForm(request, response);
                    break;
                case "/delete":
                    deleteDriver(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    editDriver(request, response);
                    break;
                default:
                    listAllDrivers(request, response);
                    break;
            }
        } catch (ServletException ex) {
            throw new ServletException(ex);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private void addDriverForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("AddNewDriverPage.jsp");
        dispatcher.forward(request, response);
    }

    private void addNewDriver(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AddDriver addDriver = new AddDriver();
        addDriver.execute(request, response);
        response.sendRedirect("list");
    }

    private void listAllDrivers(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        DriverDAO driverDAO = new DriverDAO();
        ArrayList<Driver> driverList = driverDAO.findAll();
        request.setAttribute("driverList", driverList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("seeAllDrivers.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        DriverDAO driverDAO = new DriverDAO();
        String driverID = request.getParameter("driverID");
        Driver neededDriver = driverDAO.findByID(driverID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AddNewDriverPage.jsp");
        request.setAttribute("diver", neededDriver);
        dispatcher.forward(request, response);
    }

    private void editDriver(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String driverName = request.getParameter("driverName");
        DriverDAO driverDAO = new DriverDAO();
        //Driver theDriver = driverDAO.update();
    }

    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        DriverDAO driverDAO = new DriverDAO();
        String driverID = request.getParameter("driverID");
        boolean wasDeleted = driverDAO.deleteRecord(driverID);
        response.sendRedirect("list");
    }


}
*/