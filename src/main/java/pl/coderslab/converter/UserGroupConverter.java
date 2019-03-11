package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.UserGroup;
import pl.coderslab.service.UserGroupService;

public class UserGroupConverter implements Converter<String, UserGroup> {

    @Autowired
    private UserGroupService userGroupService;

    @Override
    public UserGroup convert(String s) {
        return userGroupService.findById(Long.parseLong(s));
    }
}
