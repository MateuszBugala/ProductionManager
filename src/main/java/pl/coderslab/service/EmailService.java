package pl.coderslab.service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class EmailService {

    private static Properties prop = new Properties();

    private static void fetchConfig() {
        try (InputStream input = EmailService.class.getClassLoader().getResourceAsStream("mail.properties")) {
            prop.load(input);
        } catch (IOException io) {
            io.printStackTrace();
            System.err.println("Cannot open and load mail.properties file");
        }
    }

    //    added mail.properties to be refreshed at runtime:
    private static Properties refreshConfig() {
        prop.clear();
        fetchConfig();
        return prop;
    }


    public static void send(String to, String name, Long quotId) {


        //get Session
        Session session = Session.getDefaultInstance(refreshConfig(),
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(refreshConfig().getProperty("mail.from"), refreshConfig().getProperty("password"));
                    }
                });
        //compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            String subject = "Quotation nr " + quotId + " is ready";
            String body = String.join(System.getProperty("line.separator"),
                    "<div style=\"line-height: 14px; padding: 10px; color: #132F40; font-family: 'Cabin', Arial, 'Helvetica Neue', Helvetica, sans-serif;\">",
                    "<p><span style=\"font-size: 22px;\">Hello <strong>" + name + ",</strong></p>",
                    "<p style=\"font-size: 16px; color:#555555; line-height: 21px\">",
                    "Your quotation " + quotId + " has just been quoted by Production department and is waiting for your approval.",
                    "<br>Please visit Production Manager App and check details:</p>",
                    "<a href=\"http://production-manager.mbugala.com.pl/quotations/all\"><button style=\"background-color: #ffc107; border-color: #ffc107; border-radius: 30px; height: 40px; width: 200px\"><strong>YOUR QUOTATION &gt;</strong></button></a>\n" +
                            "</div>"
            );

            message.setSubject(subject);
            message.setContent(body, "text/html");
            Transport.send(message);
            System.out.println("email sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

}
