package com.rabbiter.library.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.rabbiter.library.annotation.Auth;
import com.rabbiter.library.jwt.JwtUtils;
import com.rabbiter.library.utils.ResultUtils;
import com.rabbiter.library.utils.ResultVo;
import com.rabbiter.library.entity.SysMenu;
import com.rabbiter.library.service.SysMenuService;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/menu")
public class SysMenuController {
    @Autowired
    private SysMenuService sysMenuService;

    @Autowired
    private JwtUtils jwtUtils;

    //新增
    @Auth
    @PostMapping
    public ResultVo addMenu(@RequestBody SysMenu menu, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        menu.setCreateTime(new Date());
        boolean save = sysMenuService.save(menu);
        if(save){
            return ResultUtils.success("新增成功!");
        }
        return ResultUtils.error("新增失敗!");
    }

    //編輯
    @Auth
    @PutMapping
    public ResultVo editMenu(@RequestBody SysMenu menu, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        menu.setUpdateTime(new Date());
        boolean save = sysMenuService.updateById(menu);
        if(save){
            return ResultUtils.success("編輯成功!");
        }
        return ResultUtils.error("編輯失敗!");
    }

    //刪除
    @Auth
    @DeleteMapping("/{menuId}")
    public ResultVo deleteMenu(@PathVariable("menuId") Long menuId, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        //判断是否有下级，有下级，不能删除
        QueryWrapper<SysMenu> query = new QueryWrapper<>();
        query.lambda().eq(SysMenu::getParentId,menuId);
        List<SysMenu> list = sysMenuService.list(query);
        if(list.size() > 0){
            return ResultUtils.error("該選單存在下級不能刪除!");
        }
        boolean save = sysMenuService.removeById(menuId);
        if(save){
            return ResultUtils.success("刪除成功!");
        }
        return ResultUtils.error("刪除失敗!");
    }

    //選單名單
    @Auth
    @GetMapping("/list")
    public ResultVo getList(){
        List<SysMenu> list = sysMenuService.menuList();
        return ResultUtils.success("查詢成功",list);
    }

    //上級選單名單
    @Auth
    @GetMapping("/parent")
    public ResultVo getParentList(){
        List<SysMenu> list = sysMenuService.parentList();
        return ResultUtils.success("查詢成功",list);
    }
}
