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

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return findByName(username);
    }

    public void save(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userDAO.save(user);
    }

    public User findByName(String username) {
        return userDAO.findByUserName(username);
    }

    public User findOne(int id) {
        return userDAO.findOne(id);
    }

    public UserInfo findUserInfo(int id) {
        return new UserInfo(userDAO.findOne(id));
    }

    public void setUserSettings(User modelUser) {
        System.out.println("From serviceImpl" + modelUser);
        User user = userDAO.findByUserName(modelUser.getUsername());
        if(user!=null){
            user.setFullName(modelUser.getFullName());
            user.setAddress(modelUser.getAddress());
            user.setPhone(modelUser.getPhone());
            user.setEmail(modelUser.getEmail());
            user.setPassword(passwordEncoder.encode(modelUser.getPassword()));
            userDAO.save(user);
        }

    }
}
