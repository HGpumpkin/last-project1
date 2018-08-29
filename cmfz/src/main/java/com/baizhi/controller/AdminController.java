package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import com.baizhi.util.SecurityCode;
import com.baizhi.util.SecurityImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.OutputStream;

/**
 * Created by Administrator on 2018/8/28.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/queryOne")
    public String queryOne(String username, String password, HttpSession session, String enCode) {
        Admin admin = adminService.queryOne(username, password);
        String serverCode = (String) session.getAttribute("serverCode");
        System.out.println(admin);
        if (serverCode.equals(enCode)) {

            if (admin != null) {
                session.setAttribute("admin", admin);
                return "redirect:/main/main.jsp";
            } else {
                return "redirect:/error.jsp";
            }
        } else {
            return "redirect:/error.jsp";
        }
    }

    @RequestMapping("/code")
    public void createCaptcha(HttpServletResponse response, HttpSession session) throws Exception {

        //1.获取验证码随机数
        String securityCode = SecurityCode.getSecurityCode();
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" + securityCode);
        // 将验证码随机数保存到session中

        session.setAttribute("serverCode", securityCode);
        //2.生成验证码图片
        BufferedImage image = SecurityImage.createImage(securityCode);
        //3.响应到客户端
        OutputStream out = response.getOutputStream();
        // 参数一 ： 验证码图片对象
        // 参数二： 响应内容的格式
        // 参数三：输出字节流
        ImageIO.write(image, "png", out);
    }
    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.removeAttribute("Admin.name");
        return "login";
    }
}
