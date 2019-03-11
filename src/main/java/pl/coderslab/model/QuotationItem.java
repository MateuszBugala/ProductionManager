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

    private int quantity;
    private BigDecimal price;
    private LocalDate requiredDeliveryDate;
    private LocalDate actualDeliveryDate;
    private String notes;
}
