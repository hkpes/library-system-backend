package com.rabbiter.library.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.rabbiter.library.annotation.Auth;
import com.rabbiter.library.entity.SysReader;
import com.rabbiter.library.jwt.JwtUtils;
import com.rabbiter.library.utils.ResultUtils;
import com.rabbiter.library.utils.ResultVo;
import com.rabbiter.library.service.SysRoleService;
import com.rabbiter.library.service.RoleMenuService;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@RestController
@RequestMapping("/api/role")
public class SysRoleController {
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private RoleMenuService roleMenuService;
    @Autowired
    private JwtUtils jwtUtils;

    //新增
    @Auth
    @PostMapping
    public ResultVo addRole(@RequestBody SysReader.SysRole role, HttpServletRequest request) {
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        if (role.getRoleType().equals("2")) {
            QueryWrapper<SysReader.SysRole> query = new QueryWrapper<>();
            query.lambda().eq(SysReader.SysRole::getRoleType, "2");
            SysReader.SysRole one = sysRoleService.getOne(query);
            if (one != null) {
                return ResultUtils.error("會員身份已經存在!");
            }
        }
        role.setCreateTime(new Date());
        boolean save = sysRoleService.save(role);
        if (save) {
            return ResultUtils.success("新增身份成功!");
        }
        return ResultUtils.error("新增身份失敗!");
    }

    //編輯
    @Auth
    @PutMapping
    public ResultVo editRole(@RequestBody SysReader.SysRole role, HttpServletRequest request) {
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        if (role.getRoleType().equals("2")) {
            QueryWrapper<SysReader.SysRole> query = new QueryWrapper<>();
            query.lambda().eq(SysReader.SysRole::getRoleType, "2");
            SysReader.SysRole one = sysRoleService.getOne(query);
            if (one != null && role.getRoleId() != one.getRoleId()) {
                return ResultUtils.error("會員身份已經存在!");
            }
        }
        role.setCreateTime(new Date());
        boolean save = sysRoleService.updateById(role);
        if (save) {
            return ResultUtils.success("編輯身份成功!");
        }
        return ResultUtils.error("編輯身份失敗!");
    }

    //刪除
    @Auth
    @DeleteMapping("/{roleId}")
    public ResultVo deleteRole(@PathVariable("roleId") Long roleId, HttpServletRequest request) {
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        boolean remove = sysRoleService.removeById(roleId);
        if (remove) {
            return ResultUtils.success("刪除身份成功!");
        }
        return ResultUtils.error("刪除身份失敗!");
    }

    //名單
    @Auth
    @GetMapping("/list")
    public ResultVo getList(SysReader.RoleParm parm) {
        IPage<SysReader.SysRole> list = sysRoleService.list(parm);
        return ResultUtils.success("查詢成功!", list);
    }

    //查詢身份權限的回顯
    @Auth
    @GetMapping("/getAssingShow")
    public ResultVo getAssingShow(SysReader.AssignParm parm) {
        SysReader.AssignVo show = sysRoleService.getAssignShow(parm);
        return ResultUtils.success("查詢成功", show);
    }

    //身份分配權限保存
    @Auth
    @PostMapping("/assignSave")
    public ResultVo assignSave(@RequestBody SysReader.SaveAssign parm, HttpServletRequest request) {
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        roleMenuService.assignSave(parm.getRoleId(), parm.getList());
        return ResultUtils.success("分配成功!");
    }
}
