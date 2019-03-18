package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.FileUpload;
import pl.coderslab.repository.FileUploadRepository;

import java.util.List;

@Service
@Transactional
public class FileUploadService {

    @Autowired
    private FileUploadRepository fileUploadRepository;

    public List<FileUpload> findAll() {
        return fileUploadRepository.findAll();
    }

    public FileUpload findById(Long id) {
        return fileUploadRepository.findOne(id);
    }

    public void save(FileUpload entity) {
        fileUploadRepository.save(entity);
    }

    public void delete(Long id) {
        fileUploadRepository.delete(id);
    }
}
