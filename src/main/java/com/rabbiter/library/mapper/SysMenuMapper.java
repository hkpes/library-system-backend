package com.rabbiter.library.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.rabbiter.library.entity.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysMenuMapper extends BaseMapper<SysMenu> {
    //根據用戶id查詢權限
    List<SysMenu> getMenuByUserId(@Param("userId") Long userId);
    //根據讀者id查詢權限
    List<SysMenu> getReaderMenuByUserId(@Param("readerId") Long readerId);
    //根據角色id查詢權限
    List<SysMenu> getMenuByRoleId(@Param("roleId") Long roleId);
}
