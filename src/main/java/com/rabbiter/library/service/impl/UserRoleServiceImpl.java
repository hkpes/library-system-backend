package com.rabbiter.library.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rabbiter.library.entity.UserRole;
import com.rabbiter.library.mapper.UserRoleMapper;
import com.rabbiter.library.service.UserRoleService;
import org.springframework.stereotype.Service;

@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements UserRoleService {
}
