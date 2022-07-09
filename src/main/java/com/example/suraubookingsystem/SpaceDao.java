package com.example.suraubookingsystem;

import java.io.*;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;

import static java.lang.System.out;

public class SpaceDao {

    String dbURL = "jdbc:postgresql://ec2-52-72-56-59.compute-1.amazonaws.com:5432/d274lnoegak379";
    String user = "dnzxqagexabepj";
    String pass = "edb330e6fe55ed3bb6d1ee1eb3c1f995e6b205eb5d464bee634abc3345b2d294";

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

    public void createSpace(Space space) throws SQLException  {

        try (Connection connection = getConnection();
             PreparedStatement prepareStatement = connection.prepareStatement("insert into space( spacename, spacecapacity, spacestatus, soundsystem, tablequantity, chairquantity) values(?,?,?,?,?,?)");)
        {
            prepareStatement.setString(1, space.getSpacename());
            prepareStatement.setInt(2, space.getSpacecapacity());
            prepareStatement.setString(3, space.getSpacestatus());
            prepareStatement.setString(4, space.getSoundsystem());
            prepareStatement.setInt(5, space.getTablequantity());
            prepareStatement.setInt(6, space.getChairquantity());
            prepareStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public boolean updateSpace(Space space) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("UPDATE space SET spacename=?,spacecapacity=?,spacestatus=?,soundsystem=?, tablequantity=?, chairquantity=? WHERE spaceid=?");)
        {

            ps.setString(1, space.getSpacename());
            ps.setInt(2, space.getSpacecapacity());
            ps.setString(3, space.getSpacestatus());
            ps.setString(4, space.getSoundsystem());
            ps.setInt(5, space.getTablequantity());
            ps.setInt(6, space.getChairquantity());
            ps.setInt(7, space.getSpaceid());
            ps.executeUpdate();

            rowUpdated = ps.executeUpdate() > 0;

        }
        return rowUpdated;
    }


    public boolean deleteSpace(int spaceid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("delete from space WHERE spaceid=?");) {
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
