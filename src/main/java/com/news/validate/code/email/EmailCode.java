package com.news.validate.code.email;


import com.news.validate.code.ValidateCode;

public class EmailCode extends ValidateCode {

    private String emailAdress;

    public EmailCode(String code, int expireIn) {
        super(code, expireIn);
    }

    public String getEmailAdress() {
        return emailAdress;
    }

    public void setEmailAdress(String emailAdress) {
        this.emailAdress = emailAdress;
    }
}
