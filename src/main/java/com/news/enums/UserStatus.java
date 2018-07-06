package com.news.enums;

public enum UserStatus {

    normal("正常","0"),
    locked("锁定","1"),
    deleted("注销","2");

    private String name;
    private String value;

    UserStatus(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
