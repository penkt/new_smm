package com.news.sms;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.news.dto.SmsSenderResponse;
import com.news.utils.HttpUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class DefaultSmsSenderServiceImpl implements SmsSenderService{
    private static Logger logger = LoggerFactory.getLogger(DefaultSmsSenderServiceImpl.class);


    @Autowired
    private SmsSenderConfig smsSenderConfig;

    @Override
    public SmsSenderResponse sendSms(String mobile, Map<String, String> params, String tpl_id) {
        Map<String, String> headers = Maps.newConcurrentMap();
        String code= MapUtils.getString(params,"smsCode");
        if (StringUtils.isBlank(tpl_id)) {
            tpl_id="TP1711063";
        }
        if(StringUtils.isBlank(mobile)){
            logger.info("手机号码不能为空！");
            return new SmsSenderResponse("10012");
        }
        if(StringUtils.isBlank(code)){
            logger.info("短信验证码不能为空!");
            return new SmsSenderResponse("10011");
        }
        headers.put("Authorization", "APPCODE " + smsSenderConfig.getAppcode());
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("mobile", mobile);
        querys.put("param", "code:"+params.get("smsCode"));
        querys.put("tpl_id", tpl_id);
        Map<String, String> bodys = Maps.newConcurrentMap();
        logger.info("发送给手机号:    "+mobile+"  的验证码为："+code);
        try {

            HttpResponse response = HttpUtils.doPost(smsSenderConfig.getHost(), smsSenderConfig.getPath(), smsSenderConfig.getMethod(), headers, querys, bodys);
            if(response.getStatusLine().getStatusCode()== HttpStatus.SC_OK){
                HttpEntity entity=response.getEntity();
                if(entity!=null){
                    String result= EntityUtils.toString(entity);
                    JSONObject jsonObject= JSON.parseObject(result);
                    SmsSenderResponse response1=new SmsSenderResponse();
                    String restunCode=jsonObject.getString("return_code");
                    String orderId=jsonObject.getString("order_id");
                    logger.info("发送短信结果为: result= "+jsonObject.toJSONString());
                    response1.setReturn_code(restunCode);
                    response1.setOrder_id(orderId);
                    return response1;
                }
            }
        } catch (Exception e) {
            logger.info("系统异常，发送短信失败，原因为"+e.getMessage());
            return new SmsSenderResponse("10013");
        }
        return new SmsSenderResponse("10014");
    }
}
