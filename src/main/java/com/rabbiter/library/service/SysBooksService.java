package com.rabbiter.library.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.rabbiter.library.dto.BookVo;
import com.rabbiter.library.dto.ExceptionParm;
import com.rabbiter.library.entity.SysBooks;

import java.util.List;

public interface SysBooksService extends IService<SysBooks> {
    IPage<SysBooks> getList(ExceptionParm.ListParm parm);
    //減庫存
    int subBook(Long bookId);
    //加庫存
    int addBook(Long bookId);
     List<BookVo> getHotBook();
}
