import java.sql.*;

public class TableCreation {

    public static void createTables(Connection connection) {
        try {
            Statement stmt = connection.createStatement();
            
            
            String createAdminTable = "CREATE TABLE IF NOT EXISTS admin (" +
                    "id INT PRIMARY KEY AUTO_INCREMENT, " +
                    "username VARCHAR(50) NOT NULL UNIQUE, " +
                    "password VARCHAR(255) NOT NULL)";
            stmt.executeUpdate(createAdminTable);
            System.out.println("Admin table created successfully.");

            
            String createAccountantTable = "CREATE TABLE IF NOT EXISTS accountant (" +
                    "id INT PRIMARY KEY AUTO_INCREMENT, " +
                    "name VARCHAR(100) NOT NULL, " +
                    "email VARCHAR(100) NOT NULL UNIQUE, " +
                    "phone VARCHAR(15) NOT NULL, " +
                    "password VARCHAR(255) NOT NULL)";
            stmt.executeUpdate(createAccountantTable);
            System.out.println("Accountant table created successfully.");

            
            String createStudentTable = "CREATE TABLE IF NOT EXISTS student (" +
                    "id INT PRIMARY KEY AUTO_INCREMENT, " +
                 "name VARCHAR(100) NOT NULL, " +
                 "email VARCHAR(100) NOT NULL UNIQUE, " +
                    "course VARCHAR(100) NOT NULL, " +
                    "fee DOUBLE NOT NULL, " +
                    "paid DOUBLE NOT NULL, " +
                    "due DOUBLE NOT NULL, " +
                    "address TEXT NOT NULL, " +
                    "phone VARCHAR(15) NOT NULL)";
            stmt.executeUpdate(createStudentTable);
            System.out.println("Student table created successfully.");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
