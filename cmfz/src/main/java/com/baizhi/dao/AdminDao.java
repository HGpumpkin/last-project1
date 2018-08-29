package com.baizhi.dao;

import com.baizhi.entity.Admin;
import org.apache.ibatis.annotations.Param;
/**
 * Created by Administrator on 2018/8/28.
 */
public interface AdminDao {
    // 查一个
    public Admin queryOne(@Param("username") String username, @Param("password") String password);
}
