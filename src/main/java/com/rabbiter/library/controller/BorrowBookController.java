package com.rabbiter.library.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.rabbiter.library.annotation.Auth;
import com.rabbiter.library.dto.*;
import com.rabbiter.library.entity.BorrowBook;
import com.rabbiter.library.entity.SysReader;
import com.rabbiter.library.jwt.JwtUtils;
import com.rabbiter.library.service.SysReaderService;
import com.rabbiter.library.utils.ResultUtils;
import com.rabbiter.library.utils.ResultVo;
import com.rabbiter.library.service.BorrowBookService;
import io.jsonwebtoken.Claims;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/borrow")
public class BorrowBookController {
    @Autowired
    private JwtUtils jwtUtils;
    @Autowired
    private BorrowBookService borrowBookService;
    @Autowired
    private SysReaderService sysReaderService;

    @PostMapping("/applyBook")
    @Auth
    public ResultVo applyBook(@RequestBody BorrowBook borrowBook) {
        borrowBook.setBorrowStatus("1");
        borrowBook.setApplyStatus("1");
        boolean b = borrowBookService.updateById(borrowBook);
        if (b) {
            return ResultUtils.success("審核成功!");
        }
        return ResultUtils.error("審核失敗!");
    }

    @PostMapping("/refuseBook")
    @Auth
    public ResultVo refuseBook(@RequestBody BorrowBook borrowBook) {
        borrowBook.setBorrowStatus("3");
        borrowBook.setApplyStatus("2");
        boolean b = borrowBookService.updateById(borrowBook);
        if (b) {
            return ResultUtils.success("已拒絕此借閱申請!");
        }
        return ResultUtils.error("操作失敗!");
    }

    @PostMapping
    @Auth
    public ResultVo borrow(@RequestBody BorrowParm parm, HttpServletRequest request) {
        String token = request.getHeader("token");
        if (StringUtils.isEmpty(token)) {
            return ResultUtils.error("token過期!", 600);
        }
        Claims claims = jwtUtils.getClaimsFromToken(token);
        String userType = (String) claims.get("userType");
        borrowBookService.borrow(parm, userType);
        return ResultUtils.success("已成功遞交，待審批!");
    }

    //還書記錄
    @Auth
    @GetMapping("/getBorrowList")
    public ResultVo getBorrowList(ExceptionParm.ListParm parm) {
        IPage<ReturnBook> borrowList = borrowBookService.getBorrowList(parm);
        return ResultUtils.success("查詢成功", borrowList);
    }

    //還書
    @Auth
    @PostMapping("/returnBooks")
    public ResultVo returnBooks(@RequestBody List<ReturnParm> parm) {
        borrowBookService.returnBook(parm);
        return ResultUtils.success("還書成功!");
    }

    //異常還書
    @Auth
    @PostMapping("/exceptionBooks")
    public ResultVo exceptionBooks(@RequestBody ExceptionParm parm) {
        borrowBookService.exceptionBook(parm);
        return ResultUtils.success("成功還書!");
    }

    //借閱記錄
    @Auth
    @GetMapping("/getLookBorrowList")
    public ResultVo getLookBorrowList(LookParm parm, HttpServletRequest request) {
        //获取token
        String token = request.getHeader("token");
        if (StringUtils.isEmpty(token)) {
            return ResultUtils.success("token過期!", 600);
        }
        Claims claims = jwtUtils.getClaimsFromToken(token);
        String userType = (String) claims.get("userType");
        IPage<LookBorrow> lookBorrowList = null;
        if (userType.equals("0")) {
            lookBorrowList = borrowBookService.getReaderLookBorrowList(parm);
            return ResultUtils.success("查詢成功", lookBorrowList);
        } else if (userType.equals("1")) {
            lookBorrowList = borrowBookService.getLookBorrowList(parm);
            return ResultUtils.success("查詢成功", lookBorrowList);
        } else {
            return ResultUtils.success("查詢成功", lookBorrowList);
        }
    }

    //借書續期
    @Auth
    @PostMapping("/addTime")
    public ResultVo addTime(@RequestBody BorrowParm parm) {
        BorrowBook borrowBook = new BorrowBook();
        borrowBook.setBorrowId(parm.getBorrowId());
        borrowBook.setReturnTime(parm.getReturnTime());
        boolean b = borrowBookService.updateById(borrowBook);
        if (b) {
            return ResultUtils.success("續期成功!");
        }
        return ResultUtils.error("續期失敗!");
    }

    //借書待審核總數
    @Auth
    @GetMapping("/getBorrowApplyCount")
    public ResultVo getBorrowApplyCount(HttpServletRequest request) {
        String token = request.getHeader("token");
        if (StringUtils.isEmpty(token)) {
            return ResultUtils.error("token過期!", 600);
        }
        Claims claims = jwtUtils.getClaimsFromToken(token);
        String userType = (String) claims.get("userType");

        if (userType.equals("0")) { //讀者
            String phone = jwtUtils.getUsernameFromToken(token);
            SysReader reader = sysReaderService.loadByUsername(phone);
            if (reader == null) {
                return ResultUtils.error("登入信息過期");
            }
            QueryWrapper<BorrowBook> query = new QueryWrapper<>();
            query.lambda().eq(BorrowBook::getApplyStatus, "0")
                    .eq(BorrowBook::getReaderId, reader.getReaderId());
            int count = borrowBookService.count(query);
            return ResultUtils.success("查詢成功", count);
        } else if (userType.equals("1")) { //管理員
            QueryWrapper<BorrowBook> query = new QueryWrapper<>();
            query.lambda().eq(BorrowBook::getApplyStatus, "0");
            int count = borrowBookService.count(query);
            return ResultUtils.success("查詢成功", count);
        } else {
            return ResultUtils.success("查詢成功", 0);
        }
    }

    //到期待還
    @Auth
    @GetMapping("/getBorrowReturnCount")
    public ResultVo getBorrowReturnCount(HttpServletRequest request) {
        String token = request.getHeader("token");
        if (StringUtils.isEmpty(token)) {
            return ResultUtils.error("token過期!", 600);
        }
        Claims claims = jwtUtils.getClaimsFromToken(token);
        String userType = (String) claims.get("userType");

        if (userType.equals("0")) { //讀者
            String phone = jwtUtils.getUsernameFromToken(token);
            SysReader reader = sysReaderService.loadByUsername(phone);
            if (reader == null) {
                return ResultUtils.error("登入信息過期");
            }
            QueryWrapper<BorrowBook> query = new QueryWrapper<>();
            query.lambda().eq(BorrowBook::getBorrowStatus, "1")
                    .lt(BorrowBook::getReturnTime, new Date())
                    .eq(BorrowBook::getReaderId, reader.getReaderId());
            int count = borrowBookService.count(query);
            return ResultUtils.success("查詢成功", count);
        } else if (userType.equals("1")) { //管理員
            QueryWrapper<BorrowBook> query = new QueryWrapper<>();
            query.lambda().eq(BorrowBook::getBorrowStatus, "1")
                    .lt(BorrowBook::getReturnTime, new Date());
            int count = borrowBookService.count(query);
            return ResultUtils.success("查詢成功", count);
        } else {
            return ResultUtils.success("查詢成功", 0);
        }
    }
}






