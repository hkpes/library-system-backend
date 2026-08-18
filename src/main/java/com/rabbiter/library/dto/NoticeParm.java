package com.rabbiter.library.dto;


public class NoticeParm {
    private Long currentPage;
    private Long pageSize;
    private String noticeTitle;

    @Override
    public String toString() {
        return "NoticeParm{" +
                "currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", noticeTitle='" + noticeTitle + '\'' +
                '}';
    }

    public Long getPageSize() {
        return pageSize;
    }

    public void setPageSize(Long pageSize) {
        this.pageSize = pageSize;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }

    public Long getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Long currentPage) {
        this.currentPage = currentPage;
    }

    public NoticeParm() {
    }

    public NoticeParm(Long currentPage, Long pageSize, String noticeTitle) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.noticeTitle = noticeTitle;
    }
}
