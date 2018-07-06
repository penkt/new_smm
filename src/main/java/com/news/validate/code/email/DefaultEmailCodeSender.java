package com.news.validate.code.email;


import com.news.email.EmailService;
import com.news.validate.code.sms.DefaultSmsCodeSender;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DefaultEmailCodeSender implements EmailCodeSender{
    private final static Logger logger = LoggerFactory.getLogger(DefaultSmsCodeSender.class);

    @Autowired
    private EmailService emailService;

    @Override
    public void sendEmail(String code, String email) {
        logger.info("向邮箱" + email + "发送邮箱验证码" + code);
        emailService.sendSimpleMail(email,"验证码","尊敬的用户，你的验证码为："+code+" ，有效期为30分钟");
        logger.info("邮箱验证码发送完毕！");
    }
}
