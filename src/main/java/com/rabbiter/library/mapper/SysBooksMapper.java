package com.rabbiter.library.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rabbiter.library.dto.BookVo;
import com.rabbiter.library.dto.ExceptionParm;
import com.rabbiter.library.entity.SysBooks;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysBooksMapper extends BaseMapper<SysBooks> {
    IPage<SysBooks> getList(Page<SysBooks> page,@Param("parm") ExceptionParm.ListParm parm);
    int subBook(@Param("bookId") Long bookId);
    int addBook(@Param("bookId") Long bookId);
    List<BookVo> getHotBook();
}
