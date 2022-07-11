package com.example.suraubookingsystem;
import javax.servlet.http.Part;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class BookingDao {
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

    public void staffcreatebooking(Booking booking, int staffid) throws SQLException{
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO BOOKING (BOOKINGDESCRIPTION,EVENTDATE,STAFFID,BOOKINGSPACE) VALUES (?,?,?,?)");)
        {

            preparedStatement.setString(1, booking.getBookingdescription());
            //preparedStatement.setInt(2, space.getSpaceid());
            preparedStatement.setDate(2, booking.getEventdate());
            preparedStatement.setInt(3, staffid);
            preparedStatement.setString(4, booking.getBookingspace());

            //out.println(preparedStatement);
            preparedStatement.executeUpdate();
            
        }
        //catch (SQLException e) {
        catch (Exception e) {
            //printSQLException(e);
            e.printStackTrace();
        }
    }

    public void applicantcreatebooking(Applicant applicant, Space space, Booking booking) throws Exception{
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into booking(applicantid,spaceid,eventdate,bookingdescription,bookingspace) values(?,?,?,?,?)");)
        {

            preparedStatement.setInt(1, applicant.getApplicantid());
            preparedStatement.setInt(2, space.getSpaceid());
            preparedStatement.setDate(3, booking.getEventdate());
            preparedStatement.setString(4, booking.getBookingdescription());
            preparedStatement.setString(5, booking.getBookingspace());

            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {
            printSQLException(e);
        }
    }

    public boolean staffcancelbooking(int bookingid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from booking where bookingid=?");) {
            statement.setInt(1, bookingid);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean applicantcancelbooking(int bookingid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from booking where bookingid=?");) {
            statement.setInt(1, bookingid);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public void staffapprovedbooking(int bookingid,int spaceid) throws SQLException {
        String bookingstatus="Approved";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE BOOKING SET BOOKINGSTATUS=? WHERE BOOKINGID=?");) {

            statement.setString(1, bookingstatus);
            statement.setInt(2, bookingid);
            int row = statement.executeUpdate();

            if (row == 1){
                PreparedStatement statement2 = connection.prepareStatement("UPDATE BOOKING SET BOOKINGSTATUS='DIBATALKAN' WHERE BOOKINGSTATUS='DALAM PROGRESS' AND spaceid=?");
                statement2.setInt(1, spaceid);
                statement2.executeUpdate();
                System.out.println("Semua tempahan dalam progress akan dibatalkan setelah salah satu disahkan");

            }
        }
    }
    public void staffrejectbooking(int bookingid) throws SQLException {

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE BOOKING SET BOOKINGSTATUS='Approved' WHERE BOOKINGID=?");) {
             statement.setInt(1, bookingid);
             statement.executeUpdate();
        }
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
