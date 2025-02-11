import java.sql.*;
import java.util.Scanner;

public class FeeReportMain {
    public static void main(String[] args) {
        Connection connection = null;
        Scanner sc = new Scanner(System.in);

        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/feereport", "root", "lion");

            TableCreation.createTables(connection);

            System.out.print("Login as (1) Admin or (2) Accountant: ");
            int userType = sc.nextInt();
            sc.nextLine();  // Consume the newline character

            if (userType == 1) {
                System.out.print("Enter Admin Username: ");
                String username = sc.nextLine();
                System.out.print("Enter Admin Password: ");
                String password = sc.nextLine();

                Admin admin = Admin.login(connection, username, password);
                if (admin != null) {
                    System.out.println("Admin logged in successfully!");
                    Admin.manageAccountants(connection);
                } else {
                    System.out.println("Invalid admin credentials.");
                }
            } else if (userType == 2) {
                System.out.print("Enter Accountant Email: ");
                String email = sc.nextLine();
                System.out.print("Enter Accountant Password: ");
                String password = sc.nextLine();

                Accountant accountant = Accountant.login(connection, email, password);
                if (accountant != null) {
                    System.out.println("Accountant logged in successfully!");
                    Accountant.manageStudents(connection);
                } else {
                    System.out.println("Invalid accountant credentials.");
                }
            } else {
                System.out.println("Invalid choice.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
