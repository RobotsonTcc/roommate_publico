package com.roomate.controller;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.roomate.model.UsuarioModel;

public class EmailController {

	protected static final String FROM = EmailMgr.ROOMATE;
	protected static final String FROM_NAME = EmailMgr.ROOMATE_NAME;
	
	protected static final String SMTP_USERNAME = EmailMgr.ROOMATE;
	protected static final String SMTP_PASSWORD = EmailMgr.ROOMATE_SENHA;
	
	//protected static final String CONFIG_SET = EmailMgr.CONFIG_SET;
	
	protected static final String HOST = EmailMgr.HOST;
	protected static final int PORT = 465;
	
	public static boolean enviarEmail(UsuarioModel usuario, String assunto, String corpoHtml) {
		
		//Propriedades com a config
		Properties props = System.getProperties();
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.auth", "true");

		
		//Sessão de email
		//Session session = Session.getDefaultInstance(props);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
	        }
	      });
	      
        session.setDebug(true);
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(FROM, FROM_NAME));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(usuario.getEmail()));
			msg.setSubject(assunto);
			msg.setContent(corpoHtml, "text/html");
			//msg.setHeader("X-SES-CONFIGURATION-SET", CONFIG_SET);
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
			return false;
		} catch (MessagingException e) {
			System.out.println(e.getMessage());
			return false;
		}
		
		try {
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return true;
	}
	
}
