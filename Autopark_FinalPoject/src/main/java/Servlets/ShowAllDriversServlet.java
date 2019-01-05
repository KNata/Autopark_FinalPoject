package Servlets;

import DAO.DriverDAO;
import Model.Driver;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ShowAllDriversServlet", urlPatterns = "/ShowAllDriversServlet")
public class ShowAllDriversServlet extends HttpServlet {

    private DriverDAO driverDAO = new DriverDAO();

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Driver> driverList = driverDAO.findAll();
//        for(int i = 0; i < driverList.size(); i++) {
//            System.out.println(driverList.get(i).toString());
//        }
        System.out.println(driverList.size());
        if (driverList.size() == 0) {
            System.out.println("1");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/commonView/errorPage.jsp");
            dispatcher.forward(request, response);
            System.out.println("2");
        } else {
            System.out.println("3");
            // String nextJSP = "/adminView/seeAllDrivers.jsp";
            request.setAttribute("driverList", driverList);
            System.out.println("4");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/seeAllDrivers.jsp");
            dispatcher.forward(request, response);
        }

    }
}
