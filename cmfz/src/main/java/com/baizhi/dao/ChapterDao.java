package com.baizhi.dao;

import com.baizhi.entity.Chapter;

import java.util.List;

/**
 * Created by Administrator on 2018/8/30.
 */
public interface ChapterDao {
    //查询章节
    public List<Chapter> select(String id);
    //添加章节
    public void insert(Chapter chapter);

    //删除章节
    public void delete(String aid);
}
