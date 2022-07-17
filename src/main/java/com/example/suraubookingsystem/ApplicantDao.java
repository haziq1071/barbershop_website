package com.example.suraubookingsystem;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;
//
public class ApplicantDao {
  String dbURL = "jdbc:postgresql://ec2-52-72-56-59.compute-1.amazonaws.com:5432/d274lnoegak379";
  String user = "dnzxqagexabepj";
  String pass = "edb330e6fe55ed3bb6d1ee1eb3c1f995e6b205eb5d464bee634abc3345b2d294";

    protected Connection getConnection()
    {
        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(dbURL, user, pass);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void signupApplicant (Applicant applicant) throws SQLException {

        // try-with-resource statement will auto close the connection.
    try(Connection connection = getConnection();
    PreparedStatement preparedStatement = connection.prepareStatement("insert into applicant(applicantname,applicantic,applicantdateofbirth,applicantaddress,applicantemail,applicantphone,applicantusername,applicantpassword) values(?,?,?,?,?,?,?,?)");)
    {
        preparedStatement.setString(1, applicant.getApplicantname());
        preparedStatement.setString(2, applicant.getApplicantic());
        preparedStatement.setDate(3, applicant.getApplicantdateofbirth());
        preparedStatement.setString(4, applicant.getApplicantaddress());
        preparedStatement.setString(5, applicant.getApplicantemail());
        preparedStatement.setString(6, applicant.getApplicantphone());
        preparedStatement.setString(7, applicant.getApplicantusername());
        preparedStatement.setString(8, applicant.getApplicantpassword());

        out.println(preparedStatement);
        preparedStatement.executeUpdate();
      } catch (SQLException e) {
          printSQLException(e);
      }
    }

    public boolean updateApplicant(Applicant applicant) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE applicant set applicantname=?,applicantic=?,applicantaddress=?,applicantphone=?,applicantemail=?,applicantdateofbirth=?,applicantusername=?,applicantpassword=?where applicantid=?");)
        {
            statement.setString(1, applicant.getApplicantname());
            statement.setString(2, applicant.getApplicantic());
            statement.setString(3, applicant.getApplicantaddress());
            statement.setString(4, applicant.getApplicantphone());
            statement.setString(5, applicant.getApplicantemail());
            statement.setDate(6, applicant.getApplicantdateofbirth());
            statement.setString(7, applicant.getApplicantusername());
            statement.setString(8, applicant.getApplicantpassword());
            statement.setInt(9, applicant.getApplicantid());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    public boolean deleteApplicant(int applicantid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from applicant where applicantid=?");) {
            statement.setInt(1, applicantid);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
