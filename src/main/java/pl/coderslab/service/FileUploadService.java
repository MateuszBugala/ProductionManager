package pl.coderslab.service;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.UploadFile;
import pl.coderslab.repository.UploadFileRepository;

@Service
@Transactional
public class FileUploadService {

    @Autowired
    private UploadFileRepository uploadFileRepository;

    public void save(UploadFile uploadFile) {
        uploadFileRepository.save(uploadFile);
    }

}
