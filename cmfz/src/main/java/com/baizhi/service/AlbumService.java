package com.baizhi.service;

import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;

import java.util.List;

/**
 * Created by Administrator on 2018/8/30.
 */
public interface AlbumService {
    //查询所有专辑
    public List<Album> queryAlbum();
    //添加专辑
    public void addAlbum(Album album);
    //查询专辑的详细信息
    public Album queryOne(String id);
    //添加章节
    public void addChapter(Chapter chapter);
    //查询章节
    public List<Chapter> queryChapter(String id);
    //删除专辑和章节
    public void remove(String id);
}
