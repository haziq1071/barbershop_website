package com.example.suraubookingsystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class SpaceDao {

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

    public void createSpace(Space space) throws SQLException  {

        try (Connection connection = getConnection();
             PreparedStatement prepareStatement = connection.prepareStatement("insert into space(spacetype,spacename,spacecapacity,spacestatus,soundsystem) values(?,?,?,?,?)");)
        {
            prepareStatement.setString(1, space.getSpacetype());
            prepareStatement.setString(2, space.getSpacename());
            prepareStatement.setInt(3, space.getSpacecapacity());
            prepareStatement.setString(4, space.getSpacestatus());
            prepareStatement.setString(5, space.getSoundsystem());

            out.println(prepareStatement);
            prepareStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public boolean updateSpace(Space space) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("UPDATE space SET spacetype=?,spacename=?,spacecapacity=?,spacestatus=?,soundsystem=? where spaceid=?");)
        {
            ps.setString(1, space.getSpacetype());
            ps.setString(2, space.getSpacename());
            ps.setInt(3, space.getSpacecapacity());
            ps.setString(4, space.getSpacestatus());
            ps.setString(5, space.getSoundsystem());
            ps.setInt(6, space.getSpaceid());

            rowUpdated = ps.executeUpdate() > 0;

        }
        return rowUpdated;
    }

    public boolean deleteSpace(int spaceid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("delete from space where spaceid=?");) {
            ps.setInt(1, spaceid);
            rowDeleted = ps.executeUpdate() > 0;
        }
        return rowDeleted;
    }

     public void createLecture (Lecture lecture) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("insert into lecture(spaceid,tablequantity,chairquantity) values(?,?,?)"))

        {
            ps.setInt(1, lecture.getSpaceid());
            ps.setInt(2, lecture.getTablequantity());
            ps.setInt(3, lecture.getChairquantity());
            
      
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
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
