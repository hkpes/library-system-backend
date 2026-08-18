package com.rabbiter.library.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.rabbiter.library.annotation.Auth;
import com.rabbiter.library.jwt.JwtUtils;
import com.rabbiter.library.utils.ResultUtils;
import com.rabbiter.library.utils.ResultVo;
import com.rabbiter.library.dto.CategoryEcharts;
import com.rabbiter.library.dto.ListCateParm;
import com.rabbiter.library.entity.SysCategory;
import com.rabbiter.library.service.SysCategoryService;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/api/category")
public class SysCategoryController {
    @Autowired
    private SysCategoryService sysCategoryService;

    @Autowired
    private JwtUtils jwtUtils;

    //新增
    @Auth
    @PostMapping
    public ResultVo add(@RequestBody SysCategory category, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        boolean save = sysCategoryService.save(category);
        if(save){
            return ResultUtils.success("新增成功!");
        }
        return ResultUtils.error("新增失敗!");
    }

    //編輯
    @Auth
    @PutMapping
    public ResultVo edit(@RequestBody SysCategory category, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        boolean save = sysCategoryService.updateById(category);
        if(save){
            return ResultUtils.success("編輯成功!");
        }
        return ResultUtils.error("編輯失敗!");
    }

    //刪除
    @Auth
    @DeleteMapping("/{categoryId}")
    public ResultVo delete(@PathVariable("categoryId") Long categoryId, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        boolean remove = sysCategoryService.removeById(categoryId);
        if(remove){
            return ResultUtils.success("刪除成功!");
        }
        return ResultUtils.error("刪除失敗!");
    }

    //名單
    @Auth
    @GetMapping("/list")
    public ResultVo getList(ListCateParm parm){
        IPage<SysCategory> list = sysCategoryService.getList(parm);
        return ResultUtils.success("查詢成功",list);
    }

    //書本名單分類
    @Auth
    @GetMapping("/cateList")
    public ResultVo getCateList(){
        List<SysCategory> list = sysCategoryService.list();
        return ResultUtils.success("查詢成功",list);
    }

    //書本名單分類
    @Auth
    @GetMapping("/categoryCount")
    public ResultVo categoryCount(){
        CategoryEcharts categoryVo = sysCategoryService.getCategoryVo();
        return ResultUtils.success("查詢成功",categoryVo);
    }
}
