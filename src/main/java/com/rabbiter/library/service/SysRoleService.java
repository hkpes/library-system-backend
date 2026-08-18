package com.rabbiter.library.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.rabbiter.library.entity.SysReader;

public interface SysRoleService extends IService<SysReader.SysRole> {
    IPage<SysReader.SysRole> list(SysReader.RoleParm parm);
    //身份權限的回顯
    SysReader.AssignVo getAssignShow(SysReader.AssignParm parm);
}
