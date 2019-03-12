package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.User;
import pl.coderslab.repository.UserRepository;

import java.util.List;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public User findById(Long id) {
        return userRepository.findOne(id);
    }

    public void save(User entity) {
        userRepository.save(entity);
    }

    public void update(User entity) {
        String pass = findById(entity.getId()).getPassword();
        entity.setPassword(pass);
        userRepository.save(entity);
    }

    public void delete(Long id) {
        userRepository.delete(id);
    }
}
