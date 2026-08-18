package com.rabbiter.library.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rabbiter.library.utils.MakeTree;
import com.rabbiter.library.entity.SysMenu;
import com.rabbiter.library.entity.SysReader;
import com.rabbiter.library.service.SysMenuService;
import com.rabbiter.library.mapper.SysRoleMapper;
import com.rabbiter.library.service.SysRoleService;
import com.rabbiter.library.entity.SysUser;
import com.rabbiter.library.service.SysUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysReader.SysRole> implements SysRoleService {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private SysMenuService sysMenuService;
    @Override
    public IPage<SysReader.SysRole> list(SysReader.RoleParm parm) {
        //構造分頁對象
        IPage<SysReader.SysRole> page = new Page<>();
        page.setSize(parm.getPageSize());
        page.setCurrent(parm.getCurrentPage());
        //查詢條件
        QueryWrapper<SysReader.SysRole> query = new QueryWrapper<>();
        if(StringUtils.isNotEmpty(parm.getRoleName())){
            query.lambda().like(SysReader.SysRole::getRoleName,parm.getRoleName());
        }
        return this.baseMapper.selectPage(page,query);
    }

    @Override
    public SysReader.AssignVo getAssignShow(SysReader.AssignParm parm) {
        //查詢當前用戶的信息
        SysUser user = sysUserService.getById(parm.getUserId());
        //菜單數據
        List<SysMenu> list = null;
        if(user.getIsAdmin().equals("1")){ //如果是超级管理員，拥有所有的權限
            QueryWrapper<SysMenu> query = new QueryWrapper<>();
            query.lambda().orderByAsc(SysMenu::getOrderNum);
            list = sysMenuService.list(query);
        }else{
            list = sysMenuService.getMenuByUserId(user.getUserId());
        }
        //組裝樹
        List<SysMenu> menuList = MakeTree.makeMenuTree(list, 0L);
        //查詢角色原來是菜單
        List<SysMenu> roleList = sysMenuService.getMenuByRoleId(parm.getRoleId());
        List<Long> ids = new ArrayList<>();
        Optional.ofNullable(roleList).orElse(new ArrayList<>()).stream().filter(item -> item != null).forEach(item ->{
            ids.add(item.getMenuId());
        });
        //組裝數據
        SysReader.AssignVo vo = new SysReader.AssignVo();
        vo.setMenuList(menuList);
        vo.setCheckList(ids.toArray());
        return vo;
    }
}
