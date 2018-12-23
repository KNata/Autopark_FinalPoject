package Servlets.commands.busCommands;

import DAO.BusDAO;
import Servlets.commands.ActionCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteBus implements ActionCommand {

    private BusDAO busDAO = new BusDAO();

    private static String BUS_ID = "busID";


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String busID = request.getParameter(BUS_ID);
        if (busDAO.deleteRecord(busID)) {
          //  return "/successPage";
        } else {
          //  return "/index";
        }
    }
}
