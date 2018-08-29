package com.baizhi.service;

import com.baizhi.entity.Admin;

/**
 * Created by Administrator on 2018/8/28.
 */
public interface AdminService {
    public Admin queryOne(String username, String password);
}
