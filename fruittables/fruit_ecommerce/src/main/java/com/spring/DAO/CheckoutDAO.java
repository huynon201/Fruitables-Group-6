package com.spring.DAO;

import com.spring.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class CheckoutDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int addCheckout(Checkout checkout) {
        String sql = "INSERT INTO orders " +
                "(total_price, total_product, address, desc_order, email, customer_id, phone, payment_method, status_payment) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        return jdbcTemplate.update(sql,
                checkout.getTotal(),
                checkout.getQuantity(),
                checkout.getAddress(),
                checkout.getDesc_order(),
                checkout.getEmail(),
                checkout.getUserid(),
                checkout.getPhone(),
                checkout.getPaymentMethod(),
                checkout.getStatusPayment());
    }

    public int getIDLastBill() {
        String sql = "SELECT MAX(id) FROM orders";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public int addCheckoutDetail(CheckoutDetail checkoutDetail) {
        String sql = "INSERT INTO order_detail (product_id, order_id, quantity, total_paid) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                checkoutDetail.getProductID(),
                checkoutDetail.getCheckoutID(),
                checkoutDetail.getQuantity(),
                checkoutDetail.getTotal());
    }

    public void updateQuantity(CheckoutDetail checkoutDetail) {
        String sql = "UPDATE product SET quantity = quantity - ? WHERE id = ?";
        jdbcTemplate.update(sql, checkoutDetail.getQuantity(), checkoutDetail.getProductID());
    }

    public void updateSellQuantity(CheckoutDetail checkoutDetail) {
        String sql = "UPDATE product SET sell_quantity = sell_quantity + ? WHERE id = ?";
        jdbcTemplate.update(sql, checkoutDetail.getQuantity(), checkoutDetail.getProductID());
    }

    public List<Checkout> getOrder(int userID) {
        String sql = "SELECT * FROM orders WHERE customer_id = ?";
        return jdbcTemplate.query(sql, new Object[]{userID}, new CheckoutMapper());
    }

    public List<OrderDetail> getOrderDetail(int checkoutID) {
        String sql = "SELECT fullname, product_img, product_name, product_price, order_detail.quantity, total_price, orders.status, orders.id " +
                "FROM order_detail " +
                "INNER JOIN product ON order_detail.product_id = product.id " +
                "INNER JOIN orders ON order_detail.order_id = orders.id " +
                "WHERE orders.id = ?";
        return jdbcTemplate.query(sql, new Object[]{checkoutID}, new OrderDetailMapper());
    }

    public OrderDetail getOneOrderDetail(int checkoutID) {
        String sql = "SELECT fullname, product_img, product_name, product_price, order_detail.quantity, total_price, orders.status, orders.id " +
                "FROM order_detail " +
                "INNER JOIN product ON order_detail.product_id = product.id " +
                "INNER JOIN orders ON order_detail.order_id = orders.id " +
                "WHERE orders.id = ? LIMIT 1";
        return jdbcTemplate.queryForObject(sql, new Object[]{checkoutID}, new OrderDetailMapper());
    }

    public Checkout findById(int id) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new CheckoutMapper());
    }

    public void updateOrderStatus(int id, String status) {
        String sql = "UPDATE orders SET status = ? WHERE id = ?";
        jdbcTemplate.update(sql, status, id);
    }

    public void deleteCheckoutDetails(int checkoutID) {
        String sql = "DELETE FROM order_detail WHERE order_id = ?";
        jdbcTemplate.update(sql, checkoutID);
    }

    public void updateQuantityOnCancel(int productID, int quantity) {
        String sql = "UPDATE product SET quantity = quantity + ? WHERE id = ?";
        jdbcTemplate.update(sql, quantity, productID);
    }

    public List<CheckoutDetail> getCheckoutDetails(int checkoutID) {
        String sql = "SELECT * FROM order_detail WHERE order_id = ?";
        return jdbcTemplate.query(sql, new Object[]{checkoutID}, new CheckoutDetailMapper());
    }

    public List<OrderDetail> getOrderDetailByOrder(int orderID) {
        String sql = "SELECT od.*, product_name, product_price, product_img " +
                "FROM order_detail od " +
                "INNER JOIN product p ON od.product_id = p.id " +
                "WHERE od.order_id = ?";
        return jdbcTemplate.query(sql, new Object[]{orderID}, new OrderDetailMapper());
    }

    public Checkout orderById(int orderID) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{orderID}, new CheckoutMapper());
    }
}
