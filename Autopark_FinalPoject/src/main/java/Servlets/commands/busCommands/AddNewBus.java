package Servlets.commands.busCommands;

import DAO.BusDAO;
import Model.Bus;
import Servlets.commands.ActionCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddNewBus implements ActionCommand {

    private BusDAO busDAO = new BusDAO();

    private static String BUS_ID = "busID";
    private static String BUS_MODEL = "busModel";
    private static String MAX_PASSEGERS = "maxPassegers";
    private static String MILES = "miles";
    private static String PASSED_SERVICE = "maintance";


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String busID = request.getParameter(BUS_ID);
        String busModel = request.getParameter(BUS_MODEL);
        int maxCountOfPassangers = Integer.parseInt(request.getParameter(MAX_PASSEGERS));
        int miles = Integer.parseInt(request.getParameter(MILES));
        boolean passedService = Boolean.parseBoolean(request.getParameter(PASSED_SERVICE));

        Bus theBus = Bus.newBuilder().setBusID(busID).setBusModel(busModel).setmaxCountOfPassagers(maxCountOfPassangers)
                .setMiles(miles).setPassedService(passedService).build();

        if (busDAO.addRecord(theBus)) {
           // return "/successPage";
        } else {
           // return "/index";
        }
    }
}
