package until;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	static final String from = "phanhuy250205@gmail.com";
    static final String password = "huxe kixt joxd mhpl";
	public static boolean sendEmail(String to, String tieuDe, String noiDung) {
	    Properties props = new Properties();
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

        // Tạo Authenticator
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, authenticator);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Sử dụng chuỗi địa chỉ email trực tiếp
            msg.setFrom(new InternetAddress(from)); 

            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            
            // Tiêu đề email 
            msg.setSubject("Chào Bạn Nhá");
            
            // Quy định ngày gửi
            msg.setSentDate(new Date());
            
            // Nội dung email
            msg.setText("Chào mừng bạn!\n\n" +
                    "Tôi là Admin của trang web Báo số 1 Việt Nam. Chúng tôi rất vinh hạnh chào đón bạn đến với trang web của chúng tôi.\n\n" +
                    "Tại đây, bạn sẽ tìm thấy những thông tin cập nhật và tin tức mới nhất về nhiều lĩnh vực khác nhau. Chúng tôi cam kết cung cấp cho bạn những nội dung chất lượng và hữu ích nhất.\n\n" +
                    "Nếu bạn có bất kỳ câu hỏi nào hoặc cần hỗ trợ, đừng ngần ngại liên hệ với chúng tôi.\n\n" +
                    "Chúc bạn có trải nghiệm tuyệt vời tại trang web của chúng tôi!\n\n" +
                    "Trân trọng,\n" +
                    "Đội ngũ Admin", "UTF-8");
            
            // Gửi email
            Transport.send(msg);
            System.out.println("Email đã được gửi thành công!");

        } catch (Exception e) {
            e.printStackTrace();
        }
		
		
		return false;
}
}
