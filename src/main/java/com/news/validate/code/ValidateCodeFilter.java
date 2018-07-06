package com.news.validate.code;


import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.news.properties.SecurityConstants;
import com.news.properties.SecurityProperties;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;


@Component("validateCodeFilter")
public class ValidateCodeFilter extends OncePerRequestFilter implements InitializingBean {

    /**
     * 验证码校验失败处理器
     */
    @Autowired
    private AuthenticationFailureHandler authenticationFailureHandler;

    /**
     * 系统配置信息
     */
    @Autowired
    private SecurityProperties securityProperties;

    /**
     * 校验码处理器
     */
    @Autowired
    private ValidateCodeProcessorHolder validateCodeProcessorHolder;

    /**
     * 存放所有需要检验验证码得url
     */
    private Map<String,Map<String,ValidateCodeType> > urlMap = Maps.newConcurrentMap();

    /**
     * 验证请求url与配置得url是否匹配得工具类
     */
    private AntPathMatcher pathMatcher = new AntPathMatcher();

    /**
     * 初始化bena完成后在家该信息也就是拦截得url
     * @throws ServletException
     */
    @Override
    public void afterPropertiesSet() throws ServletException {
        super.afterPropertiesSet();
        Map<String,ValidateCodeType>imageMap=Maps.newConcurrentMap();
        Map<String,ValidateCodeType>emailMap=Maps.newConcurrentMap();
        imageMap.put("imageCode",ValidateCodeType.IMAGE);
        emailMap.put("emailCode",ValidateCodeType.EMAIL);
        emailMap.put("smsCode",ValidateCodeType.SMS);
        urlMap.put(SecurityConstants.DEFAULT_SIGN_IN_PROCESSING_URL_FORM, imageMap);
        addUrlToMap(securityProperties.getCode().getImage().getUrl(), ValidateCodeType.IMAGE);

        urlMap.put(SecurityConstants.DEFAULT_SIGN_IN_PROCESSING_URL_REGISTER, emailMap);
        addUrlToMap(securityProperties.getCode().getEmail().getUrl(), ValidateCodeType.EMAIL);
        urlMap.put(SecurityConstants.DEFAULT_SIGN_IN_PROCESSING_URL_RESETUSER,emailMap);
        addUrlToMap(securityProperties.getCode().getEmail().getUrl(), ValidateCodeType.EMAIL);

/*        urlMap.put(SecurityConstants.DEFAULT_SIGN_IN_PROCESSING_URL_REGISTER, ValidateCodeType.SMS);
        addUrlToMap(securityProperties.getCode().getSms().getUrl(), ValidateCodeType.SMS);*/
    }

    /**
     * 讲系统中配置的需要校验验证码的URL根据校验的类型放入map
     *
     * @param urlString
     * @param type
     */
    protected void addUrlToMap(String urlString, ValidateCodeType type) {
        if (StringUtils.isNotBlank(urlString)) {
            String[] urls = StringUtils.splitByWholeSeparatorPreserveAllTokens(urlString, ",");
            for (String url : urls) {
                //urlMap.put(url, type);
            }
        }
    }
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        ValidateCodeType type = getValidateCodeType(request);
        if (type != null) {
            logger.info("校验请求(" + request.getRequestURI() + ")中的验证码,验证码类型" + type);
            try {
                validateCodeProcessorHolder.findValidateCodeProcessor(type)
                        .validate(new ServletWebRequest(request, response));
                logger.info("验证码校验通过");
            } catch (ValidateCodeException exception) {
                authenticationFailureHandler.onAuthenticationFailure(request, response, exception);
                return;
            }
        }

        filterChain.doFilter(request, response);
    }

    /**
     * 获取校验码的类型，如果当前请求不需要校验，则返回null
     *
     * @param request
     * @return
     */
    private ValidateCodeType getValidateCodeType(HttpServletRequest request) {
        ValidateCodeType result = null;
        String codeType=null;

        String imageCode=request.getParameter(SecurityConstants.DEFAULT_PARAMETER_NAME_CODE_IMAGE);
        String emailCode=request.getParameter(SecurityConstants.DEFAULT_PARAMETER_NAME_CODE_EMAIL);
        String smsCode=request.getParameter(SecurityConstants.DEFAULT_PARAMETER_NAME_CODE_SMS);

        if(StringUtils.isNotBlank(imageCode)){
            codeType="imageCode";
        }
        if(StringUtils.isNotBlank(emailCode)){
            codeType="emailCode";
        }
        if(StringUtils.isNotBlank(smsCode)){
            codeType="smsCode";
        }

        if (!StringUtils.equalsIgnoreCase(request.getMethod(), "get")) {
            Set<String> urls = urlMap.keySet();
            for (String url : urls) {
                logger.info("url="+request.getRequestURI());
                if (pathMatcher.match(url, request.getRequestURI())) {
                    Map<String,ValidateCodeType> validateCodeTypeMap=urlMap.get(url);
                    result = validateCodeTypeMap.get(codeType);
                }
            }
        }
        return result;
    }
}
