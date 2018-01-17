package mail.model;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	public SendEmail(String address, String user_name, String mail_content) {
		String host = "smtp.naver.com";
		//메일 발신자
		final String user = "ohershey";
		final String password = "eodn3qks!";

		//메일 수신자
		String to = address;
		
		//정보를 담기위한 객체
		Properties props = new Properties();
		//stmp 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			//발신자 세팅(주소는 풀)
			message.setFrom(new InternetAddress(user+"@naver.com"));				
			//수신자 세팅
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));	

			// 이메일 제목
			message.setSubject("안녕하세요. "+user_name+"님, CFK입니다.");

			// 이메일 내용
			message.setText(mail_content);

			// 전송확인
			Transport.send(message);
			System.out.println("전송완료");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}