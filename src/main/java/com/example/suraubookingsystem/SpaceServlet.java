package com.example.suraubookingsystem;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "SpaceServlet", value = "/SpaceServlet")
public class SpaceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SpaceDao sp;

    HttpSession session = null;

    public void init() {
        sp = new SpaceDao();
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	HttpSession session = request.getSession();
        session.removeAttribute("staffid");
        session.invalidate();
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "createSpace":
                    createSpace(request, response);
                    break;
                case "deleteSpace":
                    deleteSpace(request, response);
                    break;
                case "updateSpace":
                    updateSpace(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }


    }

    /*######################################################(CREATE SPACE)#############################################################*/

    private void createSpace(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {

        String spacename = request.getParameter("spacename");
        int spacecapacity = Integer.parseInt(request.getParameter("spacecapacity"));
        String spacestatus = request.getParameter("spacestatus");
        String soundsystem = request.getParameter("soundsystem");

        Space space = new Space();

        space.setSpacename(spacename);
        space.setSpacecapacity(spacecapacity);
        space.setSpacestatus(spacestatus);
        space.setSoundsystem(soundsystem);

        sp.createSpace(space);
        response.sendRedirect("staffViewSpace.jsp");

    }

    /*######################################################( UPDATE )#############################################################*/

    private void updateSpace(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {
        HttpSession session = request.getSession();
        int spaceid = Integer.parseInt(request.getParameter("spaceid"));
        String spacename = request.getParameter("spacename");
        int spacecapacity = Integer.parseInt(request.getParameter("spacecapacity"));
        String spacestatus = request.getParameter("spacestatus");
        String soundsystem = request.getParameter("soundsystem");

        Space space = new Space();

        space.setSpaceid(spaceid);
        space.setSpacename(spacename);
        space.setSpacecapacity(spacecapacity);
        space.setSpacestatus(spacestatus);
        space.setSoundsystem(soundsystem);

        sp.updateSpace(space);

        session.removeAttribute("space");
        session.setAttribute("space", space);
        response.sendRedirect("staffViewSpace.jsp");


    }

    /*######################################################( DELETE )#############################################################*/

    private void deleteSpace(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int spaceid = Integer.parseInt(request.getParameter("spaceid"));
        sp.deleteSpace(spaceid);
        response.sendRedirect("staffViewSpace.jsp");
    }

}
