package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import com.baizhi.service.AlbumService;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by wph on 2018/7/6.
 */

@Controller
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    private AlbumService albumService;
    //查询所有专辑
    @ResponseBody
    @RequestMapping("/queryAll")
    public List<Album> queryAll(){
        return albumService.queryAlbum();
    }
   //查询专辑详细信息
    @RequestMapping("/queryOne")
    @ResponseBody
    public Album queryOne(String id){
        return albumService.queryOne(id);
    }
    //章节
    @RequestMapping("/queryChapter")
    @ResponseBody
    public List<Chapter> queryChapter(String id){
        return albumService.queryChapter(id);
    }
    //添加专辑
    @RequestMapping("/addOne")
    @ResponseBody
    public void file1(MultipartFile file1, HttpSession session, Album album) throws Exception {
        String name=file1.getOriginalFilename();
        String path=session.getServletContext().getRealPath("/");
        File wepfi=new File(path+"/file");
        if(!wepfi.exists()){
            wepfi.mkdir();
        }
        UUID uuid=UUID.randomUUID();
        String a=uuid.toString()+name;
        File destFile = new File(wepfi,a);
        file1.transferTo(destFile);
        album.setImg(a);
        album.setId(UUID.randomUUID().toString());
        album.setCreateTime(new Date());
        albumService.addAlbum(album);
    }
    //添加章节
    @RequestMapping("/addChapter")
    @ResponseBody
    public void file2(MultipartFile file1, HttpSession session, Chapter chapter) throws Exception {
        String name=file1.getOriginalFilename();
        String path=session.getServletContext().getRealPath("/");
        File wepfi=new File(path+"/file");
        if(!wepfi.exists()){
            wepfi.mkdir();
        }
        UUID uuid=UUID.randomUUID();
        String a=uuid.toString()+name;
        File destFile = new File(wepfi,a);
        file1.transferTo(destFile);
        chapter.setUrl(a);
        albumService.addChapter(chapter);
    }
    //下载章节
    @RequestMapping("/loadChapter")
    @ResponseBody
    public void filedownload(String fname,HttpSession session,HttpServletResponse response) throws IOException {
        System.out.println(fname);
        byte[] bs = FileUtils.readFileToByteArray(new File("E://source//last-project//cmfz//src//main//webapp//file//"+fname));

        //response.setContentType("text/plain");
        response.setHeader("content-disposition", "attachment;filename="+URLEncoder.encode(fname, "utf-8"));
        // 输出流
        ServletOutputStream out = response.getOutputStream();
        out.write(bs);
        System.out.println(213);
    }
    @RequestMapping("/remove")
    @ResponseBody
    public void remove(String id){
        albumService.remove(id);
    }
}
