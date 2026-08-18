package com.rabbiter.library.utils;


public class ResultVo<T> {
    private String msg;
    private int code;
    private T data;

    @Override
    public String toString() {
        return "ResultVo{" +
                "msg='" + msg + '\'' +
                ", code=" + code +
                ", data=" + data +
                '}';
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public ResultVo() {
    }

    public ResultVo(String msg, int code, T data) {
        this.msg = msg;
        this.code = code;
        this.data = data;
    }
}