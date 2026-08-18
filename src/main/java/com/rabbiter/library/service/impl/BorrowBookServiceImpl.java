package com.rabbiter.library.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rabbiter.library.exception_advice.BusinessException;
import com.rabbiter.library.exception_advice.BusinessExceptionEnum;
import com.rabbiter.library.mapper.BorrowBookMapper;
import com.rabbiter.library.service.BorrowBookService;
import com.rabbiter.library.entity.SysBooks;
import com.rabbiter.library.service.SysBooksService;
import com.rabbiter.library.dto.*;
import com.rabbiter.library.entity.BorrowBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.stream.Collectors;

@Service
public class BorrowBookServiceImpl extends ServiceImpl<BorrowBookMapper, BorrowBook> implements BorrowBookService {

    @Autowired
    private SysBooksService sysBooksService;

    private Lock lock = new ReentrantLock();

    @Override
    @Transactional
    public void borrow(BorrowParm parm, String userType) {
        //加鎖
        lock.lock();
        try {
            //構造查詢條件
            QueryWrapper<SysBooks> query = new QueryWrapper<>();
            query.lambda().in(SysBooks::getBookId, parm.getBookIds());
            List<SysBooks> list = sysBooksService.list(query);
            //記錄庫存是否充足
            List<SysBooks> collect = list.stream().filter(item -> item.getBookStore().longValue() < 1L).collect(Collectors.toList());
            if (collect.size() > 0) {
                //提示哪本圖書庫存不足
                List<String> stringList = collect.stream().map(SysBooks::getBookName).collect(Collectors.toList());
                throw new BusinessException(BusinessExceptionEnum.NO_STOCK.getCode(),
                        stringList + BusinessExceptionEnum.NO_STOCK.getMessage());
            }
            //減庫存 插入借書明細
            List<Long> bookIds = parm.getBookIds();
            for (int i = 0; i < bookIds.size(); i++) {
                Long bookId = bookIds.get(i);
                //減庫存
                int res = sysBooksService.subBook(bookId);
                if (res > 0) {
                    BorrowBook borrowBook = new BorrowBook();
                    borrowBook.setBookId(bookId);
                    borrowBook.setReaderId(parm.getReaderId());
                    borrowBook.setReturnTime(parm.getReturnTime());
                    if (userType.equals("0")) { // 0讀者
                        borrowBook.setApplyStatus("0");
                        borrowBook.setBorrowStatus("0");
                    } else if (userType.equals("1")) { // 1 管理員
                        borrowBook.setApplyStatus("1");
                        borrowBook.setBorrowStatus("1");
                    } else {
                        throw new BusinessException(500, "用戶類型不存在，無法借書!");
                    }
                    borrowBook.setBorrowTime(new Date());
                    //插入明細
                    this.baseMapper.insert(borrowBook);
                }
            }

        } finally {
            //釋放鎖
            lock.unlock();
        }
    }

    @Override
    public IPage<ReturnBook> getBorrowList(ExceptionParm.ListParm parm) {
        //構造分頁對象
        Page<ReturnBook> page = new Page<>();
        page.setCurrent(parm.getCurrentPage());
        page.setSize(parm.getPageSize());
        return this.baseMapper.getBorrowList(page, parm);
    }

    @Override
    @Transactional
    public void returnBook(List<ReturnParm> list) {
        //加庫存 變更借書狀態
        for (int i = 0; i < list.size(); i++) {
            //加庫存
            int res = sysBooksService.addBook(list.get(i).getBookId());
            if (res > 0) {
                //變更借書狀態
                BorrowBook borrowBook = new BorrowBook();
                borrowBook.setBorrowId(list.get(i).getBorrowId());
                borrowBook.setBorrowStatus("2"); //已還
                borrowBook.setReturnStatus("1"); //正常還書
                this.baseMapper.updateById(borrowBook);
            }
        }

    }

    @Override
    public void exceptionBook(ExceptionParm parm) {
        // 0：異常 破損 1：丟失 不能還庫存
        String type = parm.getType();
        if (type.equals("0")) {
            //加庫存
            int res = sysBooksService.addBook(parm.getBookId());
            if (res > 0) {
                //變更借書狀態
                BorrowBook borrowBook = new BorrowBook();
                borrowBook.setBorrowId(parm.getBorrowId());
                borrowBook.setBorrowStatus("2"); //已還
                borrowBook.setReturnStatus("2"); //異常還書
                borrowBook.setExcepionText(parm.getExcepionText());
                this.baseMapper.updateById(borrowBook);
            }
        } else { //丢失
            //變更借書狀態
            BorrowBook borrowBook = new BorrowBook();
            borrowBook.setBorrowId(parm.getBorrowId());
            borrowBook.setBorrowStatus("2"); //已還
            borrowBook.setReturnStatus("3"); //丢失
            borrowBook.setExcepionText(parm.getExcepionText());
            this.baseMapper.updateById(borrowBook);
        }
    }

    @Override
    public IPage<LookBorrow> getLookBorrowList(LookParm parm) {
        //構造分頁對象
        Page<LookBorrow> page = new Page<>();
        page.setCurrent(parm.getCurrentPage());
        page.setSize(parm.getPageSize());
        return this.baseMapper.getLookBorrowList(page, parm);
    }

    @Override
    public IPage<LookBorrow> getReaderLookBorrowList(LookParm parm) {
        //構造分頁對象
        Page<LookBorrow> page = new Page<>();
        page.setCurrent(parm.getCurrentPage());
        page.setSize(parm.getPageSize());
        return this.baseMapper.getReaderLookBorrowList(page,parm);
    }
}
