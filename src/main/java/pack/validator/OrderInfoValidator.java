package pack.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import pack.model.OrderInfo;

@Component
public class OrderInfoValidator implements Validator {
    public boolean supports(Class<?> aClass) {
        return aClass.equals(OrderInfo.class);
    }

    public void validate(Object target, Errors errors) {
        OrderInfo orderInfo = (OrderInfo) target;

        if(orderInfo.getCustomerName().length()<=0){
            errors.rejectValue("firstname", "error1", "Invalid firstname");
        }

        if(orderInfo.getCustomerSurname().length()<=0){
            errors.rejectValue("surname", "error2", "Invalid surname");
        }

        if(orderInfo.getCustomerPhone().length()<=0){
            errors.rejectValue("phone", "error3", "Invalid phone");
        }

        if(orderInfo.getCustomerAddress().length()<=0){
            errors.rejectValue("address", "error4", "Invalid address");
        }

    }
}
