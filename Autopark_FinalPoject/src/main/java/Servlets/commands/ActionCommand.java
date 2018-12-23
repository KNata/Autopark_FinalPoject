package Servlets.commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface ActionCommand {

        void execute(HttpServletRequest request, HttpServletResponse response) throws IOException;

}
