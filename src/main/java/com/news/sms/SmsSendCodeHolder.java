package com.news.sms;

import com.google.common.collect.Maps;

import com.news.dto.SmsSenderCode;
import com.news.utils.PropertiesUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Map;
import java.util.Properties;

@Component
public class SmsSendCodeHolder {
    private Map<String,SmsSenderCode> codeMap;
    @Value("${sms.code.properties.file.name}")
    private String smsCodePropertiesFileName;

    @PostConstruct
    public void initCodeMap() {
        codeMap= Maps.newConcurrentMap();
        Properties properties= PropertiesUtils.read(smsCodePropertiesFileName);
        if(!properties.isEmpty()){
            for (String key : properties.stringPropertyNames()) {
                String value=properties.getProperty(key);
                SmsSenderCode smsSenderCode=new SmsSenderCode(key,value);
                codeMap.put(key,smsSenderCode);
            }
            }

    }

    public SmsSenderCode getCode(String code){
        return codeMap.get(code);
    }

    public String getCodeMessage(String code){
        return getCode(code).getMessage();
    }

}
