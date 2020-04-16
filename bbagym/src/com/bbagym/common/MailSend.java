package com.bbagym.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {
	
	public void gmailSend(String info,String reciver) {
        String user = "bbagym123123@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String password = "!bbagym123";   // 패스워드

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(reciver)); 

            // Subject
            message.setSubject("bbagym 회원가입 이메일 인증번호"); //메일 제목을 입력

            // Text
            message.setText("bbagym 회원가입 이메일 인증번호 입니다 \n\n"
            		+ "bbagym 회원가입 페이지에서 아래의 인증번호를 입력하여 이메일 인증을 하실 수 있습니다.\n\n"
            		+ "인증번호 : "+info+"\n\n"
            				+ "http://rclass.iptime.org:9999/20PM_bbagym/");    //메일 내용을 입력
            System.out.println(info);
            // send the message
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }



	
	
	
	

}

	


