package com.rabbiter.library.dto;


import java.util.ArrayList;
import java.util.List;

public class CategoryEcharts {
    private List<String> names =  new ArrayList<>();
    private List<Integer> counts = new ArrayList<>();

    public CategoryEcharts() {
    }

    public CategoryEcharts(List<String> names, List<Integer> counts) {
        this.names = names;
        this.counts = counts;
    }

    public List<String> getNames() {
        return names;
    }

    public void setNames(List<String> names) {
        this.names = names;
    }

    public List<Integer> getCounts() {
        return counts;
    }

    public void setCounts(List<Integer> counts) {
        this.counts = counts;
    }
}