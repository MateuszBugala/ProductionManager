package pl.coderslab.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "quotation_item")
public class QuotationItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Product product;

    @ManyToOne
    private Quotation quotation;

    private int quantity;
    private BigDecimal price;
    private LocalDate requiredDeliveryDate;
    private LocalDate actualDeliveryDate;
    private String notes;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Quotation getQuotation() {
        return quotation;
    }

    public void setQuotation(Quotation quotation) {
        this.quotation = quotation;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public LocalDate getRequiredDeliveryDate() {
        return requiredDeliveryDate;
    }

    public void setRequiredDeliveryDate(LocalDate requiredDeliveryDate) {
        this.requiredDeliveryDate = requiredDeliveryDate;
    }

    public LocalDate getActualDeliveryDate() {
        return actualDeliveryDate;
    }

    public void setActualDeliveryDate(LocalDate actualDeliveryDate) {
        this.actualDeliveryDate = actualDeliveryDate;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "QuotationItem{" +
                "id=" + id +
                ", product=" + product +
                ", quotation=" + quotation +
                ", quantity=" + quantity +
                ", price=" + price +
                ", requiredDeliveryDate=" + requiredDeliveryDate +
                ", actualDeliveryDate=" + actualDeliveryDate +
                ", notes='" + notes + '\'' +
                '}';
    }
}
