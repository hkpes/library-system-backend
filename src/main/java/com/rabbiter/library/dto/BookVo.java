package com.rabbiter.library.dto;

public class BookVo {
    private String name;
    private Integer value;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public BookVo() {
    }

    public BookVo(String name, Integer value) {
        this.name = name;
        this.value = value;
    }

    @Override
    public String toString() {
        return "BookVo{" +
                "name='" + name + '\'' +
                ", value=" + value +
                '}';
    }
}
