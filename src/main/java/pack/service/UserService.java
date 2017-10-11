package pack.service;

import org.springframework.security.core.userdetails.UserDetails;
import pack.entity.User;
import pack.model.UserInfo;

public interface UserService {

    void save(User user);
    User findByEmail(String email);
    User findOne(int id);
    UserInfo findUserInfo(int id);
    UserDetails loadUserByUsername(String email);
    void setUserSettings(User userModel);


}
