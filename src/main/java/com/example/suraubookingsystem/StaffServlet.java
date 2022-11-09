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
        String staffrole = request.getParameter("staffrole");

        try {

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-52-72-56-59.compute-1.amazonaws.com:5432/d274lnoegak379"; //ni url dri heroku database
            String user = "dnzxqagexabepj"; //ni user dri heroku database
            String pass = "edb330e6fe55ed3bb6d1ee1eb3c1f995e6b205eb5d464bee634abc3345b2d294"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            String sql  ="SELECT staffid,staffname,staffusername,staffpassword,staffrole from staff";

            if (conn != null){
                DatabaseMetaData dm = conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product Name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());


                Statement statement = conn.createStatement();
                ResultSet res = statement.executeQuery(sql);

                while (res.next()){
                    if(staffusername.equals(res.getString("staffusername")) && staffpassword.equals(res.getString("staffpassword")) && staffrole.equals(("Ketua Admin")))
                    {

                        Staff staff = new Staff();

                        staff.setStaffid(res.getInt(1));
                        staff.setStaffname(res.getString(2));
                        staff.setStaffusername(res.getString(3));
                        staff.setStaffpassword(res.getString(4));
                        staff.setStaffrole(res.getString(5));

                        session.setAttribute("staffid", staff.getStaffid());
                        session.setAttribute("staffname", staff.getStaffname());
                        session.setAttribute("staffusername",staff.getStaffusername());
                        session.setAttribute("staffpassword",staff.getStaffpassword());
                        session.setAttribute("staffrole",staff.getStaffrole());

                        response.sendRedirect("homepageLeadStaff.jsp");

                    }

                    else if(staffusername.equals(res.getString("staffusername")) && staffpassword.equals(res.getString("staffpassword")))
                    {

                        Staff staff = new Staff();

                        staff.setStaffid(res.getInt(1));
                        staff.setStaffname(res.getString(2));
                        staff.setStaffusername(res.getString(3));
                        staff.setStaffpassword(res.getString(4));
                        staff.setStaffrole(res.getString(5));

                        session.setAttribute("staffid", staff.getStaffid());
                        session.setAttribute("staffname", staff.getStaffname());
                        session.setAttribute("staffusername",staff.getStaffusername());
                        session.setAttribute("staffpassword",staff.getStaffpassword());
                        session.setAttribute("staffrole",staff.getStaffrole());

                        response.sendRedirect("homepageStaff.jsp");

                    }

                    else{

                        out.println("User not exist");

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
        staff.setStaffic(staffic);
        staff.setStaffaddress(staffaddress);
        staff.setStaffphone(staffphone);
        staff.setStaffemail(staffemail);
        staff.setStaffdateofbirth(staffdateofbirth);
        staff.setStaffusername(staffusername);
        staff.setStaffpassword(staffpassword);

        st.updateStaff(staff);
        session.removeAttribute("staff");
        session.setAttribute("staff", staff);
        response.sendRedirect("staffViewAccount.jsp");
    }


    /*######################################################( DELETE )#############################################################*/

    private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int staffid = Integer.parseInt(request.getParameter("staffid"));
        st.deleteStaff(staffid);
        response.sendRedirect("index.jsp");
    }

}
