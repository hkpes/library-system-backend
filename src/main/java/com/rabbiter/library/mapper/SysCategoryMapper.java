package com.rabbiter.library.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.rabbiter.library.dto.CategoryVo;
import com.rabbiter.library.entity.SysCategory;

import java.util.List;

public interface SysCategoryMapper extends BaseMapper<SysCategory> {
    List<CategoryVo> getCategoryVo();
}
