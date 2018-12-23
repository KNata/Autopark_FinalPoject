package Servlets.commands.routeCommands;

import DAO.RouteDAO;
import Servlets.commands.ActionCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteRoute implements ActionCommand {

    private RouteDAO routeDAO = new RouteDAO();

    private static String ROUTE_ID = "routeID";


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String routeID = request.getParameter(ROUTE_ID);
        if (routeDAO.deleteRecord(routeID)) {
         //   return "/successPage";
        } else {
        //    return "/index";
        }
    }
}

