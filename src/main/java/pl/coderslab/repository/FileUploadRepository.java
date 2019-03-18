package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.FileUpload;

public interface FileUploadRepository extends JpaRepository<FileUpload,Long> {
}
