package com.rabbiter.library.controller;

        import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
        import com.rabbiter.library.annotation.Auth;
        import com.rabbiter.library.jwt.JwtUtils;
        import com.rabbiter.library.utils.ResultUtils;
        import com.rabbiter.library.utils.ResultVo;
        import com.rabbiter.library.dto.LoginParm;
        import com.rabbiter.library.dto.LoginResult;
        import com.rabbiter.library.entity.UserInfo;
        import com.rabbiter.library.utils.MakeTree;
        import com.rabbiter.library.dto.RouterVO;
        import com.rabbiter.library.entity.SysMenu;
        import com.rabbiter.library.service.SysMenuService;
        import com.rabbiter.library.entity.SysReader;
        import com.rabbiter.library.service.SysReaderService;
        import com.rabbiter.library.entity.SysUser;
        import com.rabbiter.library.service.SysUserService;
        import io.jsonwebtoken.Claims;
        import org.apache.commons.lang.StringUtils;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.util.DigestUtils;
        import org.springframework.web.bind.annotation.*;

        import javax.servlet.http.HttpServletRequest;
        import java.util.List;
        import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/system")
public class LoginController {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysReaderService sysReaderService;
    @Autowired
    private JwtUtils jwtUtils;
    @Autowired
    private SysMenuService sysMenuService;

    //用戶登入
    @PostMapping("/login")
    public ResultVo login(@RequestBody LoginParm loginParm) {
        if (StringUtils.isEmpty(loginParm.getUsername()) || StringUtils.isEmpty(loginParm.getPassword()) || StringUtils.isEmpty(loginParm.getUserType())) {
            return ResultUtils.error("帳戶名、密碼或帳戶類型不能為空!");
        }
        try {
            //判斷是會員還是管理員
            if (loginParm.getUserType().equals("0")) { // 0:讀者
                //根據會員的電話和密碼查詢
                QueryWrapper<SysReader> query = new QueryWrapper<>();
                query.lambda().eq(SysReader::getPhone, loginParm.getUsername())
                        .eq(SysReader::getPassword, DigestUtils.md5DigestAsHex(loginParm.getPassword().getBytes()));
                SysReader one = sysReaderService.getOne(query);
                if (one == null) {
                    return ResultUtils.error("帳戶名或密碼錯誤!");
                }
                if ("0".equals(one.getUserStatus())) {
                    return ResultUtils.error("會員帳戶未啟用，請聯繫管理員審核!");
                }
                //返回數據給前端
                LoginResult result = new LoginResult();
                result.setToken(jwtUtils.generateToken(one.getPhone(), loginParm.getUserType()));
                result.setUserId(one.getReaderId());
                return ResultUtils.success("登入成功", result);
            } else if (loginParm.getUserType().equals("1")) { //管理員
                //根據管理員的帳戶名和密碼查詢
                QueryWrapper<SysUser> query = new QueryWrapper<>();
                query.lambda().eq(SysUser::getUsername, loginParm.getUsername())
                        .eq(SysUser::getPassword, DigestUtils.md5DigestAsHex(loginParm.getPassword().getBytes()));
                SysUser one = sysUserService.getOne(query);
                if (one == null) {
                    return ResultUtils.error("帳戶名或密碼錯誤!");
                }
                //返回數據給前端
                LoginResult result = new LoginResult();
                result.setToken(jwtUtils.generateToken(one.getUsername(), loginParm.getUserType()));
                result.setUserId(one.getUserId());
                return ResultUtils.success("登入成功", result);
            } else {
                return ResultUtils.error("帳戶類型不存在!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    //獲取用戶權限字段
    @Auth
    @GetMapping("/getInfo")
    public ResultVo getInfo(HttpServletRequest request) {
        String token = request.getHeader("token");
        if (StringUtils.isEmpty(token)) {
            return ResultUtils.success("token過期!", 600);
        }
        Claims claims = jwtUtils.getClaimsFromToken(token);
        Object userType = claims.get("userType");
        String username = jwtUtils.getUsernameFromToken(token); //由token攞返身份,唔再信前端
        UserInfo userInfo = new UserInfo();
        if (userType.equals("0")) { //讀者
            SysReader reader = sysReaderService.loadByUsername(username);
            if (reader == null) {
                return ResultUtils.error("登入信息過期");
            }
            userInfo.setAvatar("/static/images/default_avatar.png");
            List<SysMenu> menuList = sysMenuService.getReaderMenuByUserId(reader.getReaderId());
            List<String> collect = menuList.stream().filter(item -> item != null && item.getCode() != null).map(item -> item.getCode()).collect(Collectors.toList());
            if (collect.size() == 0) {
                return ResultUtils.error("暫無登入權限，請聯繫管理員!");
            }
            String[] strings = collect.toArray(new String[collect.size()]);
            userInfo.setRoles(strings);
            return ResultUtils.success("查詢成功", userInfo);
        } else if (userType.equals("1")) { //管理員
            SysUser user = sysUserService.loadByUsername(username);
            if (user == null) {
                return ResultUtils.error("登入信息過期");
            }
            userInfo.setIntroduction(user.getNickName());
            userInfo.setName(user.getNickName());
            userInfo.setAvatar("/static/images/default_avatar.png");
            List<SysMenu> menuList = sysMenuService.getMenuByUserId(user.getUserId());
            List<String> collect = menuList.stream().filter(item -> item != null && item.getCode() != null).map(item -> item.getCode()).collect(Collectors.toList());
            if (collect.size() == 0) {
                return ResultUtils.error("暫無登入權限，請聯繫管理員!");
            }
            String[] strings = collect.toArray(new String[collect.size()]);
            userInfo.setRoles(strings);
            return ResultUtils.success("查詢成功", userInfo);
        } else {
            return ResultUtils.error("帳戶類型不存在", userInfo);
        }
    }

    //查詢選單
    @Auth
    @GetMapping("/getMenuList")
    public ResultVo getMenuList(HttpServletRequest request) {
        //獲取token
        String token = request.getHeader("token");
        if (StringUtils.isEmpty(token)) {
            return ResultUtils.success("token過期!", 600);
        }
        //獲取用戶和類別
        String username = jwtUtils.getUsernameFromToken(token);
        //用戶類別
        Claims claims = jwtUtils.getClaimsFromToken(token);
        Object userType = claims.get("userType");
        if (userType.equals("0")) { //讀者
            //獲取會員信息
            SysReader reader = sysReaderService.loadByUsername(username);
            if (reader == null) {
                return ResultUtils.error("登入信息過期");
            }
            //查詢選單信息
            List<SysMenu> menuList = sysMenuService.getReaderMenuByUserId(reader.getReaderId());
            List<SysMenu> collect = menuList.stream().filter(item -> item != null && !item.getType().equals("2")).collect(Collectors.toList());
            if (collect.size() == 0) {
                return ResultUtils.error("暫無登入權限，請聯繫管理員!");
            }
            //組裝路由格式的數據
            List<RouterVO> routerVOS = MakeTree.makeRouter(collect, 0L);
            return ResultUtils.success("查詢成功", routerVOS);
        } else if (userType.equals("1")) { //管理員
            //獲取用戶信息
            SysUser reader = sysUserService.loadByUsername(username);
            if (reader == null) {
                return ResultUtils.error("登入信息過期");
            }
            //查詢選單信息
            List<SysMenu> menuList = sysMenuService.getMenuByUserId(reader.getUserId());
            List<SysMenu> collect = menuList.stream().filter(item -> item != null && !item.getType().equals("2")).collect(Collectors.toList());
            if (collect.size() == 0) {
                return ResultUtils.error("暫無登入權限，請聯繫管理員!");
            }
            //組裝路由格式的數據
            List<RouterVO> routerVOS = MakeTree.makeRouter(collect, 0L);
            return ResultUtils.success("查詢成功", routerVOS);
        } else {
            return ResultUtils.error("用戶類型不存在!");
        }
    }
}
