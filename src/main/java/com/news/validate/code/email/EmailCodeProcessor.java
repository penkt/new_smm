package com.news.validate.code.email;


import com.news.properties.SecurityConstants;
import com.news.validate.code.ValidateCode;
import com.news.validate.code.impl.AbstractValidateCodeProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.context.request.ServletWebRequest;

@Component("emailValidateCodeProcessor")
public class EmailCodeProcessor extends AbstractValidateCodeProcessor<ValidateCode> {
    @Autowired
    private EmailCodeSender emailCodeSender;

    @Override
    protected void send(ServletWebRequest request, ValidateCode validateCode) throws Exception {
        String paramName = SecurityConstants.DEFAULT_PARAMETER_NAME_EMAIL;
        String email = ServletRequestUtils.getRequiredStringParameter(request.getRequest(), paramName);
        emailCodeSender.sendEmail(validateCode.getCode(),email);
    }

}
