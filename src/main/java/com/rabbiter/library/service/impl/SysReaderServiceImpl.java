package com.rabbiter.library.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rabbiter.library.exception_advice.BusinessException;
import com.rabbiter.library.dto.ReaderParm;
import com.rabbiter.library.entity.SysReader;
import com.rabbiter.library.mapper.SysReaderMapper;
import com.rabbiter.library.service.SysReaderService;
import com.rabbiter.library.entity.ReaderRole;
import com.rabbiter.library.service.ReaderRoleService;
import com.rabbiter.library.service.SysRoleService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SysReaderServiceImpl extends ServiceImpl<SysReaderMapper, SysReader> implements SysReaderService {
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private ReaderRoleService readerRoleService;

    @Override
    public IPage<SysReader> getList(ReaderParm parm) {
        //構造查詢條件
        QueryWrapper<SysReader> query = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(parm.getPhone())) {
            query.lambda().like(SysReader::getPhone, parm.getPhone());
        }
        if (StringUtils.isNotEmpty(parm.getUsername())) {
            query.lambda().like(SysReader::getUsername, parm.getUsername());
        }
        //構造分頁對象
        IPage<SysReader> page = new Page<>();
        page.setCurrent(parm.getCurrentPage());
        page.setSize(parm.getPageSize());
        return this.baseMapper.selectPage(page, query);
    }

    @Override
    @Transactional
    public void saveReader(SysReader sysReader) {
        QueryWrapper<SysReader.SysRole> query = new QueryWrapper<>();
        query.lambda().eq(SysReader.SysRole::getRoleType, "2");
        SysReader.SysRole one = sysRoleService.getOne(query);
        if (one == null) {
            throw new BusinessException(500, "請先新建會員身份，再建會員!");
        }
        //新增讀者
        this.baseMapper.insert(sysReader);
        //設置會員角色
        ReaderRole readerRole = new ReaderRole();
        readerRole.setReaderId(sysReader.getReaderId());
        readerRole.setRoleId(one.getRoleId());
        readerRoleService.save(readerRole);
    }

    @Override
    @Transactional
    public void editReader(SysReader sysReader) {
         //編輯會員
        this.baseMapper.updateById(sysReader);

        QueryWrapper<SysReader.SysRole> query = new QueryWrapper<>();
        query.lambda().eq(SysReader.SysRole::getRoleType, "2");
        SysReader.SysRole one = sysRoleService.getOne(query);

        //設置會員，先刪除，再設置
        QueryWrapper<ReaderRole> readerRole = new QueryWrapper<>();
        readerRole.lambda().eq(ReaderRole::getReaderId, sysReader.getReaderId());
        //先刪除
        readerRoleService.remove(readerRole);
        //設置會員角色
        ReaderRole saveReaderRole = new ReaderRole();
        saveReaderRole.setReaderId(sysReader.getReaderId());
        saveReaderRole.setRoleId(one.getRoleId());
        readerRoleService.save(saveReaderRole);
    }

    @Override
    public SysReader loadByUsername(String phone) {
        QueryWrapper<SysReader> query = new QueryWrapper<>();
        query.lambda().eq(SysReader::getPhone,phone);
        return this.baseMapper.selectOne(query);
    }
}
