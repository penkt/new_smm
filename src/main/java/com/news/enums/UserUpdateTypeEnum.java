package com.news.enums;

/**
 * 用户相关更新从操作
 */
public enum  UserUpdateTypeEnum {
    PASSWORD("0","更新密码"),
        DETAILINFO("1","更新用户信息"),
            BINDQQ("2","更新绑定qq"),
    BINDWEIXIN("3","更新绑定微信"),
        BINDWEIBO("4","更新绑定微博");
    String code;
    String description;

     UserUpdateTypeEnum(String code, String description) {
        this.code = code;
        this.description = description;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
