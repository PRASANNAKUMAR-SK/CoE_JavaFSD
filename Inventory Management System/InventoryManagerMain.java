import java.util.*;

public class InventoryManagerMain {
    public static void main(String[] args) {
        InventoryManager inventoryManager = new InventoryManager();

        Location loc1 = new Location(1, 1, 1);
        Product prod1 = new Product("P1", "Laptop", 10, loc1);
        inventoryManager.addProduct(prod1);

        Location loc2 = new Location(1, 1, 2);
        Product prod2 = new Product("P2", "Keyboard", 50, loc2);
        inventoryManager.addProduct(prod2);

        Order order1 = new Order("O001", Arrays.asList("P1", "P2"), Order.Priority.EXPEDITED);
        Order order2 = new Order("O002", Arrays.asList("P1"), Order.Priority.STANDARD);

        inventoryManager.addOrder(order1);
        inventoryManager.addOrder(order2);

        inventoryManager.processOrders();
    }
}
