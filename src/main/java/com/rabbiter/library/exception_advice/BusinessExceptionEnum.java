package com.rabbiter.library.exception_advice;


public enum  BusinessExceptionEnum {
    SERVER_ERROR(500, "服務器異常！"),
    NO_STOCK(1001,"---->庫存不足!"),
    ;

    private Integer code;
    private String message;

    BusinessExceptionEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}