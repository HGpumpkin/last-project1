package com.baizhi.dao;

import com.baizhi.entity.Menu;

import java.util.List;

/**
 * Created by Administrator on 2018/8/29.
 */
public interface MenuDao {
    //查询主菜单
    public List<Menu> select();

    //查询子菜单
    public List<Menu> selectTwo(Integer id);
}
