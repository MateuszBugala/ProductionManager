package pl.coderslab.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "quotations")
public class Quotation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String customerName;
    private String deliveryTerm;
    private String notes;
    private String remarks;

    @ManyToOne
    private User createdBy;
    private Timestamp creationTime;

    private int status;

    private Timestamp creationTimeStat2;
    private Timestamp creationTimeStat3;
    private Timestamp creationTimeStat4;

    @OneToMany(mappedBy = "quotation", cascade = CascadeType.MERGE)
    private List<QuotationItem> quotationItems = new ArrayList<>();


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getDeliveryTerm() {
        return deliveryTerm;
    }

    public void setDeliveryTerm(String deliveryTerm) {
        this.deliveryTerm = deliveryTerm;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    public Timestamp getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Timestamp creationTime) {
        this.creationTime = creationTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<QuotationItem> getQuotationItems() {
        return quotationItems;
    }

    public void setQuotationItems(List<QuotationItem> quotationItems) {
        this.quotationItems = quotationItems;
    }

    public Timestamp getCreationTimeStat2() {
        return creationTimeStat2;
    }

    public void setCreationTimeStat2(Timestamp creationTimeStat2) {
        this.creationTimeStat2 = creationTimeStat2;
    }

    public Timestamp getCreationTimeStat3() {
        return creationTimeStat3;
    }

    public void setCreationTimeStat3(Timestamp creationTimeStat3) {
        this.creationTimeStat3 = creationTimeStat3;
    }

    public Timestamp getCreationTimeStat4() {
        return creationTimeStat4;
    }

    public void setCreationTimeStat4(Timestamp creationTimeStat4) {
        this.creationTimeStat4 = creationTimeStat4;
    }

    @Override
    public String toString() {
        return "Quotation{" +
                "id=" + id +
                ", customerName='" + customerName + '\'' +
                ", deliveryTerm='" + deliveryTerm + '\'' +
                ", notes='" + notes + '\'' +
                ", remarks='" + remarks + '\'' +
                ", createdBy=" + createdBy +
                ", creationTime=" + creationTime +
                ", status=" + status +
                ", quotationItems=" + quotationItems +
                '}';
    }
}
