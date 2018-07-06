package com.news.sms;


import com.news.dto.SmsSenderResponse;

import java.util.Map;

public interface SmsSenderService {
    SmsSenderResponse sendSms(String mobile, Map<String, String> params, String tpl_id);
}
