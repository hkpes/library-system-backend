package com.rabbiter.library.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;

@TableName("sys_books")
public class SysBooks {
    @TableId(type = IdType.AUTO)
    private Long bookId;
     private Long categoryId;
    @TableField(exist = false)
    private String categoryName;
    private String bookName;
    private String bookPlaceNum;
    private String bookAuther;
    private String bookProduct;
    private Integer bookStore;

    @Override
    public String toString() {
        return "SysBooks{" +
                "bookId=" + bookId +
                ", categoryId=" + categoryId +
                ", categoryName='" + categoryName + '\'' +
                ", bookName='" + bookName + '\'' +
                ", bookPlaceNum='" + bookPlaceNum + '\'' +
                ", bookAuther='" + bookAuther + '\'' +
                ", bookProduct='" + bookProduct + '\'' +
                ", bookStore=" + bookStore +
                '}';
    }

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
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

    public String getBookAuther() {
        return bookAuther;
    }

    public void setBookAuther(String bookAuther) {
        this.bookAuther = bookAuther;
    }

    public String getBookProduct() {
        return bookProduct;
    }

    public void setBookProduct(String bookProduct) {
        this.bookProduct = bookProduct;
    }

    public Integer getBookStore() {
        return bookStore;
    }

    public void setBookStore(Integer bookStore) {
        this.bookStore = bookStore;
    }

    public SysBooks(Long bookId, Long categoryId, String categoryName, String bookName, String bookPlaceNum, String bookAuther, String bookProduct, BigDecimal bookPrice, Integer bookStore) {
        this.bookId = bookId;
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.bookName = bookName;
        this.bookPlaceNum = bookPlaceNum;
        this.bookAuther = bookAuther;
        this.bookProduct = bookProduct;
        this.bookStore = bookStore;
    }

    public SysBooks() {
    }
}
