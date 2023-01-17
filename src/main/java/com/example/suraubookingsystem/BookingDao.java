package com.example.suraubookingsystem;
import javax.servlet.http.Part;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class BookingDao {
    String dbURL = "jdbc:postgresql://containers-us-west-141.railway.app:7894/railway";
    String user = "postgres";
    String pass = "ETymgiO6aGYvyXf5fkei";
   
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

    public void staffcreatebooking(Booking booking, Space space, Room room, Staff staff) throws SQLException{
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO BOOKING (BOOKINGDESCRIPTION,BOOKINGTIME,BOOKINGSTATUS,EVENTDATE,SPACEID,ROOMID,STAFFID,BOOKINGDATE) VALUES (?,?,?,?,?,?,?,CURRENT_DATE)");)
        {
            preparedStatement.setString(1, booking.getBookingdescription());
            preparedStatement.setString(2, booking.getBookingtime());
            preparedStatement.setString(3, booking.getBookingstatus());
            preparedStatement.setDate(4, booking.getEventdate());
            preparedStatement.setInt(5, space.getSpaceid());
            preparedStatement.setInt(6, room.getRoomid());
            preparedStatement.setInt(7, staff.getStaffid());
            preparedStatement.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void applicantcreatebooking(Booking booking, Space space, Room room, Applicant applicant) throws SQLException{
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO BOOKING (BOOKINGDESCRIPTION,BOOKINGTIME,BOOKINGSTATUS,EVENTDATE,SPACEID,ROOMID,APPLICANTID,BOOKINGDATE) VALUES (?,?,?,?,?,?,?,CURRENT_DATE)");)
        {
            preparedStatement.setString(1, booking.getBookingdescription());
            preparedStatement.setString(2, booking.getBookingtime());
            preparedStatement.setString(3, booking.getBookingstatus());
            preparedStatement.setDate(4, booking.getEventdate());
            preparedStatement.setInt(5, space.getSpaceid());
            preparedStatement.setInt(6, room.getRoomid());
            preparedStatement.setInt(7, applicant.getApplicantid());
            preparedStatement.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean staffcancelbooking(int bookingid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("update BOOKING set bookingstatus = 'Dibatalkan' where BOOKINGID=?");) {
            statement.setInt(1, bookingid);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public boolean applicantcancelbooking(int bookingid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("update BOOKING set bookingstatus = 'Dibatalkan' where BOOKINGID=?");) {
            statement.setInt(1, bookingid);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public void staffapprovedbooking(int bookingid) throws SQLException, FileNotFoundException {
        String bookingstatus="Diluluskan";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE BOOKING SET BOOKINGSTATUS=?WHERE BOOKINGID=?");) {
            statement.setString(1, bookingstatus);
            statement.setInt(2, bookingid);
            int row = statement.executeUpdate();

        }
    }
    public void staffrejectbooking(int bookingid) throws SQLException, FileNotFoundException {
        String bookingstatus="Ditolak";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE BOOKING SET BOOKINGSTATUS=? WHERE BOOKINGID=?");) {
            statement.setString(1, bookingstatus);
            statement.setInt(2, bookingid);
            int row = statement.executeUpdate();
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
