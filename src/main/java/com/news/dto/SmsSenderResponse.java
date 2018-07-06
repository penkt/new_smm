package com.news.dto;

import java.io.Serializable;

public class SmsSenderResponse implements Serializable{
    private String return_code;
    private String order_id;

    public SmsSenderResponse() {
    }

    public SmsSenderResponse(String return_code) {
        this.return_code = return_code;
    }

    public String getReturn_code() {
        return return_code;
    }

    public void setReturn_code(String return_code) {
        this.return_code = return_code;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }
}
