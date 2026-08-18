package com.rabbiter.library.dto;


public class ListCateParm {
    private Long currentPage;
    private Long pageSize;
    private String categoryName;

    public ListCateParm() {
    }

    public ListCateParm(Long currentPage, Long pageSize, String categoryName) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "ListCateParm{" +
                "currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", categoryName='" + categoryName + '\'' +
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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
