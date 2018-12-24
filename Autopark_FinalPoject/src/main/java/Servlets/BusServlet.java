package Servlets;

import DAO.BusDAO;
import Model.Bus;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/*
@WebServlet(name = "busServlet", urlPatterns = "/BusServlet")
public class BusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void addBusForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("AddNewBusPage.jsp");
        dispatcher.forward(request, response);
    }

    private void addNewDriver(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String busID = request.getParameter("busID");
        String busModel = request.getParameter("busModel");
        int maxCountOfPassangers = Integer.parseInt(request.getParameter("maxPassegers"));
        int miles = Integer.parseInt(request.getParameter("miles"));
        boolean passedService = Boolean.parseBoolean(request.getParameter("maintance"));

        Bus theBus = Bus.newBuilder().setBusID(busID).setBusModel(busModel).setmaxCountOfPassagers(maxCountOfPassangers)
                .setMiles(miles).setPassedService(passedService).build();

        BusDAO busDAO = new BusDAO();

        if (theBus != null) {
            busDAO.addRecord(theBus);
            response.sendRedirect("list");
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("errorPage.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void listAllBuses(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        BusDAO busDAO = new BusDAO();
        ArrayList<Bus> busList = busDAO.findAll();
        request.setAttribute("busList", busList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("seeABusesPage.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        BusDAO busDAO = new BusDAO();
        String busID = request.getParameter("busID");
        Bus neededBus = busDAO.findByID(busID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AddNewBusPage.jsp");
        request.setAttribute("bus", neededBus);
        dispatcher.forward(request, response);
    }

    private void editBus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String busModel = request.getParameter("busModel");
        BusDAO busDAO = new BusDAO();
        //Driver theDriver = driverDAO.update();
    }

    private void deleteBus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        BusDAO busDAO = new BusDAO();
        String busID = request.getParameter("busID");
        boolean wasDeleted = busDAO.deleteRecord(busID);
        response.sendRedirect("list");
    }


}
*/