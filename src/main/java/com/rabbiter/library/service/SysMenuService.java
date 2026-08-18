package com.rabbiter.library.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.rabbiter.library.entity.SysMenu;

import java.util.List;

public interface SysMenuService extends IService<SysMenu> {
    //選單名單
    List<SysMenu> menuList();
    //上層選單名單
    List<SysMenu> parentList();
    //根據賬戶編號查詢權限
    List<SysMenu> getMenuByUserId(Long userId);
    //根據身份編號查詢權限
    List<SysMenu> getMenuByRoleId(Long roleId);
    //根據讀者id查詢權限
    List<SysMenu> getReaderMenuByUserId(Long readerId);
}
