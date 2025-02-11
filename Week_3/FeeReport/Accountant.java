import java.sql.*;
import java.util.Scanner;

public class Accountant {
    int id;
    String name;
    String email;
    String phone;
    String password;

    public static boolean addAccountant(Connection connection, String name, String email, String phone, String password) {
        try {
            String query = "INSERT INTO accountant(name, email, phone, password) VALUES('" + name + "', '" + email + "', '" + phone + "', '" + password + "')";
            Statement stmt = connection.createStatement();
            int result = stmt.executeUpdate(query);
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void viewAccountants(Connection connection) {
        try {
            String query = "SELECT * FROM accountant";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("id") + ", Name: " + rs.getString("name") + ", Email: " + rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean editAccountant(Connection connection, int id) {
        try {
            Scanner sc = new Scanner(System.in);
            System.out.print("Enter New Name: ");
            String newName = sc.nextLine();
            System.out.print("Enter New Email: ");
            String newEmail = sc.nextLine();
            System.out.print("Enter New Phone: ");
            String newPhone = sc.nextLine();
            System.out.print("Enter New Password: ");
            String newPassword = sc.nextLine();

            String query = "UPDATE accountant SET name = '" + newName + "', email = '" + newEmail + "', phone = '" + newPhone + "', password = '" + newPassword + "' WHERE id = " + id;
            Statement stmt = connection.createStatement();
            int result = stmt.executeUpdate(query);
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean deleteAccountant(Connection connection, int id) {
        try {
            String query = "DELETE FROM accountant WHERE id = " + id;
            Statement stmt = connection.createStatement();
            int result = stmt.executeUpdate(query);
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void manageStudents(Connection connection) {
        Scanner sc = new Scanner(System.in);
        System.out.println("1. Add Student");
        System.out.println("2. View Students");
        System.out.println("3. Edit Student");
        System.out.println("4. Delete Student");
        System.out.println("5. View Pending Fee");
        int choice = sc.nextInt();
        sc.nextLine();

        switch (choice) {
            case 1:
                System.out.print("Enter Name: ");
                String name = sc.nextLine();
                System.out.print("Enter Email: ");
                String email = sc.nextLine();
                System.out.print("Enter Course: ");
                String course = sc.nextLine();
                System.out.print("Enter Fee: ");
                double fee = sc.nextDouble();
                System.out.print("Enter Paid Fee: ");
                double paid = sc.nextDouble();
                double due = fee - paid;
                sc.nextLine();
                System.out.print("Enter Address: ");
                String address = sc.nextLine();
                System.out.print("Enter Phone: ");
                String phone = sc.nextLine();
                Student.addStudent(connection, name, email, course, fee, paid, due, address, phone);
                break;
            case 2:
                Student.viewStudents(connection);
                break;
            case 3:
                System.out.print("Enter Student ID to Edit: ");
                int studentId = sc.nextInt();
                sc.nextLine();
                Student.editStudent(connection, studentId);
                break;
            case 4:
                System.out.print("Enter Student ID to Delete: ");
                int deleteStudentId = sc.nextInt();
                Student.deleteStudent(connection, deleteStudentId);
                break;
            case 5:
                Student.viewPendingFee(connection);
                break;
            default:
                System.out.println("Invalid Choice");
        }
    }

    public static void logout() {
        System.out.println("Logging out...");
    }
}
