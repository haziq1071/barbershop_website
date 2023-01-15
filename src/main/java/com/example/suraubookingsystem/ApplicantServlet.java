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

@WebServlet(name = "ApplicantServlet", value = "/ApplicantServlet")
public class ApplicantServlet extends HttpServlet{

    private ApplicantDao app;
    public void init() {
        app = new ApplicantDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.removeAttribute("applicantid");
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
                case "signupApplicant":
                    signupApplicant(request, response);
                    break;
                case "loginApplicant":
                    loginApplicant(request, response);
                    break;
                case "deleteApplicant":
                    deleteApplicant(request, response);
                    break;
                case "updateApplicant":
                    updateApplicant(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    /*######################################################( SINGNUP )#############################################################*/

    private void signupApplicant(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {
        String applicantname = request.getParameter("applicantname");
        String applicantic = request.getParameter("applicantic");
        Date applicantdateofbirth = Date.valueOf(request.getParameter("applicantdateofbirth"));
        String applicantaddress = request.getParameter("applicantaddress");
        String applicantemail = request.getParameter("applicantemail");
        String applicantphone = request.getParameter("applicantphone");
        String applicantusername = request.getParameter("applicantusername");
        String applicantpassword = request.getParameter("applicantpassword");

       Applicant applicant = new Applicant();

        applicant.setApplicantname(applicantname);
        applicant.setApplicantic(applicantic);
        applicant.setApplicantdateofbirth(applicantdateofbirth);
        applicant.setApplicantaddress(applicantaddress);
        applicant.setApplicantemail(applicantemail);
        applicant.setApplicantphone(applicantphone);
        applicant.setApplicantusername(applicantusername);
        applicant.setApplicantpassword(applicantpassword);

        app.signupApplicant(applicant);
        response.sendRedirect("index.jsp");
    }
    /*######################################################( LOGIN )#############################################################*/


    private void loginApplicant(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String applicantusername = request.getParameter("applicantusername");
        String applicantpassword = request.getParameter("applicantpassword");

        try {

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://containers-us-west-141.railway.app:7894/railway";
            String user = "postgres";
            String pass = "ETymgiO6aGYvyXf5fkei";
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            String sql  ="SELECT applicantid, applicantname, applicantusername, applicantpassword from applicant";

            if (conn != null){
                DatabaseMetaData dm = conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product Name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());


                Statement statement = conn.createStatement();
                ResultSet res = statement.executeQuery(sql);

                while (res.next()){
                    if(applicantusername.equals(res.getString("applicantusername")) && applicantpassword.equals(res.getString("applicantpassword")))
                    {
                        Applicant applicant = new Applicant();

                        applicant.setApplicantid(res.getInt(1));
                        applicant.setApplicantname(res.getString(2));
                        applicant.setApplicantusername(res.getString(3));
                        applicant.setApplicantpassword(res.getString(4));

                        session.setAttribute("applicantid", applicant.getApplicantid());
                        session.setAttribute("applicantname", applicant.getApplicantname());
                        session.setAttribute("applicantusername",applicant.getApplicantusername());
                        session.setAttribute("applicantpassword",applicant.getApplicantpassword());

                        response.sendRedirect("homepageApplicant.jsp");

                    }else{

                        out.println("User not exist");

                    }
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /*######################################################( UPDATE )#############################################################*/


    private void updateApplicant(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException {

        HttpSession session = request.getSession();
        int applicantid = Integer.parseInt(request.getParameter("applicantid"));
        String applicantname = request.getParameter("applicantname");
        String applicantic = request.getParameter("applicantic");
        String applicantaddress = request.getParameter("applicantaddress");
        String applicantphone = request.getParameter("applicantphone");
        String applicantemail = request.getParameter("applicantemail");
        Date applicantdateofbirth = Date.valueOf(request.getParameter("applicantdateofbirth"));
        String applicantusername = request.getParameter("applicantusername");
        String applicantpassword = request.getParameter("applicantpassword");

        Applicant applicant = new Applicant();

        applicant.setApplicantid(applicantid);
        applicant.setApplicantname(applicantname);
        applicant.setApplicantic(applicantic);
        applicant.setApplicantaddress(applicantaddress);
        applicant.setApplicantphone(applicantphone);
        applicant.setApplicantemail(applicantemail);
        applicant.setApplicantdateofbirth(applicantdateofbirth);
        applicant.setApplicantusername(applicantusername);
        applicant.setApplicantpassword(applicantpassword);

        app.updateApplicant(applicant);
        session.removeAttribute("applicant");
        session.setAttribute("applicant", applicant);
        response.sendRedirect("applicantViewAccount.jsp");
    }

    /*######################################################( DELETE )#############################################################*/

    private void deleteApplicant(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int applicantid = Integer.parseInt(request.getParameter("applicantid"));
        app.deleteApplicant(applicantid);
        response.sendRedirect("index.jsp");
    }

}

