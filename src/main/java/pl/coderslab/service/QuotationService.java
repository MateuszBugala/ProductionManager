package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.Quotation;
import pl.coderslab.repository.QuotationRepository;

import java.util.List;

@Service
@Transactional
public class QuotationService {

    @Autowired
    private QuotationRepository quotationRepository;


    public List<Quotation> findAll() {
        return quotationRepository.findAll();
    }

    public Quotation findById(Long id) {
        return quotationRepository.findOne(id);
    }

    public void save(Quotation entity) {
        quotationRepository.save(entity);
    }

    public void delete(Long id) {
        quotationRepository.delete(id);
    }

}
