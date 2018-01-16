package mail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	public SendEmail(String address, String name, String theme, String type, String InDate, String OutDate,
			String price) {
		String host = "smtp.naver.com";
		final String user = "ohershey";
		final String password = "eodn3qks!";

		String to = address;

		// smtp사용
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// 이메일 제목
			message.setSubject("");

			// 이메일 내용
			message.setText(
					"");

			// 전송확인
			Transport.send(message);
			System.out.println("전송완료");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}