package pack.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import pack.model.OrderInfo;
import pack.model.UserFormWrapper;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class UserFormWrapperValidator implements Validator {

    public boolean supports(Class<?> aClass) {
        return aClass.equals(UserFormWrapper.class);
    }

    public void validate(Object object, Errors errors) {
        UserFormWrapper wrapper = (UserFormWrapper) object;
        OrderInfo orderInfo = wrapper.getOrderInfo();
        System.out.println("Hello from UserFormWrapperValidator " + wrapper.getOrderInfo());

        Pattern patter = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*" +
                "@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
        Matcher matcher = patter.matcher(orderInfo.getCustomerEmail());

        if(!matcher.matches()){
            errors.rejectValue("orderInfo.customerEmail", "emailError", "Invalid email");
        }

        if(orderInfo.getCustomerName().length()<=0){
            errors.rejectValue("orderInfo.customerName", "nameError", "Invalid name");
        }

        if(orderInfo.getCustomerSurname().length()<=0){
            errors.rejectValue("orderInfo.customerSurname", "surnameError", "Invalid surname");
        }

        if(orderInfo.getCustomerPhone().length()<=0){
            errors.rejectValue("orderInfo.customerPhone", "phoneError", "Invalid phone");
        }

        if(orderInfo.getCustomerAddress().length()<=0){
            errors.rejectValue("orderInfo.customerAddress", "phoneError", "Invalid address");
        }

        if(orderInfo.getPayment().length()<=0){
            errors.rejectValue("orderInfo.payment", "paymentError", "Invalid payment");
        }

    }
}
