package com.rabbiter.library.dto;


import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;

public class ReturnBook {
    private Long borrowId;
    private Long bookId;
    private String bookName;
    private String bookPlaceNum;
    private String username;
    private String phone;
    private String borrowStatus;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date borrowTime;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date returnTime;
    private String timeStatus;

    @Override
    public String toString() {
        return "ReturnBook{" +
                "borrowId=" + borrowId +
                ", bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", bookPlaceNum='" + bookPlaceNum + '\'' +
                ", username='" + username + '\'' +
                ", phone='" + phone + '\'' +
                ", borrowStatus='" + borrowStatus + '\'' +
                ", borrowTime=" + borrowTime +
                ", returnTime=" + returnTime +
                ", timeStatus='" + timeStatus + '\'' +
                '}';
    }

    public Long getBorrowId() {
        return borrowId;
    }

    public void setBorrowId(Long borrowId) {
        this.borrowId = borrowId;
    }

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookPlaceNum() {
        return bookPlaceNum;
    }

    public void setBookPlaceNum(String bookPlaceNum) {
        this.bookPlaceNum = bookPlaceNum;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBorrowStatus() {
        return borrowStatus;
    }

    public void setBorrowStatus(String borrowStatus) {
        this.borrowStatus = borrowStatus;
    }

    public Date getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(Date borrowTime) {
        this.borrowTime = borrowTime;
    }

    public Date getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(Date returnTime) {
        this.returnTime = returnTime;
    }

    public String getTimeStatus() {
        return timeStatus;
    }

    public void setTimeStatus(String timeStatus) {
        this.timeStatus = timeStatus;
    }

    public ReturnBook(Long borrowId, Long bookId, String bookName, String bookPlaceNum, String username, String phone, String borrowStatus, Date borrowTime, Date returnTime, String timeStatus) {
        this.borrowId = borrowId;
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookPlaceNum = bookPlaceNum;
        this.username = username;
        this.phone = phone;
        this.borrowStatus = borrowStatus;
        this.borrowTime = borrowTime;
        this.returnTime = returnTime;
        this.timeStatus = timeStatus;
    }

    public ReturnBook() {
    }
}
