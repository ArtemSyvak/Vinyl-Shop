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
        if (user.getPassword().length()<8){
             errors.rejectValue("password", "error", "invalid password");
        }

        try {
              if (user.getEmail().length()<=0||userService.findByEmail(user.getEmail()).isEnabled()){
                errors.rejectValue("email", "error1", "invalid or already exists name");
            }
        }catch (NullPointerException e){}

    }
}
