package com.rabbiter.library.dto;


public class ExceptionParm {
    private Long borrowId;
    //圖書id
    private Long bookId;
    //判斷是異常還是丟失 0：異常 1：丢失
    private String type;
    //異常還書備註
    private String excepionText;

    public ExceptionParm() {
    }

    public ExceptionParm(Long borrowId, Long bookId, String type, String excepionText) {
        this.borrowId = borrowId;
        this.bookId = bookId;
        this.type = type;
        this.excepionText = excepionText;
    }

    @Override
    public String toString() {
        return "ExceptionParm{" +
                "borrowId=" + borrowId +
                ", bookId=" + bookId +
                ", type='" + type + '\'' +
                ", excepionText='" + excepionText + '\'' +
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getExcepionText() {
        return excepionText;
    }

    public void setExcepionText(String excepionText) {
        this.excepionText = excepionText;
    }

    public static class ListParm {
        private Long currentPage;
        private Long pageSize;
        private String categoryId;
        private String bookName;
        private String bookPlaceNum;
        private String bookAuther;
        private String username;
        private String phone;
        private Integer borrowStatus;

        public ListParm() {
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public ListParm(Long currentPage, Long pageSize, String categoryId, String bookName, String bookPlaceNum, String bookAuther, String username, Integer borrowStatus) {
            this.currentPage = currentPage;
            this.pageSize = pageSize;
            this.categoryId = categoryId;
            this.bookName = bookName;
            this.bookPlaceNum = bookPlaceNum;
            this.bookAuther = bookAuther;
            this.username = username;
            this.borrowStatus = borrowStatus;
        }

        @Override
        public String toString() {
            return "ListParm{" +
                    "currentPage=" + currentPage +
                    ", pageSize=" + pageSize +
                    ", categoryId='" + categoryId + '\'' +
                    ", bookName='" + bookName + '\'' +
                    ", bookPlaceNum='" + bookPlaceNum + '\'' +
                    ", bookAuther='" + bookAuther + '\'' +
                    ", username='" + username + '\'' +
                    ", phone='" + phone + '\'' +
                    ", borrowStatus=" + borrowStatus +
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

        public String getCategoryId() {
            return categoryId;
        }

        public void setCategoryId(String categoryId) {
            this.categoryId = categoryId;
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

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public Integer getBorrowStatus() {
            return borrowStatus;
        }

        public void setBorrowStatus(Integer borrowStatus) {
            this.borrowStatus = borrowStatus;
        }
    }
}
