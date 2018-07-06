/**
 * 
 */
package com.news.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.tuckey.web.filters.urlrewrite.UrlRewriteFilter;

/**
 * @author pxq
 * @date 2018年4月8日
 */
@Configuration   //标注此文件为一个配置项，spring boot才会扫描到该配置。该注解类似于之前使用xml进行配置
public class CustomWebMvcConfigurerAdapter extends WebMvcConfigurerAdapter {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginHandlerInterceptor()).addPathPatterns("/login/**").excludePathPatterns("/login/userzc*");  //对来自/user/** 这个链接来的请求进行拦截
    }
    
}