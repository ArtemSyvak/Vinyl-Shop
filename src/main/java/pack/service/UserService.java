package pack.service;

import org.springframework.stereotype.Service;
import pack.entity.User;

public interface UserService {
    void save(User user);
    User findByName(String username);


}
