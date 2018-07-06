package com.news.validate.code.sms;

import com.google.common.collect.Maps;
import com.news.sms.SmsSenderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;


public class DefaultSmsCodeSender implements SmsCodeSender {
    private final static Logger logger = LoggerFactory.getLogger(DefaultSmsCodeSender.class);

    @Autowired
    private SmsSenderService smsSenderService;
    @Override
    public void send(String mobile, String code) {
        logger.info("向手机" + mobile + "发送短信验证码" + code);
        Map<String,String> params= Maps.newConcurrentMap();
        params.put("smsCode",code);
        smsSenderService.sendSms(mobile,params,"");
        logger.info("短信验证码发送完毕！");
    }
}
