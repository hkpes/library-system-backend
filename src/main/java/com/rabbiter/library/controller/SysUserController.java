package com.rabbiter.library.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.rabbiter.library.annotation.Auth;
import com.rabbiter.library.jwt.JwtUtils;
import com.rabbiter.library.utils.ResultUtils;
import com.rabbiter.library.utils.ResultVo;
import com.rabbiter.library.entity.SysReader;
import com.rabbiter.library.service.SysReaderService;
import com.rabbiter.library.service.SysRoleService;
import com.rabbiter.library.dto.PageParm;
import com.rabbiter.library.entity.SysUser;
import com.rabbiter.library.dto.UpdatePasswordParm;
import com.rabbiter.library.service.SysUserService;
import com.rabbiter.library.entity.UserRole;
import com.rabbiter.library.service.UserRoleService;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/user")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private UserRoleService userRoleService;
    @Autowired
    private JwtUtils jwtUtils;
    @Autowired
    private SysReaderService sysReaderService;

    //新增用戶
    @Auth
    @PostMapping
    public ResultVo addUser(@RequestBody SysUser user){
        //判斷帳戶是否被占用
        QueryWrapper<SysUser> query = new QueryWrapper<>();
        query.lambda().eq(SysUser::getUsername,user.getUsername());
        SysUser one = sysUserService.getOne(query);
        if(one != null){
            return ResultUtils.error("帳戶被占用!");
        }
        //密碼加密
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        //設置是否管理員
        user.setIsAdmin("0");
        user.setCreateTime(new Date());
        //入庫
        sysUserService.addUser(user);
        return ResultUtils.success("新增用戶成功!");
    }

    //編輯用戶
    @Auth
    @PutMapping
    public ResultVo editUser(@RequestBody SysUser user){
        //判断帳戶是否被占用
        QueryWrapper<SysUser> query = new QueryWrapper<>();
        query.lambda().eq(SysUser::getUsername,user.getUsername());
        SysUser one = sysUserService.getOne(query);
        if(one != null && one.getUserId() != user.getUserId()){
            return ResultUtils.error("帳戶被占用!");
        }
        //密码加密
//        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        user.setUpdateTime(new Date());
        //更新
        sysUserService.editUser(user);
        return ResultUtils.success("編輯用戶成功!");
    }

    //刪除
    @Auth
    @DeleteMapping("/{userId}")
    public ResultVo delete(@PathVariable("userId") Long userId){
        boolean remove = sysUserService.removeById(userId);
        if(remove){
            return ResultUtils.success("刪除用戶成功!");
        }
        return ResultUtils.error("刪除用戶失敗!");
    }

    //名單查詢
    @Auth
    @GetMapping("/list")
    public ResultVo getList(PageParm parm){
        IPage<SysUser> list = sysUserService.list(parm);
        //密碼處理
        list.getRecords().stream().forEach(item ->{
            item.setPassword("");
        });
        return ResultUtils.success("查詢成功",list);
    }

    //查詢身份名單
    @Auth
    @GetMapping("/getRoleList")
    public ResultVo getRoleList(){
        List<SysReader.SysRole> list = sysRoleService.list();
        return ResultUtils.success("查詢成功",list);
    }

    //根據用戶id查詢身份
    @Auth
    @GetMapping("/getRoleId")
    public ResultVo getRoleId(Long userId){
        QueryWrapper<UserRole> query = new QueryWrapper<>();
        query.lambda().eq(UserRole::getUserId, userId);
        UserRole one = userRoleService.getOne(query);
        return ResultUtils.success("查詢成功",one);
    }

    @Auth
    @PostMapping("/updatePassword")
    public ResultVo updatePassword(@RequestBody UpdatePasswordParm parm, HttpServletRequest request){
        //獲取token
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        Object userType = claims.get("userType");
        //原密碼
        String old = DigestUtils.md5DigestAsHex(parm.getOldPassword().getBytes());
        if(userType.equals("0")){ //0 ：讀者
            SysReader reader = sysReaderService.getById(parm.getUserId());
            //密碼對比
            if(!old.equals(reader.getPassword())){
                return ResultUtils.error("原密碼錯誤!");
            }
            SysReader sysReader = new SysReader();
            sysReader.setPassword(DigestUtils.md5DigestAsHex(parm.getPassword().getBytes()));
            sysReader.setReaderId(parm.getUserId());
            boolean b = sysReaderService.updateById(sysReader);
            if(b){
                return ResultUtils.success("密碼修改成功!");
            }
        }else{ // 管理員
            SysUser user = sysUserService.getById(parm.getUserId());
            if(!user.getPassword().equals(old)){
                 return ResultUtils.error("原密碼錯誤!");
            }
            SysUser sysReader = new SysUser();
            sysReader.setPassword(DigestUtils.md5DigestAsHex(parm.getPassword().getBytes()));
            sysReader.setUserId(parm.getUserId());
            boolean b = sysUserService.updateById(sysReader);
            if(b){
                return ResultUtils.success("密碼修改成功!");
            }
        }
        return ResultUtils.error("密碼修改失敗!");
    }


     //重置密碼
     @Auth
     @PostMapping("/resetPassword")
     public ResultVo resetPassword(@RequestBody SysUser sysUser, HttpServletRequest request){
         String token = request.getHeader("token");
         Claims claims = jwtUtils.getClaimsFromToken(token);
         if (claims == null) {
             return ResultUtils.error("token驗證失敗!");
         }
         String userType = (String) claims.get("userType");
         if (!"1".equals(userType)) {
             return ResultUtils.error("無權限操作!");
         }
         String password = "123456";
         sysUser.setPassword(DigestUtils.md5DigestAsHex(password.getBytes()));
         boolean b = sysUserService.updateById(sysUser);
         if(b){
             return ResultUtils.success("重置密碼成功 !");
         }
         return ResultUtils.error("重置密碼失敗!");
     }
}


