package com.rabbiter.library.dto;


public class LoginResult {
    private Long userId;
    private String token;
    //token過期時間
    private Long expireTime;

    public LoginResult() {
    }

    public LoginResult(Long userId, String token, Long expireTime) {
        this.userId = userId;
        this.token = token;
        this.expireTime = expireTime;
    }

    @Override
    public String toString() {
        return "LoginResult{" +
                "userId=" + userId +
                ", token='" + token + '\'' +
                ", expireTime=" + expireTime +
                '}';
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Long getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Long expireTime) {
        this.expireTime = expireTime;
    }
}