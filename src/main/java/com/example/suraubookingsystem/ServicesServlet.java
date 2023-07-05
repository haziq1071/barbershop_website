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

@WebServlet(name = "ServicesServlet", value = "/ServicesServlet")
public class ServicesServlet extends HttpServlet {
 //   private static final long serialVersionUID = 1L;
    private ServicesDao sp;

//    HttpSession session = null;

    public void init() {
        sp = new ServicesDao();
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
                case "createServices":
                    createServices(request, response);
                    break;
                case "deleteServices":
                    deleteServices(request, response);
                    break;
                case "updateServices":
                    updateServices(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    /*######################################################(CREATE ROOM)#############################################################*/

    private void createServices(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String servicename = request.getParameter("servicename");
        String servicedescription = request.getParameter("servicedescription");
        double serviceprice = Double.parseDouble(request.getParameter("serviceprice"));

        Services services = new Services();

        services.setServicename(servicename);
        services.setServicedescription(servicedescription);
        services.setServiceprice(serviceprice);

        sp.createServices(services);
        response.sendRedirect("staffViewSpace.jsp");
    }

    /*######################################################( UPDATE )#############################################################*/

    private void updateServices(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        HttpSession session = request.getSession();
        int serviceid = Integer.parseInt(request.getParameter("serviceid"));
        String servicename = request.getParameter("servicename");
        String servicedescription = request.getParameter("servicedescription");
        double serviceprice = Double.parseDouble(request.getParameter("serviceprice"));

        Services services = new Services();

        services.setServiceid(serviceid);
        services.setServicename(servicename);
        services.setServicedescription(servicedescription);
        services.setServiceprice(serviceprice);

        sp.updateServices(services);

        session.removeAttribute("services");
        session.setAttribute("services", services);
        response.sendRedirect("staffViewSpace.jsp");
    }

    /*######################################################( DELETE )#############################################################*/

    private void deleteServices(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int serviceid = Integer.parseInt(request.getParameter("serviceid"));
        sp.deleteServices(serviceid);
        response.sendRedirect("staffViewSpace.jsp");
    }

}
