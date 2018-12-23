package Servlets.commands.routeCommands;

import DAO.BusDAO;
import DAO.DriverDAO;
import DAO.RouteDAO;
import Model.Route;
import Servlets.commands.ActionCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

public class AddRoute implements ActionCommand {

    private RouteDAO routeDAO = new RouteDAO();
    private DriverDAO driverDAO = new DriverDAO();
    private BusDAO busDAO = new BusDAO();

    private static String ROUTE_ID = "routeID";
    private static String ROUTE_TITLE = "routeTitle";
    private static String CITY_OF_DEPARTURE = "cityOfDeparture";
    private static String CITY_OF_ARRIVAL = "cityOfArrival";
    private static String ROUTE_DURATION = "routeDuration";
    private static String DEPARTURE_TIME = "departureTime";
    private static String ARRIVAL_TIME = "arrivalTime";
    private static String BUS_ID = "busID";
    private static String DRIVER_ID = "driverID";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String routeID = request.getParameter(ROUTE_ID);
        String routeTitle = request.getParameter(ROUTE_TITLE);
        String busID = request.getParameter(BUS_ID);
        String driverID = request.getParameter(DRIVER_ID);
        String cityOfDeparture = request.getParameter(CITY_OF_DEPARTURE);
        String cityOfArrival = request.getParameter(CITY_OF_ARRIVAL);
        int routeDuration = Integer.valueOf(request.getParameter(ROUTE_DURATION));
        Date departureTime = Date.valueOf(request.getParameter(DEPARTURE_TIME));
        Date arrivalTime = Date.valueOf(request.getParameter(ARRIVAL_TIME));

        Route theRoute = Route.newBuilder().setRouteID(routeID).setRouteTitle(routeTitle).setBus(busDAO.findByID(busID))
                .setDriver(driverDAO.findByID(driverID)).setRouteBegin(cityOfDeparture).setRouteEnd(cityOfArrival)
                .setRouteDuration(routeDuration).setRouteStartTime(departureTime).setRouteEndTime(arrivalTime).build();

        if (routeDAO.addRecord(theRoute)) {
            //return "/successPage";
        } else {
            //return "/index";
        }
    }
}
