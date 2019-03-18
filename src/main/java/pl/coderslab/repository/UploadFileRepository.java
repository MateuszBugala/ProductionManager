package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.UploadFile;

public interface UploadFileRepository extends JpaRepository<UploadFile,Long> {
}
