package pack.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import pack.entity.User;


@Component
public class UserValidator implements Validator {

    public boolean supports(Class<?> aClass) {
        return aClass.equals(User.class);
    }

    public void validate(Object target, Errors errors) {

        User user = (User) target;
        if (user.getPassword().length()<8){
             errors.rejectValue("password", "error", "invalid password");
        }
        if (user.getUsername().length()<=0){
            errors.rejectValue("username", "error1", "invalid username");
        }
        if (user.getEmail().length()<=0){
            errors.rejectValue("email", "error2", "invalid email");
        }

    }
}
