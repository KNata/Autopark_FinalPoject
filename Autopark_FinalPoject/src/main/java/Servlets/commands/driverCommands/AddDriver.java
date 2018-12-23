package Servlets.commands.driverCommands;

import DAO.DriverDAO;
import Model.Driver;
import Servlets.commands.ActionCommand;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddDriver implements ActionCommand {

    private DriverDAO driverDAO = new DriverDAO();

    private static String DRIVER_ID = "driverID";
    private static String DRIVER_NAME = "driverName";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String driverID = request.getParameter(DRIVER_ID);
        String driverName = request.getParameter(DRIVER_NAME);

        Driver theDriver = Driver.newBuilder().setDriverID(driverID).setDriverName(driverName).build();

       // RequestDispatcher dispatcher = response.sendRedirect("");
        if (driverDAO.addRecord(theDriver)) {
        } else {
        }
    }
}
