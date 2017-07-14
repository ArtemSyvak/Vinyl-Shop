package pack.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import pack.entity.User;
import pack.service.UserService;


@Component
public class UserValidator implements Validator {

    @Autowired
    UserService userService;

    public boolean supports(Class<?> aClass) {
        return aClass.equals(User.class);
    }

    public void validate(Object target, Errors errors) {

        User user = (User) target;
        User byName = userService.findByName(user.getUsername());
        if (user.getPassword().equals(byName.getPassword()));
        else errors.rejectValue("password", "error", "wrong password");
    }
}
