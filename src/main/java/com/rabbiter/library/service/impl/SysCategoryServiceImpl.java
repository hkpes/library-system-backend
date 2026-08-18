package com.rabbiter.library.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rabbiter.library.dto.CategoryEcharts;
import com.rabbiter.library.dto.CategoryVo;
import com.rabbiter.library.dto.ListCateParm;
import com.rabbiter.library.entity.SysCategory;
import com.rabbiter.library.mapper.SysCategoryMapper;
import com.rabbiter.library.service.SysCategoryService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SysCategoryServiceImpl extends ServiceImpl<SysCategoryMapper, SysCategory> implements SysCategoryService {
    @Override
    public IPage<SysCategory> getList(ListCateParm parm) {
        //構造分頁對象
        IPage<SysCategory> page = new Page<>();
        page.setSize(parm.getPageSize());
        page.setCurrent(parm.getCurrentPage());
        //查詢條件
        QueryWrapper<SysCategory> query = new QueryWrapper<>();
        if(StringUtils.isNotEmpty(parm.getCategoryName())) {
            query.lambda().like(SysCategory::getCategoryName,parm.getCategoryName());
        }
        return this.baseMapper.selectPage(page,query);
    }

    @Override
    public CategoryEcharts getCategoryVo() {
        CategoryEcharts echarts = new CategoryEcharts();
        List<CategoryVo> categoryVo = this.baseMapper.getCategoryVo();
        List<String> names = new ArrayList<>();
        List<Integer> counts = new ArrayList<>();
        if(categoryVo.size() > 0){
            for(int i=0;i<categoryVo.size();i++){
                names.add(categoryVo.get(i).getCategoryName());
                counts.add(categoryVo.get(i).getBookCount());
            }
            echarts.setCounts(counts);
            echarts.setNames(names);
        }
        return echarts;
    }
}
