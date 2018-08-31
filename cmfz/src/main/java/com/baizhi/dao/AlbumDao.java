package com.baizhi.dao;

import com.baizhi.entity.Album;

import java.util.List;

/**
 * Created by Administrator on 2018/8/30.
 */
public interface AlbumDao {
    //增加专辑
    public void insert(Album album);
    //删除专辑
    public void delete(String id);
    //查询专辑
    public List<Album> select();
    //查询专辑详情
    public Album selectOne(String id);

}
