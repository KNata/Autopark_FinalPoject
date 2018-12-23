package Servlets;

import DAO.BusDAO;
import DAO.DriverDAO;
import DAO.RouteDAO;
import Model.Bus;
import Model.Driver;
import Model.Route;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

public class RouteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void addBusForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("AddNewRoutePage.jsp");
        dispatcher.forward(request, response);
    }

    private void addNewRoute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String routeID = request.getParameter("routeID");
        String routeName = request.getParameter("routeName");
        String busID = request.getParameter("busID");
        String driverID = request.getParameter("driverID");
        String cityOfDeparture = request.getParameter("cityOfDeparture");
        String cityOfArrival = request.getParameter("cityOfArrival");
        int routeDuration = Integer.valueOf(request.getParameter("routeDuration"));
        Date departureTime = Date.valueOf(request.getParameter("departureTime"));
        Date arrivalTime = Date.valueOf(request.getParameter("arrivalTime"));

        RouteDAO routeDAO = new RouteDAO();
        BusDAO busDAO = new BusDAO();
        DriverDAO driverDAO = new DriverDAO();

        Route theRoute = Route.newBuilder().setRouteID(routeID).setRouteTitle(routeName).setDriver(driverDAO.findByID(driverID))
                .setBus(busDAO.findByID(busID)).setRouteBegin(cityOfDeparture).setRouteEnd(cityOfArrival).setRouteDuration(routeDuration)
                .setRouteStartTime(departureTime).setRouteEndTime(arrivalTime).build();

        if (theRoute != null) {
            routeDAO.addRecord(theRoute);
            response.sendRedirect("list");
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("errorPage.jsp");
            dispatcher.forward(request, response);
        }
    }
// to think more about it
    private void listAllRoutes(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RouteDAO routeDAO = new RouteDAO();
        ArrayList<Route> routeList = routeDAO.findAll();
        request.setAttribute("routeList", routeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("seeARoutesPage.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        BusDAO busDAO = new BusDAO();
        DriverDAO driverDAO = new DriverDAO();
        RouteDAO routeDAO = new RouteDAO();
        String routeID = request.getParameter("routeID");
        Route neededRoute = routeDAO.findByID(routeID);
        Bus neededBus = busDAO.findByID(neededRoute.getTheBus().getBusID());
        Driver neededDriver = driverDAO.findByID(neededRoute.getTheDriver().getDriverID());
        RequestDispatcher dispatcher = request.getRequestDispatcher("AddNewBusPage.jsp");
        request.setAttribute("bus", neededBus);
        request.setAttribute("driver", neededDriver);
        request.setAttribute("route", neededBus);
        dispatcher.forward(request, response);
    }

    private void editBus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String busModel = request.getParameter("busModel");
        BusDAO busDAO = new BusDAO();
        //Driver theDriver = driverDAO.update();
    }

    private void deleteBus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RouteDAO routeDAO = new RouteDAO();
        String routeID = request.getParameter("routeID");
        boolean wasDeleted = routeDAO.deleteRecord(routeID);
        response.sendRedirect("list");
    }


}
