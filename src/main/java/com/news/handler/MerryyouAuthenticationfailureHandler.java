package com.news.handler;


import com.fasterxml.jackson.databind.ObjectMapper;

import com.news.enums.ResultEnum;
import com.news.validate.code.ValidateCodeException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created on 2018/4/7
 * 自定义登录失败处理
 *
 */
@Component(value = "merryyouAuthenticationfailureHandler")
public class MerryyouAuthenticationfailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Autowired
    private ObjectMapper objectMapper;


    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String message = "";
        response.setContentType("application/json;charset=UTF-8");
        if(exception instanceof BadCredentialsException){
            message = "用户名或密码错误";
            response.getWriter().write(objectMapper.writeValueAsString(ResultEnum.FAIL.getCode()+message));
        }else if(exception instanceof ValidateCodeException){
            response.getWriter().write(objectMapper.writeValueAsString(ResultEnum.CODE_ERROT.getCode()+exception.getMessage()));
            }
    }
}
