package com.rabbiter.library.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.rabbiter.library.entity.RoleMenu;

import java.util.List;

public interface RoleMenuService extends IService<RoleMenu> {
    //保存角色的權限
    void assignSave(Long roleId,List<Long> menuList);
}
