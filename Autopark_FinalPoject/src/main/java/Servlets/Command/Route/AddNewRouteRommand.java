package Servlets.Command.Route;

import DAO.BusDAO;
import DAO.DriverDAO;
import DAO.RouteDAO;
import Model.Bus;
import Model.Driver;
import Model.Route;
import Servlets.Command.ICommand;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class AddNewRouteRommand implements ICommand {

    private RouteDAO routeDAO;

    public AddNewRouteRommand(RouteDAO aRouteDAO) {
        routeDAO = aRouteDAO;
    }

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String routeID = request.getParameter("idRoute");
        String routeTitle = request.getParameter("routeName");
        String busID = request.getParameter("busID");
        String driverID = request.getParameter("driverID");
        String cityOfDeparture = request.getParameter("cityOfDeparture");
        String cityOfArrival = request.getParameter("cityOfArrival");
        String routeDuration = request.getParameter("routeDuration");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        java.sql.Date departureTimeInDateFormat = convertDate(departureTime);
        java.sql.Date arrivalTimeInDateFormat = convertDate(arrivalTime);

        if (routeID != null && busID != null && driverID != null && routeTitle != null && cityOfArrival != null && cityOfDeparture != null
                && routeDuration != null && departureTime != null && arrivalTime != null && (departureTime != arrivalTime)
                && (departureTimeInDateFormat.getTime() < arrivalTimeInDateFormat.getTime())) {
            BusDAO busDAO = new BusDAO();
            DriverDAO driverDAO = new DriverDAO();
            if (busDAO.findByID(busID) != null && driverDAO.isDriverInSystem(driverID)) {
                if(routeDAO.findByID(routeID) == null && (!routeDAO.findByID(routeID).getRouteStartTime().equals(departureTimeInDateFormat)) && (!routeDAO.findByID(routeID).getDriverID().equals(driverID))) {
                    Driver theDriver = driverDAO.findByID(driverID);
                    Bus theBus = busDAO.findByID(busID);
                    Route theRoute = Route.newBuilder().setRouteID(Integer.valueOf(routeID)).setRouteTitle(routeTitle).setBusID(busID)
                            .setDriver(driverID).setRouteBegin(cityOfDeparture).setRouteEnd(cityOfArrival)
                            .setRouteDuration(Integer.valueOf(routeDuration)).setRouteStartTime(departureTime).setRouteEndTime(arrivalTime).build();
                    boolean wasAdded = routeDAO.addRecord(theRoute);
                    if (wasAdded) {
                        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/views/commonView/successPage.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/views/commonView/errorPage.jsp");
                        dispatcher.forward(request, response);
                    } }
            } else {
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/views/commonView/errorPage.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    private java.sql.Date convertDate (String stringToConvert) {
        java.sql.Date resultDate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
        java.util.Date date = null;
        try {
            date = sdf.parse(stringToConvert);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        resultDate = new Date(date.getTime());
        return resultDate;
    }
}
