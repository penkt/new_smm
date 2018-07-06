package com.news.validate.code.sms;


import com.news.properties.SecurityProperties;
import com.news.validate.code.ValidateCode;
import com.news.validate.code.ValidateCodeGenerator;
import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.ServletWebRequest;

@Component("smsValidateCodeGenerator")
public class SmsCodeGenerator implements ValidateCodeGenerator {
    private final static Logger logger = LoggerFactory.getLogger(SmsCodeGenerator.class);


    @Autowired
    private SecurityProperties securityProperties;

    @Override
    public ValidateCode generate(ServletWebRequest request) {
        String code = RandomStringUtils.randomNumeric(securityProperties.getCode().getSms().getLength());
        return new ValidateCode(code, securityProperties.getCode().getSms().getExpireIn());
    }
}
