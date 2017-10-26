package tyyb.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tyyb.entity.Blog;
import tyyb.service.BlogService;
import tyyb.service.UserService;

@Controller
@RequestMapping("/blog")
public class BlogController {
        @Resource
        BlogService blogService;
        @Resource
        UserService userService;
        /*
         * 添加博客
         */
     
        @RequestMapping(value = "/addblog", method = RequestMethod.POST)
        public String addBlog(Blog blog) {

                blogService.addBlog(blog);
                //查询添加完之后的列表
                List<Blog> list = blogService.getBlogByUserId(blog.getUserId());
                
                return "qlshuo";
        }
        @RequestMapping("/qlshuo")
        public String showBlog1(){
                return "qlshuo";
        }
        @RequestMapping("/qlj")
        public String showBlog2(){
                return "qlj";
        }
        @RequestMapping("/photo")
        public String showBlog3(){
                return "photo";
        }
        @RequestMapping("/photo1")
        public String showBlog4(){
                return "photo1";
        }
        @RequestMapping("/home")
        public String showBlog5(){
                return "home";
        }
        @RequestMapping("/labd")
        public String showBlog6(){
                return "labd";
        }
        @RequestMapping("/wo")
        public String showBlog7(){
                return "wo";
        }
}