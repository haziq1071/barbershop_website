package com.example.suraubookingsystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class SpaceServlet
 */
@WebServlet(name = "SpaceServlet", value = "/SpaceServlet")
public class SpaceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private SpaceDao sp;
    public void init() {
        sp = new SpaceDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

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
        int tablequantity = Integer.parseInt(request.getParameter("tablequantity"));
        int chairquantity = Integer.parseInt(request.getParameter("chairquantity"));

        Space space = new Space();

        space.setSpacename(spacename);
        space.setSpacecapacity(spacecapacity);
        space.setSpacestatus(spacestatus);
        space.setSoundsystem(soundsystem);
        space.setTablequantity(tablequantity);
        space.setChairquantity(chairquantity);

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
        int tablequantity = Integer.parseInt(request.getParameter("tablequantity"));
        int chairquantity = Integer.parseInt(request.getParameter("chairquantity"));

        Space space = new Space();

        space.setSpaceid(spaceid);
        space.setSpacename(spacename);
        space.setSpacecapacity(spacecapacity);
        space.setSpacestatus(spacestatus);
        space.setSoundsystem(soundsystem);
        space.setTablequantity(tablequantity);
        space.setChairquantity(chairquantity);

        sp.createSpace(space);

        session.removeAttribute("space");
        session.setAttribute("space", space);
        response.sendRedirect("staffViewAccount.jsp");


    }


    /*######################################################( DELETE )#############################################################*/

    private void deleteSpace(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int spaceid = Integer.parseInt(request.getParameter("spaceid"));
        sp.deleteSpace(spaceid);
        response.sendRedirect("staffViewSpace.jsp");
    }

}
