package com.example.suraubookingsystem;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static java.lang.System.out;

public class ServicesDao {

    String dbURL = "jdbc:postgresql://containers-us-west-10.railway.app:7321/railway";
    String user = "postgres";
    String pass = "VmRY0mmQ31AWU2EQureM";

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

      public void createServices(Services services) throws SQLException  {

        try (Connection connection = getConnection();
             PreparedStatement prepareStatement = connection.prepareStatement("insert into Services(servicename,servicedescription,serviceprice) values(?,?,?)");)
        {

            prepareStatement.setString(1, services.getServicename());
            prepareStatement.setString(2, services.getServicedescription());
            prepareStatement.setDouble(3, services.getServiceprice());



            out.println(prepareStatement);
            prepareStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public boolean updateServices(Services services) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("UPDATE services SET servicename=?,servicedescription=?,serviceprice=? where serviceid=?");)
        {

            ps.setString(1, services.getServicename());
            ps.setString(2, services.getServicedescription());
            ps.setDouble(3, services.getServiceprice());
            ps.setInt(4, services.getServiceid());

            rowUpdated = ps.executeUpdate() > 0;

        }
        return rowUpdated;
    }

    public boolean deleteServices(int serviceid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("delete from services where serviceid=?");) {
            ps.setInt(1, serviceid);
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
