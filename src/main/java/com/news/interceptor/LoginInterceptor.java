package com.news.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    private static Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
      logger.info("-------------LoginInterceptor is start------------------");
/*        logger.info("----------------preHandler--------------------");
        HttpSession session=httpServletRequest.getSession();
        if(session.getAttribute("id")==null){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/login");
            return false;
        }else{
            session.setAttribute("userId", session.getAttribute("userId"));
            return true;
        }*/
return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        logger.info("----------------postHandle--------------------");
    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        logger.info("----------------afterCompletion--------------------");
    }
}
