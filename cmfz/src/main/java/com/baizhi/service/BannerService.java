package com.baizhi.service;

import com.baizhi.entity.Banner;
import com.baizhi.entity.BannerDto;

import java.util.List;

/**
 * Created by Administrator on 2018/8/29.
 */
public interface BannerService {
    //增删改查
    public void add(Banner banner);
    public void remove(Integer id);
    public void modify(Banner banner);
    public BannerDto getBanner(Integer page,Integer rows);
}
