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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.removeAttribute("applicantid");
        session.invalidate();
        response.sendRedirect("index.jsp");
    }
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
                /*case "viewApplicant":
                    viewApplicant(request, response);
                    break;*/
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
        String applicantaddress = request.getParameter("applicantaddress");
        String applicantphone = request.getParameter("applicantphone");
        String applicantemail = request.getParameter("applicantemail");
        Date applicantdateofbirth = Date.valueOf(request.getParameter("applicantdateofbirth"));
        String applicantusername = request.getParameter("applicantusername");
        String applicantpassword = request.getParameter("applicantpassword");

       Applicant applicant = new Applicant();

        applicant.setApplicantname(applicantname);
        applicant.setApplicantic(applicantic);
        applicant.setApplicantaddress(applicantaddress);
        applicant.setApplicantphone(applicantphone);
        applicant.setApplicantemail(applicantemail);
        applicant.setApplicantdateofbirth(applicantdateofbirth);
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
            String dbURL = "jdbc:postgresql://ec2-52-72-56-59.compute-1.amazonaws.com:5432/d274lnoegak379"; //ni url dri heroku database
            String user = "dnzxqagexabepj"; //ni user dri heroku database
            String pass = "edb330e6fe55ed3bb6d1ee1eb3c1f995e6b205eb5d464bee634abc3345b2d294"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            String sql  ="SELECT * from applicant";

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

                        session.setAttribute("applicantid", res.getInt(1));

                        response.sendRedirect("homepageApplicant.jsp");


                    }else{

                        response.sendRedirect("index.jsp");

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
        response.sendRedirect("viewApplicant.jsp");
    }

    /*######################################################( DELETE )#############################################################*/

    private void deleteApplicant(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int applicantid = Integer.parseInt(request.getParameter("applicantid"));
        app.deleteApplicant(applicantid);
        response.sendRedirect("index.jsp");
    }
}
