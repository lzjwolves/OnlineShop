package com.base.utils.mail;

import java.io.IOException;
import javax.mail.MessagingException;
import javax.mail.Session;
import org.junit.Test;



public class MailUtilsTest {
    /*** 发邮件 
     * @throws IOException 
     * @throws MessagingException ***/
    @Test
    public void sendMail() throws MessagingException, IOException{
        /**
         * 1.登录邮件服务器
         *     MailUtils.createSession(服务器地址,登录名,密码);
         * 2.创建邮件对象
         *     发件人
         *     收件人
         *     主题
         *     正文
         * 3.发邮件
         *     需要第1步得到的session 以及 第2步的邮件对象
         */
     
        Session session=MailUtils.createSession("smtp.qq.com", "1556960291@qq.com", "cjbxezvixsssbafb");
        //public Mail(String from, String to, String subject, String content)
        Mail mail=new Mail("1556960291@qq.com","1457409663@qq.com","zaza是你大爷","彩笔再见");
        //发送
        MailUtils.send(session, mail);
    }
}