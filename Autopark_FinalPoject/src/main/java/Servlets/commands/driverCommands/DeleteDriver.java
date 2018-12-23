package Servlets.commands.driverCommands;

import DAO.DriverDAO;
import Servlets.commands.ActionCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteDriver implements ActionCommand {

    private DriverDAO driverDAO = new DriverDAO();

    private static String DRIVER_ID = "driverID";


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String driverID = request.getParameter(DRIVER_ID);
        if (driverDAO.deleteRecord(driverID)) {
        } else {
        }
    }
}
