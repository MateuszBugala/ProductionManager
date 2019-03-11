package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.UserGroup;
import pl.coderslab.repository.UserGroupRepository;

import java.util.List;

@Service
@Transactional
public class UserGroupService {

    @Autowired
    private UserGroupRepository userGroupRepository;

    public List<UserGroup> findAll() {
        return userGroupRepository.findAll();
    }

    public UserGroup findById(Long id) {
        return userGroupRepository.findOne(id);
    }

    public void save(UserGroup entity) {
        userGroupRepository.save(entity);
    }

    public void delete(Long id) {
        userGroupRepository.delete(id);
    }
}
