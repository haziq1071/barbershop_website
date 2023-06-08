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
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

      /*######################################################( Applicant Create Booking )#############################################################*/
    private void applicantcreatebooking(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {

        //HttpSession session = request.getSession();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{       
            int applicantid = Integer.parseInt(request.getParameter("applicantid"));
            int spaceid = Integer.parseInt(request.getParameter("spaceid"));
            String bookingstatus = request.getParameter("bookingstatus");
            Date eventdate = Date.valueOf(request.getParameter("eventdate"));
            String eventtime = request.getParameter("eventtime");  
            String eventdescription = request.getParameter("eventdescription");
            
            Applicant applicant = new Applicant();
            Services services = new Services();
            Booking booking = new Booking();

            applicant.setApplicantid(applicantid);
            services.setServiceid(spaceid);
            booking.setBookingstatus(bookingstatus);
            booking.setEventdate(eventdate);
            booking.setEventtime(eventtime);
            booking.setEventdescription(eventdescription);

            //bd.applicantcreatebooking(booking, space, room, applicant);
            bd.applicantcreatebooking(booking, services, applicant);
            //response.sendRedirect("applicantViewBooking.jsp");
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

  
}