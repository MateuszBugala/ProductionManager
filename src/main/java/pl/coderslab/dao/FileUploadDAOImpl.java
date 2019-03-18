package pl.coderslab.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.UploadFile;

@Repository
public class FileUploadDAOImpl implements FileUploadDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public FileUploadDAOImpl() {
    }

    public FileUploadDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public void save(UploadFile uploadFile) {
        sessionFactory.getCurrentSession().save(uploadFile);
    }
}