package pack.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import pack.service.MailService;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Created by Artem on 16.07.2017.
 */


@Service
public class MailServiceImpl implements MailService {

    @Autowired
    JavaMailSender mailSender;

    public void send(String email) {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);
        try {
            message.setFrom(new InternetAddress("artsyvak@gmail.com"));
            helper.setTo(email);
            helper.setSubject("Message from VinylShop by A&N");
            helper.setText("some text azazaza trololorlro", true);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        mailSender.send(message);
    }
}
