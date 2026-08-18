package com.rabbiter.library.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rabbiter.library.entity.ReaderRole;
import com.rabbiter.library.mapper.ReaderRoleMapper;
import com.rabbiter.library.service.ReaderRoleService;
import org.springframework.stereotype.Service;

@Service
public class ReaderRoleServiceImpl extends ServiceImpl<ReaderRoleMapper, ReaderRole> implements ReaderRoleService {
}
