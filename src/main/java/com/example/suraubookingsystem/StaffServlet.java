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


@WebServlet(name = "StaffServlet", value = "/StaffServlet")
public class StaffServlet extends HttpServlet {

	private StaffDao st;
    public void init() {
        st = new StaffDao();    
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
	//try	
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "signupStaff":
                    signupStaff(request, response);
                    break;
                case "loginStaff":
                    loginStaff(request, response);
                    break;
                /*case "viewStaff":
                    viewStaff(request, response);
                    break;*/
                case "deleteStaff":
                    deleteStaff(request, response);
                    break;
                case "updateStaff":
                    updateStaff(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }


    }   
        
        /*######################################################( SINGNUP )#############################################################*/

        private void signupStaff(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {
		String staffrole = request.getParameter("staffrole"); 
		String staffname = request.getParameter("staffname");
		String staffic = request.getParameter("staffic");
		String staffaddress = request.getParameter("staffaddress"); 
		String staffphone = request.getParameter("staffphone");
		String staffemail = request.getParameter("staffemail"); 
		Date staffdateofbirth = Date.valueOf(request.getParameter("staffdateofbirth"));
		String staffusername = request.getParameter("staffusername");
		String staffpassword = request.getParameter("staffpassword"); 
		int supervisorid = Integer.parseInt(request.getParameter("supervisorid"));

        Staff staff = new Staff();

        staff.setStaffrole(staffrole);
        staff.setStaffname(staffname);
        staff.setStaffic(staffic);
		staff.setStaffaddress(staffaddress);
		staff.setStaffphone(staffphone);
		staff.setStaffemail(staffemail);
		staff.setStaffdateofbirth(staffdateofbirth);
		staff.setStaffusername(staffusername);
		staff.setStaffpassword(staffpassword);
		staff.setSupervisorid(supervisorid);
		
		st.signupStaff(staff);
        response.sendRedirect("index.jsp");
		
	}

	/*######################################################( LOGIN )#############################################################*/


    private void loginStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String staffusername = request.getParameter("staffusername");
        String staffpassword = request.getParameter("staffpassword");  

        try {

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-52-72-56-59.compute-1.amazonaws.com:5432/d274lnoegak379"; //ni url dri heroku database
            String user = "dnzxqagexabepj"; //ni user dri heroku database
            String pass = "edb330e6fe55ed3bb6d1ee1eb3c1f995e6b205eb5d464bee634abc3345b2d294"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            String sql  ="SELECT * from staff";

            if (conn != null){
                DatabaseMetaData dm = conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product Name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());


                Statement statement = conn.createStatement();
                ResultSet res = statement.executeQuery(sql);

                while (res.next()){
                    if(staffusername.equals(res.getString("staffusername")) && staffpassword.equals(res.getString("staffpassword")))
                    {

                        session.setAttribute("staffid", res.getInt(1));
                        response.sendRedirect("homepage.jsp");


                    }else{
                        response.sendRedirect("index.jsp");
                        out.println("User not exist");
                        /*out.println("<html><head></head><body onload=\"alert('User not exist')\"></body></html>");*/
                    }
                }
            }


        }catch (Exception e){
            e.printStackTrace();
        }
    }
        /*######################################################( UPDATE )#############################################################*/


        private void updateStaff(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {

        	HttpSession session = request.getSession();
        	int staffid = Integer.parseInt(request.getParameter("staffid")); 
    		String staffrole = request.getParameter("staffrole"); 
    		String staffname = request.getParameter("staffname"); 
            String staffic = request.getParameter("staffic");
    		String staffaddress = request.getParameter("staffaddress"); 
    		String staffphone = request.getParameter("staffphone");
    		String staffemail = request.getParameter("staffemail"); 
    		Date staffdateofbirth = Date.valueOf(request.getParameter("staffdateofbirth"));
    		String staffusername = request.getParameter("staffusername");
    		String staffpassword = request.getParameter("staffpassword"); 
    		int supervisorid = Integer.parseInt(request.getParameter("supervisorid"));
            Staff staff = new Staff();
            
            staff.setStaffid(staffid);
            staff.setStaffrole(staffrole);
            staff.setStaffname(staffname);
            staff.setStaffname(staffic);
    		staff.setStaffaddress(staffaddress);
    		staff.setStaffphone(staffphone);
    		staff.setStaffemail(staffemail);
    		staff.setStaffdateofbirth(staffdateofbirth);
    		staff.setStaffusername(staffusername);
    		staff.setStaffpassword(staffpassword);
    		staff.setSupervisorid(supervisorid);

            session.removeAttribute("staffid");
            session.removeAttribute("staffrole");
            session.removeAttribute("staffname");
            session.removeAttribute("staffic");
            session.removeAttribute("staffaddress");
            session.removeAttribute("staffphone");
            session.removeAttribute("staffemail");
            session.removeAttribute("staffdateofbirth");
            session.removeAttribute("staffusername");
            session.removeAttribute("staffpassword");
            session.removeAttribute("supervisorid");
            
            
            session.setAttribute("staffid", staffid);
            session.setAttribute("staffrole", staffrole);
            session.setAttribute("staffname", staffname);
            session.setAttribute("staffic", staffic);
            session.setAttribute("staffaddress", staffaddress);
            session.setAttribute("staffphone",staffphone);
            session.setAttribute("staffemail",staffemail);
            session.setAttribute("staffdateofbirth",staffdateofbirth);
            session.setAttribute("staffusername",staffusername);
            session.setAttribute("staffpassword",staffpassword);
            session.setAttribute("supervisorid",supervisorid);


            response.sendRedirect("viewStaff.jsp");
        }


        /*######################################################( DELETE )#############################################################*/

	    private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
	        int staffid = Integer.parseInt(request.getParameter("staffid"));
	        st.deleteStaff(staffid);
	        response.sendRedirect("index.jsp");
	    }

}

