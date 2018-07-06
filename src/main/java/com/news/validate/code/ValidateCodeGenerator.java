package com.news.validate.code;

import org.springframework.web.context.request.ServletWebRequest;


public interface ValidateCodeGenerator {
    /**
     * 生成验证码
     * @param request
     * @return
     */
    ValidateCode generate(ServletWebRequest request);
}
