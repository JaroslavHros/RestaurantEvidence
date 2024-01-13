package cz.ekf.dao;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	
	public static void send(String to , String subject ,
							String mess, final String usr , final String pass)
	{
		Properties pro = new Properties();
		
		pro.put("mail.smtp.host", "smtp.gmail.com");
		pro.put("mail.smtp.auth", "true");
		pro.put("mail.smtp.starttls.enable", "true");
		pro.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		
		
		 Session session = Session.getInstance(pro,new javax.mail.Authenticator()
	        {
	            protected PasswordAuthentication getPasswordAuthentication()
	            {
	  	 	         return new PasswordAuthentication(usr,pass); 
	            }
	            
	            
	        });
		 try {
    
           MimeMessage sprava = new MimeMessage(session);
           sprava.setFrom(new InternetAddress(usr));
           sprava.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
           sprava.setSubject(subject);
           sprava.setText(mess);
         
           Transport.send(sprava);
       }
       catch(Exception e) {
    	   e.printStackTrace();
			
       }
	}
}
