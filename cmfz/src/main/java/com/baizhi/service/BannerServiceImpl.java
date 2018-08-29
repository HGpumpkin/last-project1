package com.baizhi.service;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;
import com.baizhi.entity.BannerDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2018/8/29.
 */
@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerDao bannerDao;

     @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
     //添加轮播图
    @Override
    public void add(Banner banner) {
        bannerDao.insert(banner);
    }

    @Override
    public void remove(Integer id) {
        bannerDao.delete(id);
    }

    @Override
    public void modify(Banner banner) {
        bannerDao.update(banner);
    }

    @Override
    public BannerDto getBanner(Integer page, Integer rows) {
        BannerDto bannerDto = new BannerDto();
        List<Banner> list = bannerDao.select((page - 1) * rows, rows);
        bannerDto.setRows(list);
        bannerDto.setTotal(bannerDao.selectCount());
        return bannerDto;
    }
}
