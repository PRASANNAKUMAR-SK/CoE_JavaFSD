import java.util.*;
import java.util.concurrent.*;

public class InventoryManager {
    private Map<String, Product> products;
    private PriorityQueue<Order> orderQueue;

    public InventoryManager() {
        products = new ConcurrentHashMap<>();
        orderQueue = new PriorityQueue<>(new OrderComparator());
    }

    public synchronized void addProduct(Product product) {
        products.put(product.getProductID(), product);
    }

    public void processOrders() {
        while (!orderQueue.isEmpty()) {
            Order order = orderQueue.poll();
            new Thread(new OrderProcessor(order)).start();
        }
    }

    public void addOrder(Order order) {
        orderQueue.add(order);
    }

    private class OrderProcessor implements Runnable {
        private Order order;

        public OrderProcessor(Order order) {
            this.order = order;
        }

        @Override
        public void run() {
            for (String productID : order.getProductIDs()) {
                Product product = products.get(productID);
                if (product != null && product.getQuantity() > 0) {
                    product.setQuantity(product.getQuantity() - 1);
                    System.out.println("Order processed for Product: " + productID + ", Quantity left: " + product.getQuantity());
                } else {
                    System.out.println("Out of stock for Product: " + productID);
                }
            }
        }
    }

    private class OrderComparator implements Comparator<Order> {
        @Override
        public int compare(Order o1, Order o2) {
            return o1.getPriority().compareTo(o2.getPriority());
        }
    }
}
