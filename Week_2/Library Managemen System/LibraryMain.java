import java.io.*;
import java.util.*;

public class LibraryMain {
    public static void main(String[] args) {
        LibraryManager libManager = new LibraryManager();

        Book book1 = new Book("Song of Ice and Fire", "George", "12345");
        Book book2 = new Book("Think and Grow", "Napolean", "54321");
        libManager.addBook(book1);
        libManager.addBook(book2);

        User user1 = new User("Aravind", "U1", new ArrayList<>());
        User user2 = new User("Raju", "U2", new ArrayList<>());
        libManager.addUser(user1);
        libManager.addUser(user2);

        try {
            libManager.borrowBook("12345", "U1");
            libManager.borrowBook("54321", "U2");
            libManager.returnBook("12345", "U1");
            libManager.reserveBook("54321", "U2");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
