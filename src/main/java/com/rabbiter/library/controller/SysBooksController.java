package com.rabbiter.library.controller;

        import com.baomidou.mybatisplus.core.metadata.IPage;
        import com.rabbiter.library.annotation.Auth;
        import com.rabbiter.library.dto.ExceptionParm;
        import com.rabbiter.library.jwt.JwtUtils;
        import com.rabbiter.library.utils.ResultUtils;
        import com.rabbiter.library.utils.ResultVo;
        import com.rabbiter.library.dto.BookVo;
        import com.rabbiter.library.entity.SysBooks;
        import com.rabbiter.library.service.SysBooksService;
        import io.jsonwebtoken.Claims;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.web.bind.annotation.*;

        import javax.servlet.http.HttpServletRequest;
        import java.util.List;

@RestController
@RequestMapping("/api/books")
public class SysBooksController {
    @Autowired
    private SysBooksService sysBooksService;

    @Autowired
    private JwtUtils jwtUtils;

    //新增
    @Auth
    @PostMapping
    public ResultVo add(@RequestBody SysBooks books, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        boolean save = sysBooksService.save(books);
        if(save){
            return ResultUtils.success("新增成功");
        }
        return ResultUtils.error("新增失敗");
    }

    //編輯
    @Auth
    @PutMapping
    public ResultVo edit(@RequestBody SysBooks books, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        boolean save = sysBooksService.updateById(books);
        if(save){
            return ResultUtils.success("編輯成功");
        }
        return ResultUtils.error("編輯失敗");
    }

    //刪除
    @Auth
    @DeleteMapping("/{bookId}")
    public ResultVo delete(@PathVariable("bookId") Long bookId, HttpServletRequest request){
        String token = request.getHeader("token");
        Claims claims = jwtUtils.getClaimsFromToken(token);
        if (claims == null) {
            return ResultUtils.error("token驗證失敗!");
        }
        String userType = (String) claims.get("userType");
        if (!"1".equals(userType)) {
            return ResultUtils.error("無權限操作!");
        }
        boolean remove = sysBooksService.removeById(bookId);
        if(remove){
            return ResultUtils.success("刪除成功");
        }
        return ResultUtils.error("刪除失敗");
    }

    //名單
    @Auth
    @GetMapping("/list")
    public ResultVo getList(ExceptionParm.ListParm parm){
        IPage<SysBooks> list = sysBooksService.getList(parm);
        return ResultUtils.success("查詢成功",list);
    }

    //熱門書籍
    @Auth
    @GetMapping("/getHotBook")
    public ResultVo getHotBook(){
        List<BookVo> hotBook = sysBooksService.getHotBook();
        return ResultUtils.success("查詢成功",hotBook);
    }
}