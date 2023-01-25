package com.example.suraubookingsystem;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class SpaceDao {

    String dbURL = "jdbc:postgresql://containers-us-west-141.railway.app:7894/railway";
    String user = "postgres";
    String pass = "UyduWFTEPVisrjXTehXg";

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
             PreparedStatement prepareStatement = connection.prepareStatement("insert into space(spacename,spacecapacity,spacestatus,soundsystem,tablequantity,chairquantity) values(?,?,?,?,?,?)");)
        {

            prepareStatement.setString(1, space.getSpacename());
            prepareStatement.setInt(2, space.getSpacecapacity());
            prepareStatement.setString(3, space.getSpacestatus());
            prepareStatement.setString(4, space.getSoundsystem());
            prepareStatement.setInt(5, space.getTablequantity());
            prepareStatement.setInt(6, space.getChairquantity());

            out.println(prepareStatement);
            prepareStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public boolean updateSpace(Space space) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("UPDATE space SET spacename=?,spacecapacity=?,spacestatus=?,soundsystem=?,tablequantity=?,chairquantity=?where spaceid=?");)
        {
            ps.setString(1, space.getSpacename());
            ps.setInt(2, space.getSpacecapacity());
            ps.setString(3, space.getSpacestatus());
            ps.setString(4, space.getSoundsystem());
            ps.setInt(5, space.getTablequantity());
            ps.setInt(6, space.getChairquantity());
            ps.setInt(7, space.getSpaceid());

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
