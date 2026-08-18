package com.rabbiter.library.utils;

import com.rabbiter.library.dto.RouterVO;
import com.rabbiter.library.entity.SysMenu;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class MakeTree {

    public static List<SysMenu> makeMenuTree(List<SysMenu> menuList, Long pid) {
        List<SysMenu> list = new ArrayList<>();
        Optional.ofNullable(menuList).orElse(new ArrayList<>())
                .stream()
                .filter(item -> item != null && item.getParentId() == pid)
                .forEach(dom -> {
                    SysMenu menu = new SysMenu();
                    BeanUtils.copyProperties(dom, menu);
                    //查詢該項的下級菜單
                    List<SysMenu> sysMenus = makeMenuTree(menuList, dom.getMenuId());
                    menu.setChildren(sysMenus);
                    list.add(menu);
                });
        return list;
    }

     /**
     * 生成路由數據格式
     */
    public static List<RouterVO> makeRouter(List<SysMenu> menuList, Long pid){
        //接受生產的路由數據
        List<RouterVO> list = new ArrayList<>();
        //組裝數據
        Optional.ofNullable(menuList).orElse(new ArrayList<>())
                .stream()
                .filter(item ->item != null && item.getParentId() == pid)
                .forEach(item ->{
                    RouterVO router = new RouterVO();
                    router.setName(item.getName());
                    router.setPath(item.getPath());
                    //判斷是否是一級菜單
                    if(item.getParentId() == 0L){
                        router.setComponent("Layout");
                        router.setAlwaysShow(true);
                    }else{
                        router.setComponent(item.getUrl());
                        router.setAlwaysShow(false);
                    }
                    //設置meta
                    router.setMeta(router.new Meta(
                            item.getTitle(),
                            item.getIcon(),
                            item.getCode().split(",")
                    ));
                    //設置children
                    List<RouterVO> children = makeRouter(menuList, item.getMenuId());
                    router.setChildren(children);
                    if(router.getChildren().size() > 0){
                        router.setAlwaysShow(true);
                    }
                    list.add(router);
                });
        return list;
    }
}
