package com.news.validate.code.email;


import com.news.properties.SecurityProperties;
import com.news.validate.code.ValidateCode;
import com.news.validate.code.ValidateCodeGenerator;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.ServletWebRequest;

@Component("emailValidateCodeGenerator")
public class EmailCodeGenerator implements ValidateCodeGenerator {

    @Autowired
    private SecurityProperties securityProperties;

    @Override
    public ValidateCode generate(ServletWebRequest request) {
        String code = RandomStringUtils.randomNumeric(securityProperties.getCode().getEmail().getLength());
        return new ValidateCode(code, securityProperties.getCode().getEmail().getExpireIn());
    }
}
