package com.news.sms;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class SmsSenderConfig {

    @Value("${sms.send.host}")
    private String host;
    @Value("${sms.send.path}")
    private String path;
    @Value("${sms.send.method}")
    private String method;
    @Value("${sms.send.appcode}")
    private String appcode;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getAppcode() {
        return appcode;
    }

    public void setAppcode(String appcode) {
        this.appcode = appcode;
    }
}
