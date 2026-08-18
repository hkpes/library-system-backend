package com.rabbiter.library.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.rabbiter.library.dto.CategoryEcharts;
import com.rabbiter.library.dto.ListCateParm;
import com.rabbiter.library.entity.SysCategory;


public interface SysCategoryService extends IService<SysCategory> {
    IPage<SysCategory> getList(ListCateParm parm);
    CategoryEcharts getCategoryVo();
}
