package pl.coderslab.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.QuotationItem;
import pl.coderslab.repository.QuotationItemRepository;

import java.util.List;

@Service
@Transactional
public class QuotationItemService {

    @Autowired
    private QuotationItemRepository quotationItemRepository;


    public List<QuotationItem> findAll() {
        return quotationItemRepository.findAll();
    }

    public QuotationItem findById(Long id) {
        return quotationItemRepository.findOne(id);
    }

    public void save(QuotationItem entity) {
        quotationItemRepository.save(entity);
    }

    public void delete(Long id) {
        quotationItemRepository.delete(id);
    }

    public List<QuotationItem> findAllByQuotationId(Long id) {
        return quotationItemRepository.findAllByQuotationId(id);
    }
}
