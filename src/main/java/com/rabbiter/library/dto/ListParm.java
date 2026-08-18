package com.rabbiter.library.dto;

public class ListParm {
    private Long currentPage;
    private Long pageSize;
    private String username;
    private String borrowStatus;

    public ListParm() {
    }

    public ListParm(Long currentPage, Long pageSize, String username, String borrowStatus) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.username = username;
        this.borrowStatus = borrowStatus;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBorrowStatus() {
        return borrowStatus;
    }

    public void setBorrowStatus(String borrowStatus) {
        this.borrowStatus = borrowStatus;
    }

    @Override
    public String toString() {
        return "ListParm{" +
                "currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", username='" + username + '\'' +
                ", borrowStatus='" + borrowStatus + '\'' +
                '}';
    }
}