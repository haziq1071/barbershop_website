package com.example.suraubookingsystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class RoomDao {

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

      public void createRoom(Room room) throws SQLException  {

        try (Connection connection = getConnection();
             PreparedStatement prepareStatement = connection.prepareStatement("insert into room(spacename,spacecapacity,spacestatus,soundsystem,tablequantity,chairquantity) values(?,?,?,?,?,?)");)
        {

            prepareStatement.setString(1, room.getSpacename());
            prepareStatement.setInt(2, room.getSpacecapacity());
            prepareStatement.setString(3, room.getSpacestatus());
            prepareStatement.setString(4, room.getSoundsystem());
            prepareStatement.setInt(5, room.getTablequantity());
            prepareStatement.setInt(6, room.getChairquantity());

            out.println(prepareStatement);
            prepareStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public boolean updateRoom(Room room) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("UPDATE room SET spacename=?,spacecapacity=?,spacestatus=?,soundsystem=?,tablequantity=?,chairquantity=?where spaceid=?");)
        {
            ps.setString(1, room.getSpacename());
            ps.setInt(2, room.getSpacecapacity());
            ps.setString(3, room.getSpacestatus());
            ps.setString(4, room.getSoundsystem());
            ps.setInt(5, room.getTablequantity());
            ps.setInt(6, room.getChairquantity());
            ps.setInt(7, room.getSpaceid());

            rowUpdated = ps.executeUpdate() > 0;

        }
        return rowUpdated;
    }

    public boolean deleteRoom(int spaceid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("delete from room where spaceid=?");) {
            ps.setInt(1, spaceid);
            rowDeleted = ps.executeUpdate() > 0;
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
