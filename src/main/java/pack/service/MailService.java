package pack.service;

/**
 * Created by Artem on 16.07.2017.
 */
public interface MailService {

    void sendWelcome(String email);
    void sendOrder(String email);
}
