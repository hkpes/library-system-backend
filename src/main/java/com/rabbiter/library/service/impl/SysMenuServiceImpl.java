package com.rabbiter.library.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rabbiter.library.utils.MakeTree;
import com.rabbiter.library.entity.SysMenu;
import com.rabbiter.library.mapper.SysMenuMapper;
import com.rabbiter.library.service.SysMenuService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {

    @Override
    public List<SysMenu> menuList() {
        //查詢名單
        QueryWrapper<SysMenu> query = new QueryWrapper<>();
        query.lambda().orderByAsc(SysMenu::getOrderNum);
        List<SysMenu> menuList = this.baseMapper.selectList(query);
        //組裝樹
        List<SysMenu> list = MakeTree.makeMenuTree(menuList, 0L);
        return list;
    }

    @Override
    public List<SysMenu> parentList() {
        //只需要查詢目錄和菜單
        String[] types = {"0","1"};
        //構造查詢條件
        QueryWrapper<SysMenu> query = new QueryWrapper<>();
        query.lambda().in(SysMenu::getType, Arrays.asList(types)).orderByAsc(SysMenu::getOrderNum);
        List<SysMenu> sysMenus = this.baseMapper.selectList(query);
        //構造主選單
        SysMenu menu = new SysMenu();
        menu.setMenuId(0L);
        menu.setParentId(-1L);
        menu.setTitle("主選單");
        sysMenus.add(menu);
        //構造樹
        List<SysMenu> sysMenus1 = MakeTree.makeMenuTree(sysMenus, -1L);

        return sysMenus1;
    }

    @Override
    public List<SysMenu> getMenuByUserId(Long userId) {
        return this.baseMapper.getMenuByUserId(userId);
    }

    @Override
    public List<SysMenu> getMenuByRoleId(Long roleId) {
        return this.baseMapper.getMenuByRoleId(roleId);
    }

    @Override
    public List<SysMenu> getReaderMenuByUserId(Long readerId) {
        return this.baseMapper.getReaderMenuByUserId(readerId);
    }
}
