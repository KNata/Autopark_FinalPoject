package Servlets;

import DAO.BusDAO;
import DAO.DriverDAO;
import DAO.RouteDAO;
import Model.Driver;
import Model.Route;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

@WebServlet(name = "RouteServlet", urlPatterns = "/RouteServlet")
public class RouteServlet extends HttpServlet {

    private RouteDAO routeDAO = new RouteDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("searchAction");
        if (action != null) {
            switch (action) {
                case "searchById":
                    searchDriverByID(request, response);
                    break;
                case "searchByName":
                    searchRouteByName(request, response);
                    break;
                case "showAllRoutes":
                    searchRouteByName(request, response);
                    break;
            }
        }else{
            ArrayList<Route> resultList = routeDAO.findAll();
            forwardListRoute(request, response, resultList);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        switch (action) {
            case "addNewRoute":
                addNewRoute(request, response);
                break;
            case "remove":
                deleteDriver(request, response);
                break;
            case "edit":
                editRoute(request, response);
                break;
        }

    }

    private void showAllRoutes(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ArrayList<Route> routeList = routeDAO.findAll();
        if (routeList.size() == 0) {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/commonView/errorPage.jsp");
            dispatcher.forward(request, response);
        }
        String nextJSP = "/views/adminView/seeAllDriversPage.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        request.setAttribute("routeList", routeList);
        dispatcher.forward(request, response);
    }

    private void forwardListRoute(HttpServletRequest request, HttpServletResponse response, ArrayList<Route> routeList) throws IOException, ServletException {
        String nextJSP = "/views/adminView/seeAllDriversPage.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        request.setAttribute("routeList", routeList);
        dispatcher.forward(request, response);
    }

    private void searchDriverByID (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String routeID = request.getParameter("idRoute");
        Route theRoute = routeDAO.findByID(routeID);
        request.setAttribute("route", theRoute);
        request.setAttribute("action", "edit");
        String nextJSP = "/adminView/addNewRoutePage.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        dispatcher.forward(request, response);
    }

    private void searchRouteByName(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String routeName = request.getParameter("driverName");
        Route theRoute = routeDAO.findByName(routeName);
        request.setAttribute("route", theRoute);
        request.setAttribute("action", "edit");
        String nextJSP = "/adminView/addNewRoutePage.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        dispatcher.forward(request, response);
    }

    private void addNewRoute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int routeID = Integer.valueOf(request.getParameter("routeID"));
        String routeTitle = request.getParameter("routeTitle");
        String busID = request.getParameter("busID");
        String driverID = request.getParameter("driverID");
        String cityOfDeparture = request.getParameter("cityOfDeparture");
        String cityOfArrival = request.getParameter("cityOfArrival");
        int routeDuration = Integer.valueOf(request.getParameter("routeDuration"));
        Date departureTime = Date.valueOf(request.getParameter("departureTime"));
        Date arrivalTime = Date.valueOf(request.getParameter("arrivalTime"));
        System.out.println(routeID);
        System.out.println(routeTitle);
        System.out.println(driverID);
        System.out.println(busID);
        System.out.println(cityOfDeparture);
        System.out.println(cityOfArrival);
        System.out.println(routeDuration);
        System.out.println(departureTime);
        System.out.println(arrivalTime);
        if (routeID != 0 && busID != null && driverID != null && routeTitle != null && cityOfArrival != null && cityOfDeparture != null
                && routeDuration != 0 && departureTime != null && arrivalTime != null) {
            System.out.println("1");
            BusDAO busDAO = new BusDAO();
            System.out.println("2");
            DriverDAO driverDAO = new DriverDAO();
            System.out.println("3");
            Route theRoute = Route.newBuilder().setRouteID(routeID).setRouteTitle(routeTitle).setBus(busDAO.findByID(busID).getBusID())
                    .setDriver(driverDAO.findByID(driverID).getDriverID()).setRouteBegin(cityOfDeparture).setRouteEnd(cityOfArrival)
                    .setRouteDuration(routeDuration).setRouteStartTime(departureTime).setRouteEndTime(arrivalTime).build();
            System.out.println("3");
            boolean wasAdded = routeDAO.addRecord(theRoute);
            System.out.println("4");
            ArrayList<Route> routeList = routeDAO.findAll();
            System.out.println("5");
            if (wasAdded) {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/commonView/successPage.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/commonView/errorPage.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/commonView/errorPage.jsp");
            dispatcher.forward(request, response);
        }

    }


    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String routeID = request.getParameter("routeID");
        boolean wasDeleted = routeDAO.deleteRecord(routeID);
        if (wasDeleted) {
            String message = "The route was successfully removed";
            request.setAttribute("message", message);
            ArrayList<Route> routeList = routeDAO.findAll();
            forwardListRoute(request, response, routeList);
        }
    }

    private void editRoute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int routeID = Integer.valueOf(request.getParameter("routeID"));
        String routeTitle = request.getParameter("routeTitle");
        String busID = request.getParameter("busID");
        String driverID = request.getParameter("driverID");
        Date departureTime = Date.valueOf(request.getParameter("departureTime"));
        Date arrivalTime = Date.valueOf(request.getParameter("arrivalTime"));

        BusDAO busDAO = new BusDAO();
        DriverDAO driverDAO = new DriverDAO();

        boolean wasUpdated = routeDAO.update(routeID, driverID, busID, departureTime, arrivalTime);
        String message = null;
        if (wasUpdated) {
             message = "The route has been  updated successfully";
        }
        ArrayList<Route> employeeList = routeDAO.findAll();
        request.setAttribute("idRoute", routeID);
        request.setAttribute("message", message);
        forwardListRoute(request, response, employeeList);
    }
}
