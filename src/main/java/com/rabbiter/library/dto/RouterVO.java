package com.rabbiter.library.dto;


import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 路由需要的數據格式
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class RouterVO {

    private String path;

    private String component;

    private boolean alwaysShow;

    private String name;

    private Meta meta;

    @Override
    public String toString() {
        return "RouterVO{" +
                "path='" + path + '\'' +
                ", component='" + component + '\'' +
                ", alwaysShow=" + alwaysShow +
                ", name='" + name + '\'' +
                ", meta=" + meta +
                ", children=" + children +
                '}';
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public boolean isAlwaysShow() {
        return alwaysShow;
    }

    public void setAlwaysShow(boolean alwaysShow) {
        this.alwaysShow = alwaysShow;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Meta getMeta() {
        return meta;
    }

    public void setMeta(Meta meta) {
        this.meta = meta;
    }

    public List<RouterVO> getChildren() {
        return children;
    }

    public void setChildren(List<RouterVO> children) {
        this.children = children;
    }

    public RouterVO(String path, String component, boolean alwaysShow, String name, Meta meta, List<RouterVO> children) {
        this.path = path;
        this.component = component;
        this.alwaysShow = alwaysShow;
        this.name = name;
        this.meta = meta;
        this.children = children;


    }

    public RouterVO() {
    }

    public class Meta {
        private String title;
        private String icon;
        private Object[] roles;

        @Override
        public String toString() {
            return "Meta{" +
                    "title='" + title + '\'' +
                    ", icon='" + icon + '\'' +
                    ", roles=" + Arrays.toString(roles) +
                    '}';
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public String getIcon() {
            return icon;
        }

        public void setIcon(String icon) {
            this.icon = icon;
        }

        public Object[] getRoles() {
            return roles;
        }

        public void setRoles(Object[] roles) {
            this.roles = roles;
        }

        public Meta() {
        }

        public Meta(String title, String icon, Object[] roles) {
            this.title = title;
            this.icon = icon;
            this.roles = roles;
        }
    }
    private List<RouterVO> children =new ArrayList<>();

}