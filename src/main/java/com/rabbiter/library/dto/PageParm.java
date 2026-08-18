package com.rabbiter.library.dto;

public class PageParm {
    private Long currentPage;
    private Long pageSize;
    private String phone;
    private String nickName;

    @Override
    public String toString() {
        return "PageParm{" +
                "currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", phone='" + phone + '\'' +
                ", nickName='" + nickName + '\'' +
                '}';
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

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public PageParm(Long currentPage, Long pageSize, String phone, String nickName) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.phone = phone;
        this.nickName = nickName;
    }

    public PageParm() {
    }
}
