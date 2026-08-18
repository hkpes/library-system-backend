package com.rabbiter.library.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rabbiter.library.dto.ExceptionParm;
import com.rabbiter.library.dto.LookBorrow;
import com.rabbiter.library.dto.LookParm;
import com.rabbiter.library.dto.ReturnBook;

import com.rabbiter.library.entity.BorrowBook;
import org.apache.ibatis.annotations.Param;

public interface BorrowBookMapper extends BaseMapper<BorrowBook> {
    IPage<ReturnBook> getBorrowList(Page<ReturnBook> page, @Param("parm") ExceptionParm.ListParm parm);
    //管理員借閱記錄名單
    IPage<LookBorrow> getLookBorrowList(Page<LookBorrow> page, @Param("parm") LookParm parm);
    //讀者借閱記錄名單
    IPage<LookBorrow> getReaderLookBorrowList(Page<LookBorrow> page, @Param("parm") LookParm parm);
}
