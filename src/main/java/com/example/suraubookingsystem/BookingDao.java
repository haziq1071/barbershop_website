package com.example.suraubookingsystem;
import javax.servlet.http.Part;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class BookingDao {
    String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
    String user = "ibooking";
    String pass = "system";

    protected Connection getConnection()
    {
        Connection connection = null;
        try {
            Class.forName("oracle.jdbc.OracleDriver");
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

    public void staffCreateBooking(Staff staff, Space space, Booking booking) throws Exception{
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into BOOKING(bookingid,staffid,spaceid,eventdate,bookingdescription) values(bookingid_seq.NEXTVAL,?,?,?,?)");)
        {

            preparedStatement.setInt(1, staff.getStaffid());
            preparedStatement.setInt(2, space.getSpaceid());
            preparedStatement.setDate(3, booking.getEventdate());
            preparedStatement.setString(4, booking.getBookingdescription());

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
             PreparedStatement statement = connection.prepareStatement("update BOOKING set bookingstatus = 'batal' where BOOKINGID=?");) {
            statement.setInt(1, bookingid);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public void staffapprovedbooking(int bookingid,int spaceid) throws SQLException, FileNotFoundException {
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
    public void staffrejectbooking(int bookingid) throws SQLException, FileNotFoundException {

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
