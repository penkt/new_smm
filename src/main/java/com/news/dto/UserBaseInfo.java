package com.news.dto;

import java.io.Serializable;
import java.util.Date;

public class UserBaseInfo implements Serializable{

    private String username;
    private String oldpassword;
    private String password;
    private String repassword;
    private String codeSession;
    private String validateCode;
    private Date validCodeTime;

    public String getOldpassword() {
        return oldpassword;
    }

    public String getCodeSession() {
        return codeSession;
    }

    public void setCodeSession(String codeSession) {
        this.codeSession = codeSession;
    }

    public void setOldpassword(String oldpassword) {
        this.oldpassword = oldpassword;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    public String getValidateCode() {
        return validateCode;
    }

    public void setValidateCode(String validateCode) {
        this.validateCode = validateCode;
    }

    public Date getValidCodeTime() {
        return validCodeTime;
    }

    public void setValidCodeTime(Date validCodeTime) {
        this.validCodeTime = validCodeTime;
    }
}
