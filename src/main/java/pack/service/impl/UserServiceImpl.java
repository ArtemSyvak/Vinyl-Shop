package pack.service.impl;

import pack.dao.UserDAO;
import pack.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pack.model.UserInfo;
import pack.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService, UserDetailsService {

    @Autowired
    UserDAO userDAO;

    @Autowired
    PasswordEncoder passwordEncoder;

    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return findByEmail(email);
    }

    public void save(User user) {
        userDAO.save(user);
    }

    public void saveWithPassword(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userDAO.save(user);
    }

    public User findByEmail(String email) {
        return userDAO.findByEmail(email);
    }

    public User findOne(int id) {
        return userDAO.findOne(id);
    }

    public UserInfo findUserInfo(int id) {
        return new UserInfo(userDAO.findOne(id));
    }

    public void setUserSettings(User modelUser) {
        System.out.println("From serviceImpl" + modelUser);
        User user = userDAO.findByEmail(modelUser.getEmail());
        if(user!=null){
            user.setFirstname(modelUser.getFirstname());
            user.setSurname(modelUser.getSurname());
            user.setPhone(modelUser.getPhone());
            user.setEmail(modelUser.getEmail());
            user.setPassword(passwordEncoder.encode(modelUser.getPassword()));
            userDAO.save(user);
        }

    }
}
