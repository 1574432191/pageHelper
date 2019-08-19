package com.lishan.gjq.test;

import java.security.GeneralSecurityException;
import java.util.Random;

import javax.mail.MessagingException;

import com.lishan.gjq.util.MailUtils;
import com.lishan.gjq.util.RandomNumber;

public class Test {
	 public static void main(String[] args) throws MessagingException, GeneralSecurityException {
	     MailUtils mailUtils = new MailUtils();
		 int a = mailUtils.send_mail("1574432191@qq.com", "发送邮件");
		 System.out.println("测试类"+a);
	//	 RandomNumber randomNumber = new RandomNumber();
	//	 System.out.println(randomNumber.randomNum());
	//	 System.out.println((int)((Math.random()*9+1)*100000));
	 }
}
