package com.rabbiter.library.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.rabbiter.library.dto.ReaderParm;
import com.rabbiter.library.entity.SysReader;

public interface SysReaderService extends IService<SysReader> {
    IPage<SysReader> getList(ReaderParm parm);
    //新增會員
    void saveReader(SysReader sysReader);
    //編輯會員
    void editReader(SysReader sysReader);

    SysReader loadByUsername(String phone);
}
