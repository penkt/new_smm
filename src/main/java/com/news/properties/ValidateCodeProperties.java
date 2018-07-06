package com.news.properties;


/**
 * Created on 2018/4/10.
 *
 * @author pxq
 * @since 1.0
 */

public class ValidateCodeProperties {
    /**
     * 图片验证码配置
     */
    private ImageCodeProperties image = new ImageCodeProperties();
    /**
     * 短信验证码配置
     */
    private SmsCodeProperties sms = new SmsCodeProperties();

    private EmailCodeProperties email=new EmailCodeProperties();

    public EmailCodeProperties getEmail() {
        return email;
    }

    public void setEmail(EmailCodeProperties email) {
        this.email = email;
    }

    public ImageCodeProperties getImage() {
        return image;
    }

    public void setImage(ImageCodeProperties image) {
        this.image = image;
    }

    public SmsCodeProperties getSms() {
        return sms;
    }

    public void setSms(SmsCodeProperties sms) {
        this.sms = sms;
    }
}
