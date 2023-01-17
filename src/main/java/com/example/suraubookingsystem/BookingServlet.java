package com.example.suraubookingsystem;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "BookingServlet", value = "/BookingServlet")
public class BookingServlet extends HttpServlet {
    //private static final long serialVersionUID = 1L;
    private BookingDao bd;
    public void init() {
        bd = new BookingDao();
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
                case "applicantcreatebooking":
                    applicantcreatebooking(request, response);
                    break;
                case "applicantcancelbooking":
                    applicantcancelbooking(request, response);
                    break;
                case "staffapprovedbooking":
                    staffapprovedbooking(request, response);
                    break;
                case "staffrejectbooking":
                    staffrejectbooking(request, response);
                    break;

            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
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

    private void staffrejectbooking(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        bd.staffrejectbooking(bookingid);

        out.println("<script type=\"text/javascript\">");
        out.println("alert('Anda telah berjaya menolak tempahan ini!');");
        out.println("location='staffApproveBooking.jsp';");
        out.println("</script>");
    }

    /*######################################################( Applicant Create Booking )#############################################################*/
    private void applicantcreatebooking(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {

        //HttpSession session = request.getSession();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{/*
            int applicantid = Integer.parseInt(request.getParameter("applicantid"));
            int spaceid = Integer.parseInt(request.getParameter("spaceid"));
            int roomid = Integer.parseInt(request.getParameter("roomid"));;*/
            String bookingstatus = request.getParameter("bookingstatus");
            Date eventdate = Date.valueOf(request.getParameter("eventdate"));
            String eventtime = request.getParameter("eventtime");  
            String eventdescription = request.getParameter("eventdescription");
            String eventspace = request.getParameter("eventspace");
            
            /*
            Applicant applicant = new Applicant();
            Space space = new Space();
            Room room = new Room();*/
            Booking booking = new Booking();
            /*
            applicant.setApplicantid(applicantid);
            space.setSpaceid(spaceid);
            room.setRoomid(roomid);*/
            booking.setBookingstatus(bookingstatus);
            booking.setEventdate(eventdate);
            booking.setEventtime(eventtime);
            booking.setEventdescription(eventdescription);
            booking.setEventspace(eventspace);

            //bd.applicantcreatebooking(booking, space, room, applicant);
            bd.applicantcreatebooking(booking);
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