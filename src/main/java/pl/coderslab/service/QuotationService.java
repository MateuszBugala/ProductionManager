package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.model.Quotation;
import pl.coderslab.model.User;
import pl.coderslab.repository.QuotationRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.sql.Timestamp;
import java.time.LocalDateTime;
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

    public void create(Quotation entity, User user) {
        entity.setCreationTime(Timestamp.valueOf(LocalDateTime.now()));
        entity.setCreatedBy(user);
        entity.setStatus(1);
        quotationRepository.save(entity);
    }

//    poniższy update nadpisze nullem ,creation time, usera i status
    public void update(Quotation entity) {
        Quotation quotationfromDB = quotationRepository.findOne(entity.getId());
        entity.setCreationTime(quotationfromDB.getCreationTime());;
        entity.setCreatedBy(quotationfromDB.getCreatedBy());;
        entity.setStatus(quotationfromDB.getStatus());;
        quotationRepository.save(entity);
    }



    public void delete(Long id) {
        quotationRepository.delete(id);
    }


    public void changeStatus(Long id, int status) {
        Quotation quotation = quotationRepository.findOne(id);
        quotation.setStatus(status);
        quotationRepository.save(quotation);
    }

}
