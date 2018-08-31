package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.entity.BannerDto;
import com.baizhi.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.UUID;

/**
 * Created by Administrator on 2018/8/29.
 */
@Controller
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;

    //添加
    @RequestMapping("/add")
    @ResponseBody
    public void addBanner(Banner banner) {
        bannerService.add(banner);
    }

    //删除
    @ResponseBody
    @RequestMapping("/delete/{id}")
    public void deleteBanner(@PathVariable("id") int id) {
        bannerService.remove(id);
    }

    //修改
    @RequestMapping("/update")
    public void updateBanner(Banner banner) {
        bannerService.modify(banner);
    }

    //查询
    @ResponseBody
    @RequestMapping("/query")
    public BannerDto queryBanner(Integer page, Integer rows) {
        return bannerService.getBanner(page, rows);
    }

    @RequestMapping("/file")
    public void file(MultipartFile file1, HttpSession session, Banner banner) throws Exception {
        String name = file1.getOriginalFilename();
        String path = session.getServletContext().getRealPath("/");
        File hg = new File(path + "/file");
        if (!hg.exists()) {
            hg.mkdir();
        }
        UUID uuid = UUID.randomUUID();
        String a = uuid.toString() + name;
        File destFile = new File(hg, a);
        file1.transferTo(destFile);
        banner.setImgPath("/file/" + a);
        bannerService.add(banner);
    }
}


