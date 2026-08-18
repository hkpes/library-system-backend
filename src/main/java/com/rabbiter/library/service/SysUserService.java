package com.rabbiter.library.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.rabbiter.library.dto.PageParm;
import com.rabbiter.library.entity.SysUser;

public interface SysUserService extends IService<SysUser> {
    IPage<SysUser> list(PageParm parm);
    void addUser(SysUser user);
    void editUser(SysUser user);
    SysUser loadByUsername(String username);
}
