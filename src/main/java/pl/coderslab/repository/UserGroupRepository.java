package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.UserGroup;

public interface UserGroupRepository extends JpaRepository<UserGroup,Long> {
}
