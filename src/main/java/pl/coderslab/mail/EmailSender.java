package pl.coderslab.mail;

public interface EmailSender {
    void sendEmail(String to, String subject, String content);
}