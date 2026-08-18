package com.rabbiter.library.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.rabbiter.library.annotation.Auth;
import com.rabbiter.library.jwt.JwtUtils;
import com.rabbiter.library.utils.ResultUtils;
import com.rabbiter.library.utils.ResultVo;
import com.rabbiter.library.dto.NoticeParm;
import com.rabbiter.library.entity.SysNotice;
import com.rabbiter.library.service.SysNoticeService;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/notice")
public class SysNoticeController {
    @Autowired
    private SysNoticeService sysNoticeService;

    @Autowired
    private JwtUtils jwtUtils;

    //新增
    @Auth
    @PostMapping
    public ResultVo add(@RequestBody SysNotice sysNotice, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        sysNotice.setCreateTime(new Date());
        boolean save = sysNoticeService.save(sysNotice);
        if(save){
            return ResultUtils.success("新增成功");
        }
        return ResultUtils.error("新增失敗!");
    }

    //編輯
    @Auth
    @PutMapping
    public ResultVo edit(@RequestBody SysNotice sysNotice, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        boolean save = sysNoticeService.updateById(sysNotice);
        if(save){
            return ResultUtils.success("編輯成功");
        }
        return ResultUtils.error("編輯失敗!");
    }

    //刪除
    @Auth
    @DeleteMapping("/{noticeId}")
    public ResultVo delete(@PathVariable("noticeId") Long noticeId, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        boolean save = sysNoticeService.removeById(noticeId);
        if(save){
            return ResultUtils.success("刪除成功");
        }
        return ResultUtils.error("刪除失敗!");
    }

    //名單
    @Auth
    @GetMapping("/list")
    public ResultVo getList(NoticeParm parm){
        IPage<SysNotice> list = sysNoticeService.getList(parm);
        return ResultUtils.success("查詢成功",list);
    }

    //名單
    @Auth
    @GetMapping("/getTopList")
    public ResultVo getTopList(){
        QueryWrapper<SysNotice> query = new QueryWrapper<>();
        query.lambda().orderByDesc(SysNotice::getCreateTime).last("limit 3");
        List<SysNotice> list = sysNoticeService.list(query);
        return ResultUtils.success("查詢成功",list);
    }
}
