import java.util.List;

public abstract class LibrarySystem implements Library {
    protected List<Book> books;
    protected List<User> users;

    public abstract void addBook(Book book);
    public abstract void addUser(User user);

    public Book searchBook(String title) {
        for (Book book : books) {
            if (book.getTitle().equalsIgnoreCase(title)) {
                return book;
            }
        }
        return null;
    }
}
