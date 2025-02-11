import java.sql.*;
import java.util.Scanner;

public class Student {
    int id;
    String name;
    String email;
    String course;
    double fee;
    double paid;
    double due;
    String address;
    String phone;

    public static boolean addStudent(Connection connection, String name, String email, String course, double fee, double paid, double due, String address, String phone) {
        try {
            String query = "INSERT INTO student(name, email, course, fee, paid, due, address, phone) VALUES('" + name + "', '" + email + "', '" + course + "', " + fee + ", " + paid + ", " + due + ", '" + address + "', '" + phone + "')";
            Statement stmt = connection.createStatement();
            int result = stmt.executeUpdate(query);
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void viewStudents(Connection connection) {
        try {
            String query = "SELECT * FROM student";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("id") + ", Name: " + rs.getString("name") + ", Email: " + rs.getString("email") + ", Course: " + rs.getString("course"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean editStudent(Connection connection, int id) {
        try {
            Scanner sc = new Scanner(System.in);
            System.out.print("Enter New Name: ");
            String newName = sc.nextLine();
            System.out.print("Enter New Email: ");
            String newEmail = sc.nextLine();
            System.out.print("Enter New Course: ");
            String newCourse = sc.nextLine();
            System.out.print("Enter New Fee: ");
            double newFee = sc.nextDouble();
            System.out.print("Enter New Paid Fee: ");
            double newPaid = sc.nextDouble();
            double newDue = newFee - newPaid;
            sc.nextLine();
            System.out.print("Enter New Address: ");
            String newAddress = sc.nextLine();
            System.out.print("Enter New Phone: ");
            String newPhone = sc.nextLine();

            String query = "UPDATE student SET name = '" + newName + "', email = '" + newEmail + "', course = '" + newCourse + "', fee = " + newFee + ", paid = " + newPaid + ", due = " + newDue + ", address = '" + newAddress + "', phone = '" + newPhone + "' WHERE id = " + id;
            Statement stmt = connection.createStatement();
            int result = stmt.executeUpdate(query);
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean deleteStudent(Connection connection, int id) {
        try {
            String query = "DELETE FROM student WHERE id = " + id;
            Statement stmt = connection.createStatement();
            int result = stmt.executeUpdate(query);
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void viewPendingFee(Connection connection) {
        try {
            String query = "SELECT * FROM student WHERE due > 0";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                System.out.println("Student ID: " + rs.getInt("id") + ", Name: " + rs.getString("name") + ", Due Fee: " + rs.getDouble("due"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
