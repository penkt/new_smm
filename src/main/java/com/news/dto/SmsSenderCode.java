package com.news.dto;

/**
 * 短信网关接口调用返回
 */
public class SmsSenderCode {

    //错误码
    private String code;
    //错误信息
    private String message;
    //错误描述
    private String description;

    public SmsSenderCode() {
    }

    public SmsSenderCode(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public SmsSenderCode(String code, String message, String description) {
        this.code = code;
        this.message = message;
        this.description = description;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "SmsSenderCode{" +
                "code='" + code + '\'' +
                ", message='" + message + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
