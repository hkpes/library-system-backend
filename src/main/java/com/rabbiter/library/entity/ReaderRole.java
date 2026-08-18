package com.rabbiter.library.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
@TableName("sys_reader_role")
public class ReaderRole {
    @TableId(type = IdType.AUTO)
    private Long readerRoleId;
    private Long readerId;
    private Long roleId;

    @Override
    public String toString() {
        return "ReaderRole{" +
                "readerRoleId=" + readerRoleId +
                ", readerId=" + readerId +
                ", roleId=" + roleId +
                '}';
    }

    public Long getReaderRoleId() {
        return readerRoleId;
    }

    public void setReaderRoleId(Long readerRoleId) {
        this.readerRoleId = readerRoleId;
    }

    public Long getReaderId() {
        return readerId;
    }

    public void setReaderId(Long readerId) {
        this.readerId = readerId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public ReaderRole() {
    }

    public ReaderRole(Long readerRoleId, Long readerId, Long roleId) {
        this.readerRoleId = readerRoleId;
        this.readerId = readerId;
        this.roleId = roleId;
    }
}
