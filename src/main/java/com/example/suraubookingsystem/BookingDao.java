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


    //public void applicantcreatebooking(Booking booking, Space space, Room room, Applicant applicant) throws SQLException{
    public void applicantcreatebooking(Booking booking, Applicant applicant) throws SQLException{
        try (Connection connection = getConnection();
            // PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO BOOKING (BOOKINGDESCRIPTION,BOOKINGTIME,BOOKINGSTATUS,EVENTDATE,SPACEID,ROOMID,APPLICANTID,BOOKINGDATE) VALUES (?,?,?,?,?,?,?,CURRENT_DATE)");)
             PreparedStatement preparedStatement = connection.prepareStatement("insert into booking(bookingstatus,eventdate,eventtime,eventdescription,eventspace,applicantid,bookingdate) VALUES (?,?,?,?,?,?,CURRENT_DATE)");)
        {
            preparedStatement.setString(1, booking.getBookingstatus());
            preparedStatement.setDate(2, booking.getEventdate());
            preparedStatement.setString(3, booking.getEventtime());
            preparedStatement.setString(4, booking.getEventdescription());
            preparedStatement.setString(5, booking.getEventspace());
            preparedStatement.setInt(6, applicant.getApplicantid());/*
            prepareStatement.setInt(7, room.getRoomid());
            prepareStatement.setInt(8, applicant.getApplicantid());*/
          }
        catch (Exception e) {
            e.printStackTrace();
        }
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
    public void staffapprovedbooking(int bookingid) throws SQLException{
        String bookingstatus="Diluluskan";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE BOOKING SET BOOKINGSTATUS=?WHERE BOOKINGID=?");) {
            statement.setString(1, bookingstatus);
            statement.setInt(2, bookingid);
            int row = statement.executeUpdate();

        }
    }
    public void staffrejectbooking(int bookingid) throws SQLException{
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
