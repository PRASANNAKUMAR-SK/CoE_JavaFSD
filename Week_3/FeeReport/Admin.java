import java.sql.*;
import java.util.Scanner;

public class Admin {
    int id;
    String username;
    String password;

    public static Admin login(Connection connection, String username, String password) {
        try {
            String query = "SELECT * FROM admin WHERE username = '" + username + "' AND password = '" + password + "'";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            if (rs.next()) {
                Admin admin = new Admin();
                admin.id = rs.getInt("id");
                admin.username = rs.getString("username");
                admin.password = rs.getString("password");
                return admin;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void manageAccountants(Connection connection) {
        Scanner sc = new Scanner(System.in);
        System.out.println("1. Add Accountant");
        System.out.println("2. View Accountants");
        System.out.println("3. Edit Accountant");
        System.out.println("4. Delete Accountant");
        int choice = sc.nextInt();
        sc.nextLine();

        switch (choice) {
            case 1:
                System.out.print("Enter Name: ");
                String name = sc.nextLine();
                System.out.print("Enter Email: ");
                String email = sc.nextLine();
                System.out.print("Enter Phone: ");
                String phone = sc.nextLine();
                System.out.print("Enter Password: ");
                String password = sc.nextLine();
                Accountant.addAccountant(connection, name, email, phone, password);
                break;
            case 2:
                Accountant.viewAccountants(connection);
                break;
            case 3:
                System.out.print("Enter Accountant ID to Edit: ");
                int id = sc.nextInt();
                sc.nextLine();
                Accountant.editAccountant(connection, id);
                break;
            case 4:
                System.out.print("Enter Accountant ID to Delete: ");
                int deleteId = sc.nextInt();
                Accountant.deleteAccountant(connection, deleteId);
                break;
            default:
                System.out.println("Invalid Choice");
        }
    }

    public static void logout() {
        System.out.println("Logging out...");
    }
}
