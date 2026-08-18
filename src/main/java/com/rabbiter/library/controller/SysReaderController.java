package com.rabbiter.library.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.rabbiter.library.annotation.Auth;
import com.rabbiter.library.jwt.JwtUtils;
import com.rabbiter.library.utils.ResultUtils;
import com.rabbiter.library.utils.ResultVo;
import com.rabbiter.library.dto.ReaderParm;
import com.rabbiter.library.entity.SysReader;
import com.rabbiter.library.service.SysReaderService;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/reader")
public class SysReaderController {
    @Autowired
    private SysReaderService sysReaderService;

    @Autowired
    private JwtUtils jwtUtils;

    //會員註冊
    @PostMapping("/register")
    public ResultVo register(@RequestBody SysReader reader) {
        //查詢電話是否已經被占用
        QueryWrapper<SysReader> query = new QueryWrapper<>();
        query.lambda().eq(SysReader::getPhone, reader.getPhone());
        SysReader one = sysReaderService.getOne(query);
        if (one != null) {
            return ResultUtils.error("該電話號碼被占用!");
        }
        reader.setPassword(DigestUtils.md5DigestAsHex(reader.getPassword().getBytes()));
        reader.setCheckStatus("0"); //未審核
        reader.setUserStatus("0");  //未啟用
        sysReaderService.saveReader(reader);
        return ResultUtils.success("註冊成功!");
    }

    //新增
    @Auth
    @PostMapping
    public ResultVo addReader(@RequestBody SysReader reader, HttpServletRequest request) {
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        //查詢電話是否已經被占用
        QueryWrapper<SysReader> query = new QueryWrapper<>();
        query.lambda().eq(SysReader::getPhone, reader.getPhone());
        SysReader one = sysReaderService.getOne(query);
        if (one != null) {
            return ResultUtils.error("該電話號碼被占用!");
        }
        reader.setPassword(DigestUtils.md5DigestAsHex(reader.getPassword().getBytes()));
        reader.setCheckStatus("1");
        reader.setUserStatus("1");
        sysReaderService.saveReader(reader);
        return ResultUtils.success("新增成功!");
    }

    //編輯
    @Auth
    @PutMapping
    public ResultVo editReader(@RequestBody SysReader reader, HttpServletRequest request) {
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        sysReaderService.editReader(reader);
        return ResultUtils.success("編輯成功!");
    }

    //會員審核
    @Auth
    @PutMapping("/applyReader")
    public ResultVo applyReader(@RequestBody SysReader reader, HttpServletRequest request) {
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        reader.setCheckStatus("1");
        reader.setUserStatus("1");
        sysReaderService.updateById(reader);
        return ResultUtils.success("審核成功!");
    }

    //刪除
    @Auth
    @DeleteMapping("/{readerId}")
    public ResultVo deleteReader(@PathVariable("readerId") Long readerId, HttpServletRequest request) {
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        boolean remove = sysReaderService.removeById(readerId);
        if (remove) {
            return ResultUtils.success("刪除成功!");
        }
        return ResultUtils.error("刪除失敗！");
    }

    //名單
    @Auth
    @GetMapping("/list")
    public ResultVo getList(ReaderParm parm) {
        IPage<SysReader> list = sysReaderService.getList(parm);
        return ResultUtils.success("查詢成功", list);
    }

    //根據電話查詢信息
    @Auth
    @GetMapping("/getByPhone")
    public ResultVo getByPhone(SysReader reader) {
        QueryWrapper<SysReader> query = new QueryWrapper<>();
        query.lambda().eq(SysReader::getPhone, reader.getPhone());
        SysReader one = sysReaderService.getOne(query);
        return ResultUtils.success("查詢成功", one);
    }

    //會員總數
    @Auth
    @GetMapping("/getReaderCount")
    public ResultVo getReaderCount(){
        int count = sysReaderService.count();
        return ResultUtils.success("查詢成功",count);
    }

    //待審核讀者總量
    @Auth
    @GetMapping("/getApplyReaderCount")
    public ResultVo getApplyReaderCount(){
        QueryWrapper<SysReader> query = new QueryWrapper<>();
        query.lambda().eq(SysReader::getCheckStatus,"0");
        int count = sysReaderService.count(query);
        return ResultUtils.success("查詢成功",count);
    }

    //重設密碼
    @Auth
    @PostMapping("/resetPassword")
    public ResultVo resetPassword(@RequestBody SysReader sysReader, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        String pasword = "123456";
        sysReader.setPassword(DigestUtils.md5DigestAsHex(pasword.getBytes()));
        boolean b = sysReaderService.updateById(sysReader);
        if(b){
            return ResultUtils.success("重設密碼成功!");
        }
        return ResultUtils.error("重設密碼失敗!");
    }
}
