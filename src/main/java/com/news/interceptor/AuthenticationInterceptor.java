package com.news.interceptor;



import com.news.annotation.Authorization;
import com.news.dto.TokenModel;
import com.news.manager.TokenManager;
import com.news.security.Constants;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

    private static Logger logger = LoggerFactory.getLogger(AuthenticationInterceptor.class);


    public final static String ACCESS_TOKEN = "accessToken";
    @Autowired
    private TokenManager manager;

    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        logger.info("-------------------------------AuthenticationInterceptor-----------------------------------");
        //如果不是映射到方法直接通过
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        //判断是否需要进行token校验
        if(handlerMethod.getMethodAnnotation(Authorization.class)==null){
            return true;
        }else{
            Method method = handlerMethod.getMethod();
            //从header中得到token
            String authorization = request.getHeader(Constants.AUTHORIZATION);
            if(StringUtils.isBlank(authorization)){
                authorization=request.getParameter("token");
            }
            if(StringUtils.isBlank(authorization)){
                response.sendRedirect(request.getContextPath()+"/login");
                return false;
            }else{
                //验证token
                TokenModel model = manager.getToken(authorization);
                if (manager.checkToken(model)) {
                    //如果token验证成功，将token对应的用户id存在request中，便于之后注入
                    request.setAttribute(Constants.CURRENT_USER_ID, model.getUserId());
                    //权限校验
                    



                    return true;
                }
                //如果验证token失败，并且方法注明了Authorization，返回401错误
                if (method.getAnnotation(Authorization.class) != null) {
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    logger.info("-------------------------------AuthenticationInterceptor--is finished--------------------------------");
                    return false;
                }
                logger.info("-------------------------------AuthenticationInterceptor--  is finished---------------------------------");
                return true;
            }
        }
    }

}
