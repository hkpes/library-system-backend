package com.rabbiter.library.dto;

import java.io.Serializable;

public class LoginParm implements Serializable {
    private String username;
    private String password;
    private String userType;

    public LoginParm(String username, String password, String userType) {
        this.username = username;
        this.password = password;
        this.userType = userType;
    }

    public LoginParm() {
    }

    @Override
    public String toString() {
        return "LoginParm{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", userType='" + userType + '\'' +
                '}';
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

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
}