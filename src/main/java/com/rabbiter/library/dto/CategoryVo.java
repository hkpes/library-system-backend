package com.rabbiter.library.dto;


public class CategoryVo {
    private String categoryName;
    private Integer bookCount;

    public CategoryVo() {
    }

    public CategoryVo(String categoryName, Integer bookCount) {
        this.categoryName = categoryName;
        this.bookCount = bookCount;
    }

    @Override
    public String toString() {
        return "CategoryVo{" +
                "categoryName='" + categoryName + '\'' +
                ", bookCount=" + bookCount +
                '}';
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Integer getBookCount() {
        return bookCount;
    }

    public void setBookCount(Integer bookCount) {
        this.bookCount = bookCount;
    }
}