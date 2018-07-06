package com.news.config;


import org.apache.velocity.app.VelocityEngine;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BeanConfig {

    @Bean
    public VelocityEngine velocityEngine(){
        VelocityEngine velocityEngine=new VelocityEngine();
        velocityEngine.setProperty("input.encoding","UTF-8");
        velocityEngine.setProperty("output.encoding","UTF-8");
        return velocityEngine;
    }
}
