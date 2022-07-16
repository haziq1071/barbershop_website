package com.example.suraubookingsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
//
@MultipartConfig
@WebServlet(name = "BookingServlet", value = "/BookingServlet")
public class BookingServlet extends HttpServlet {

    //private static final long serialVersionUID = 1L;
    private BookingDao bd;
    public void init() {
        bd = new BookingDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");

        String action = request.getParameter("action");

        try {
            switch (action) {
                case "staffcreatebooking":
                    staffcreatebooking(request, response);
                    break;
                case "applicantcreatebooking":
                    applicantcreatebooking(request, response);
                    break;
                case "staffcancelbooking":
                    staffcancelbooking(request, response);
                    break;
                case "applicantcancelbooking":
                    applicantcancelbooking(request, response);
                    break;
                case "staffapprovedbooking":
                    staffapprovedbooking(request, response);
                    break;
                /* case "staffrejectbooking":
                    staffrejectbooking(request, response);
                    break;*/

            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*######################################################( Staff Create Booking )#############################################################*/

    private void staffcreatebooking(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {

        //HttpSession session = request.getSession();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{
            int staffid = Integer.parseInt(request.getParameter("staffid"));
            int spaceid = Integer.parseInt(request.getParameter("spaceid"));
            Date eventdate = Date.valueOf(request.getParameter("eventdate"));
            String bookingdescription = request.getParameter("bookingdescription");
            //String bookingstatus = request.getParameter("bookingstatus");

            Staff staff = new Staff();
            Space space = new Space();
            Booking booking = new Booking();

            staff.setStaffid(staffid);
            space.setSpaceid(spaceid);
            booking.setEventdate(eventdate);
            booking.setBookingdescription(bookingdescription);
            //booking.setBookingstatus(bookingstatus);

            bd.staffcreatebooking(booking, space, staff);
            //bd.staffcreatebooking(booking);
            //response.sendRedirect("staffViewBooking.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Tempahan telah berjaya dibuat!');");
        out.println("location='staffViewBooking.jsp';");
        out.println("</script>");
    }

    private void staffcancelbooking(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        bd.staffcancelbooking(bookingid);
        response.sendRedirect("staffViewBooking.jsp");
    }

    private void staffapprovedbooking(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        bd.staffapprovedbooking(bookingid);


        out.println("<script type=\"text/javascript\">");
        out.println("alert('Anda telah berjaya meluluskan tempahan ini!');");
        out.println("location='staffApproveBooking.jsp';");
        out.println("</script>");
    }


    /*######################################################( Applicant Create Booking )#############################################################*/
    private void applicantcreatebooking(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {

        //HttpSession session = request.getSession();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{
            int applicantid = Integer.parseInt(request.getParameter("applicantid"));
            int spaceid = Integer.parseInt(request.getParameter("spaceid"));
            Date eventdate = Date.valueOf(request.getParameter("eventdate"));
            String bookingdescription = request.getParameter("bookingdescription");


            Applicant applicant = new Applicant();
            Space space = new Space();
            Booking booking = new Booking();

            applicant.setApplicantid(applicantid);
            space.setSpaceid(spaceid);
            booking.setEventdate(eventdate);
            booking.setBookingdescription(bookingdescription);

            bd.applicantcreatebooking(booking, space, applicant);
        } catch (Exception e) {
            e.printStackTrace();
        }
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Tempahan telah berjaya dibuat!');");
        out.println("location='applicantViewBooking.jsp';");
        out.println("</script>");
    }

    private void applicantcancelbooking(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        bd.applicantcancelbooking(bookingid);
        response.sendRedirect("applicantViewBooking.jsp");
    }
}
