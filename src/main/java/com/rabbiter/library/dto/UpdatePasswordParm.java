package com.rabbiter.library.dto;

public class UpdatePasswordParm {
    private Long userId;
    private String oldPassword;
    private String password;

    @Override
    public String toString() {
        return "UpdatePasswordParm{" +
                "userId=" + userId +
                ", oldPassword='" + oldPassword + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UpdatePasswordParm(Long userId, String oldPassword, String password) {
        this.userId = userId;
        this.oldPassword = oldPassword;
        this.password = password;
    }

    public UpdatePasswordParm() {
    }
}