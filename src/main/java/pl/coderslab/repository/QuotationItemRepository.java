package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.QuotationItem;

public interface QuotationItemRepository extends JpaRepository<QuotationItem,Long> {
}
