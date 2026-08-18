package com.rabbiter.library.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.rabbiter.library.entity.RoleMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMenuMapper extends BaseMapper<RoleMenu> {
    //保存角色的權限
    void assignSave(@Param("roleId") Long roleId, @Param("menuList")List<Long> menuList);
}
