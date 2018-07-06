package com.news.validate.code;


import com.news.enums.ResultEnum;
import org.springframework.security.core.AuthenticationException;

/**
 * Created on 2018/1/7 0007.
 *
 * @author zlf
 * @email i@merryyou.cn
 * @since 1.0
 */
public class ValidateCodeException extends AuthenticationException {
    private static final long serialVersionUID = -7525757620869234981L;

    private Integer code;

    public ValidateCodeException(ResultEnum resultEnum) {
        super(resultEnum.getMsg());
        this.code = resultEnum.getCode();
    }

    public ValidateCodeException(Integer code, String message) {
        super(message);
        this.code = code;
    }

    public ValidateCodeException(String msg) {
        super(msg);
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
