package com.baizhi.service;

import com.baizhi.dao.AlbumDao;
import com.baizhi.dao.ChapterDao;
import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2018/8/30.
 */
@Service
@Transactional
public class AlbumServiceImpl implements AlbumService{
@Autowired
private AlbumDao albumDao;
private ChapterDao chapterDao;
    @Override
    public List<Album> queryAlbum() {
        return albumDao.select();
    }

    @Override
    public void addAlbum(Album album) {
        albumDao.insert(album);
    }

    @Override
    public Album queryOne(String id) {
        return albumDao.selectOne(id);
    }

    @Override
    public void addChapter(Chapter chapter) {
        chapter.setId(UUID.randomUUID().toString());
        chapter.setCreateTime(new Date());
        chapterDao.insert(chapter);
    }

    @Override
    public List<Chapter> queryChapter(String id) {
        return chapterDao.select(id);
    }

    @Override
    public void remove(String id) {
        albumDao.delete(id);
        chapterDao.delete(id);
    }
}
