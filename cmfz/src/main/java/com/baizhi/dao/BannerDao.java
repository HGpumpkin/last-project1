package com.baizhi.dao;

import com.baizhi.entity.Banner;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/8/29.
 */
public interface BannerDao {
    //增加
    public void insert(Banner banner);
    //删除
    public void delete(Integer id);
    //修改
    public void update(Banner banner);
    //查询
    public List<Banner> select(@Param("page") Integer page,@Param("rows") Integer rows);
    //查询总行数
    public Integer selectCount();
}
