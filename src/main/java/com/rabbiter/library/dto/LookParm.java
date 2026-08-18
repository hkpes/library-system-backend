package com.rabbiter.library.dto;


public class LookParm {
    private Long userId;
    //當前頁
    private Long currentPage;
    //每頁條數
    private Long pageSize;
    //
    private String phone;
    //
    private String username;
    //姓名
    private String bookName;
     //0:待審核 1：已審核 2：拒絕
    private String applyStatus;
    //1:在借中  2：已還  3：拒絕
    private String borrowStatus;
    //1: 正常還書 2：異常還書
    private String returnStatus;
    // 1:到期 0：未到期
    private String timeStatus;

    public LookParm() {
    }

    @Override
    public String toString() {
        return "LookParm{" +
                "userId=" + userId +
                ", currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", phone='" + phone + '\'' +
                ", username='" + username + '\'' +
                ", bookName='" + bookName + '\'' +
                ", applyStatus='" + applyStatus + '\'' +
                ", borrowStatus='" + borrowStatus + '\'' +
                ", returnStatus='" + returnStatus + '\'' +
                ", timeStatus='" + timeStatus + '\'' +
                '}';
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Long currentPage) {
        this.currentPage = currentPage;
    }

    public Long getPageSize() {
        return pageSize;
    }

    public void setPageSize(Long pageSize) {
        this.pageSize = pageSize;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getApplyStatus() {
        return applyStatus;
    }

    public void setApplyStatus(String applyStatus) {
        this.applyStatus = applyStatus;
    }

    public String getBorrowStatus() {
        return borrowStatus;
    }

    public void setBorrowStatus(String borrowStatus) {
        this.borrowStatus = borrowStatus;
    }

    public String getReturnStatus() {
        return returnStatus;
    }

    public void setReturnStatus(String returnStatus) {
        this.returnStatus = returnStatus;
    }

    public String getTimeStatus() {
        return timeStatus;
    }

    public void setTimeStatus(String timeStatus) {
        this.timeStatus = timeStatus;
    }

    public LookParm(Long userId, Long currentPage, Long pageSize, String username, String bookName, String applyStatus, String borrowStatus, String returnStatus, String timeStatus) {
        this.userId = userId;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.phone = phone;
        this.username = username;
        this.bookName = bookName;
        this.applyStatus = applyStatus;
        this.borrowStatus = borrowStatus;
        this.returnStatus = returnStatus;
        this.timeStatus = timeStatus;
    }
}