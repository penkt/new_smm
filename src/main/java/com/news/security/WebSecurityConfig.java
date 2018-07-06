package com.news.security;


import com.news.handler.LoginSuccessHandler;
import com.news.properties.SecurityProperties;
import com.news.validate.code.ValidateCodeSecurityConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;


@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private SecurityProperties securityProperties;
    @Autowired
    private ValidateCodeSecurityConfig validateCodeSecurityConfig;
    @Autowired
    private AuthenticationFailureHandler merryyouAuthenticationfailureHandler;


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.headers().frameOptions().disable().and().
                csrf().disable()
                .authorizeRequests()
                .antMatchers("/", "/home", "/about","/tokens").permitAll()
               // .antMatchers("/admin/**").hasAnyRole("ADMIN")
                //.antMatchers("/user/**").hasAnyRole("USER")
               // .anyRequest().authenticated()
                .and()
                .formLogin()
                //指定登录页是”/login”
                .loginPage("/login/index")
                .permitAll()
                //登录成功后可使用loginSuccessHandler()存储用户信息，可选。
                .successHandler(loginSuccessHandler())
                .failureHandler(merryyouAuthenticationfailureHandler)//登录失败处理器
                .and()
               .apply(validateCodeSecurityConfig)//验证码拦截
                .and()
                .logout()
                //指定登出页是”/home”
                .logoutUrl("/home")
                .permitAll()
                .invalidateHttpSession(true)
                .and()
                //登录后记住用户，下次自动登录
                //数据库中必须存在名为persistent_logins的表
                .rememberMe()
                .tokenValiditySeconds(securityProperties.getRememberMeSeconds())
                .and();
               // .exceptionHandling().accessDeniedHandler(accessDeniedHandler);
    }



    @Bean
    public LoginSuccessHandler loginSuccessHandler(){
        return new LoginSuccessHandler();
    }

}

