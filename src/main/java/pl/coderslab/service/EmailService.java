package pl.coderslab.service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import pl.coderslab.model.User;

public class EmailService {

    @Autowired
    private TemplateEngine templateEngine;

    private String generateMailHtml(String name, String email, String templateFileName) {
        Map<String, Object> variables = new HashMap<>();
        variables.put("name", name);
        variables.put("email", email);
        String output = this.templateEngine.process(templateFileName, new Context(Locale.getDefault(), variables));
        return output;
    }

    private static Properties prop = new Properties();

    private static void fetchConfig() {
        try (InputStream input = EmailService.class.getClassLoader().getResourceAsStream("mail.properties")) {
            prop.load(input);
        } catch (IOException io) {
            io.printStackTrace();
            System.err.println("Cannot open and load mail.properties file");
        }
    }

    private static Properties refreshConfig() {
        prop.clear();
        fetchConfig();
        return prop;
    }


    private void send(String to, String subject, String name, String emailTemplate) throws MessagingException {

        Session session = Session.getDefaultInstance(refreshConfig(),
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(refreshConfig().getProperty("mail.from"), refreshConfig().getProperty("password"));
                    }
                });

        MimeMessage message = new MimeMessage(session);
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject(subject);
        try {
            message.setFrom(new InternetAddress("noreply@noreply.com",refreshConfig().getProperty("mail.fromName")));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            System.err.println("Cannot add email 'from' custom name");
        }
        message.setContent(generateMailHtml(name, to, emailTemplate), "text/html; charset=UTF-8");
        Transport.send(message);
        System.out.println("Email sent successfully");
    }

    public void sendQuotationReadyEmail(User user, Long quotationID) throws MessagingException {
        send(user.getEmail(), "Quotation nr " + quotationID + " is ready",
                user.getFullName(), "quotationReady");
    }

}
