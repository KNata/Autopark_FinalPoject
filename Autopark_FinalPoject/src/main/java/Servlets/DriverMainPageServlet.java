package Servlets;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DriverMainPageServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        switch (action) {
            case "seeAllDrivers":

                break;
            case "seeAllRoutes":

                break;
            case "seeAllBuses":

                break;
            case "addNewDriver":

                break;
            case "addNewRoute":

                break;
            case "addNewBus":

                break;
        }

    }
}
