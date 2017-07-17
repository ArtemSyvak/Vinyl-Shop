package pack.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import pack.model.UserInfo;

/**
 * Created by Artem on 17.07.2017.
 */

@Component
public class UserInfoValidator implements Validator {

   // Email address phone name

    public boolean supports(Class<?> aClass) {
        return aClass.equals(UserInfo.class);
    }

    public void validate(Object target, Errors errors) {

        UserInfo info = (UserInfo) target;

        if (info.getName().length()<=0){
            errors.rejectValue("name", "error2", "invalid name");
        }

        if (info.getPhone().length()<=0){
            errors.rejectValue("phone", "error3", "invalid phone");
        }
        if (info.getAddress().length()<=0){
            errors.rejectValue("address","error4", "invalid address");
        }
    }
}
