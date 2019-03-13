package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Quotation;

public interface QuotationRepository extends JpaRepository<Quotation,Long> {
}
