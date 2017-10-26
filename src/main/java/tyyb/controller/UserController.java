package tyyb.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tyyb.entity.User;
import tyyb.service.BlogService;
import tyyb.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
    
        
        @Resource
        UserService userService;
        @Resource
        BlogService blogService;
        /**
         * 跳转到登录界面
         * @return
         */
        
        @RequestMapping("/show")
        public String show(){
                return "login";
        }
        
       /**
        * 用户登录方法
        * 登录成功进入home界面
        * 失败到login界面
        */
        @RequestMapping("/login")
    	public String loginAction(User user1,HttpSession session){
    		User user = userService.login(user1);
    		if(user == null){
    			return "login";
    		}else{
    			session.setAttribute("user",user);
    			return "home";
    		}
    	}
        /*
         * 注册
         */
        @RequestMapping("/register1")
        public String show2(){
                return "register";
        }
        @RequestMapping("/register")
        public String register (User user,HttpServletRequest request, HttpServletResponse response){
                String name = request.getParameter("name");
                List<User> list =  userService.findUserByName(name);
                if(list.size()==0){
                userService.addUser(user);
                }else{
                request.setAttribute("msg", "用户已存在");
                }
                return "login";
        }
        /*
         * 3D相册界面
         */
        @RequestMapping("/photo2")
        public String show3(){
                return "/photo2";
        }
        /*
         * 游戏玩一玩
         */
        @RequestMapping("/game4")
        public String show4(){
                return "/game4";
        }
        /*
         * 整屏滚动效果
         */
        @RequestMapping("/gundong1")
        public String show5(){
                return "/gundong1";
        }
        /*
         * 点击表情事件
         */
        @RequestMapping("/game3")
        public String show6(){
                return "/game3";
        }
}
        
        

