package cn.bdqn.util;

import cn.bdqn.email.EmailUtil;
import org.junit.Test;

import javax.mail.MessagingException;


public class TestEmail {
	@Test
	public void test() {
		        try {
		        	EmailUtil.send_mail("2601059174@qq.com", "尊敬的2284053154用户您好：欢迎您注册豪丹国际健身&nbsp;您的验证码为:"+String.valueOf((int)(Math.random()*8998)+1000)+"&nbsp;请您尽快填写验证码，以防失效，谢谢合作，如有它人索要验证码，请勿透露。");
		            System.out.println("邮件发送成功!");
		        } catch (MessagingException e) {
		            e.printStackTrace();
		        }
		 } 
}
