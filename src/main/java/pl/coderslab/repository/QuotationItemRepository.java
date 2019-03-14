package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.QuotationItem;

import java.util.List;

public interface QuotationItemRepository extends JpaRepository<QuotationItem,Long> {

    List<QuotationItem> findAllByQuotationId (Long id);

    List<QuotationItem> findAllByProductId (Long id);

}
