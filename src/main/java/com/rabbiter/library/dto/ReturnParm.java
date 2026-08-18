package com.rabbiter.library.dto;


public class ReturnParm {

    private Long borrowId;
    //圖書id
    private Long bookId;

    @Override
    public String toString() {
        return "ReturnParm{" +
                "borrowId=" + borrowId +
                ", bookId=" + bookId +
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

    public ReturnParm() {
    }

    public ReturnParm(Long borrowId, Long bookId) {
        this.borrowId = borrowId;
        this.bookId = bookId;
    }
}