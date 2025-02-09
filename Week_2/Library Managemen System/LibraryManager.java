import java.util.*;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class LibraryManager extends LibrarySystem {
    private static final int MAX_BOOKS_ALLOWED = 5;
    private Lock lock = new ReentrantLock();

    public LibraryManager() {
        books = new ArrayList<>();
        users = new ArrayList<>();
    }

    public void addBook(Book book) {
        books.add(book);
    }

    public void addUser(User user) {
        users.add(user);
    }

    @Override
    public void borrowBook(String ISBN, String userID) throws BookNotFoundException, UserNotFoundException, MaxBooksAllowedException {
        lock.lock();
        try {
            User user = findUserByID(userID);
            Book book = findBookByISBN(ISBN);
            if (book == null) {
                throw new BookNotFoundException("Book not found with ISBN: " + ISBN);
            }
            if (user == null) {
                throw new UserNotFoundException("User not found with ID: " + userID);
            }
            if (user.getBorrowedBooks().size() >= MAX_BOOKS_ALLOWED) {
                throw new MaxBooksAllowedException("User has already borrowed the maximum number of books.");
            }
            user.getBorrowedBooks().add(book);
            System.out.println("Book borrowed successfully: " + book.getTitle());
        } finally {
            lock.unlock();
        }
    }

    @Override
    public void returnBook(String ISBN, String userID) throws BookNotFoundException, UserNotFoundException {
        lock.lock();
        try {
            User user = findUserByID(userID);
            Book book = findBookByISBN(ISBN);
            if (book == null) {
                throw new BookNotFoundException("Book not found with ISBN: " + ISBN);
            }
            if (user == null) {
                throw new UserNotFoundException("User not found with ID: " + userID);
            }
            user.getBorrowedBooks().remove(book);
            System.out.println("Book returned successfully: " + book.getTitle());
        } finally {
            lock.unlock();
        }
    }

    @Override
    public void reserveBook(String ISBN, String userID) throws BookNotFoundException, UserNotFoundException {
        User user = findUserByID(userID);
        Book book = findBookByISBN(ISBN);
        if (book == null) {
            throw new BookNotFoundException("Book not found with ISBN: " + ISBN);
        }
        if (user == null) {
            throw new UserNotFoundException("User not found with ID: " + userID);
        }
        System.out.println("Book reserved successfully: " + book.getTitle());
    }

    private User findUserByID(String userID) {
        for (User user : users) {
            if (user.getUserID().equals(userID)) {
                return user;
            }
        }
        return null;
    }

    private Book findBookByISBN(String ISBN) {
        for (Book book : books) {
            if (book.getISBN().equals(ISBN)) {
                return book;
            }
        }
        return null;
    }
}
