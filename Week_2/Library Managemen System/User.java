import java.util.List;

public class User {
    private String name;
    private String userID;
    private List<Book> borrowedBooks;

    public User(String name, String userID, List<Book> borrowedBooks) {
        this.name = name;
        this.userID = userID;
        this.borrowedBooks = borrowedBooks;
    }

    public String getName() {
        return name;
    }

    public String getUserID() {
        return userID;
    }

    public List<Book> getBorrowedBooks() {
        return borrowedBooks;
    }
}
