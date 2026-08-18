package com.rabbiter.library.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;


import com.rabbiter.library.dto.*;
import com.rabbiter.library.entity.BorrowBook;


import java.util.List;


public interface BorrowBookService extends IService<BorrowBook> {
    //借書
    void borrow(BorrowParm parm, String userType);
    //還書名單
    IPage<ReturnBook> getBorrowList(ExceptionParm.ListParm parm);
    //還書
    void returnBook(List<ReturnParm> list);
    //異常還書
    void exceptionBook(ExceptionParm parm);
    //借閱記錄名單
    IPage<LookBorrow> getLookBorrowList(LookParm parm);
     //讀者借閱記錄名單
    IPage<LookBorrow> getReaderLookBorrowList(LookParm parm);
}
