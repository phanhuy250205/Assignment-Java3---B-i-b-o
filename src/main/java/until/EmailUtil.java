package until;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;

public class EmailUtil {
    static final String from = "phanhuy250205@gmail.com";
    static final String password = "huxe kixt joxd mhpl"; // Mật khẩu ứng dụng Gmail

    public static void sendEmail(String subject, String content, List<String> recipients) throws MessagingException {
        Properties props = new Properties();
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

        // Tạo phiên gửi email với thông tin xác thực
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        // Tạo tin nhắn email
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        
        // Sử dụng BCC cho nhiều người nhận
        for (String recipient : recipients) {
            message.addRecipient(Message.RecipientType.BCC, new InternetAddress(recipient));
        }
        
        message.setSubject(subject);
        message.setText(content); // Nội dung đơn giản, nếu có HTML thì dùng setContent

        // Gửi email
        Transport.send(message);
    }
}
