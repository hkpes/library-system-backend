package com.rabbiter.library.entity;


import java.util.Arrays;

public class UserInfo {
    private String name;
    private String avatar;
    private String introduction;
    private Object[] roles;

    @Override
    public String toString() {
        return "UserInfo{" +
                "name='" + name + '\'' +
                ", avatar='" + avatar + '\'' +
                ", introduction='" + introduction + '\'' +
                ", roles=" + Arrays.toString(roles) +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Object[] getRoles() {
        return roles;
    }

    public void setRoles(Object[] roles) {
        this.roles = roles;
    }

    public UserInfo() {
    }

    public UserInfo(String name, String avatar, String introduction, Object[] roles) {
        this.name = name;
        this.avatar = avatar;
        this.introduction = introduction;
        this.roles = roles;
    }
}
