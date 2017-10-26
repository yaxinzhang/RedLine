package tyyb.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import tyyb.dao.BlogDao;
import tyyb.entity.Blog;
import tyyb.entity.Page;
import tyyb.service.BlogService;
@Service
public class BlogServiceImpl implements BlogService {
        @Resource
        BlogDao blogDao;

        @Override
        public List<Blog> getBlogByUserId(int userId,Page page) {
                
                int pageLimit = (page.getPageNum()-1)*page.getPageCount();
                
                Map<String,Integer> map = new HashMap<>();
               map.put("userId", userId);
               map.put("pageLimit",pageLimit );
               map.put("pageCount",page.getPageCount());
               int a = blogDao.getBlogIdCount(userId);
               
               map.put("pagesum",a);
               
               
                return blogDao.getBlogByUserId(map);
        }

        @Override
        public void addBlog(Blog blog) {
                blogDao.addBlog(blog);
        }

        @Override
        public void delBlog(int id) {
                blogDao.delBlog(id);
        }

        @Override
        public void updateBlog(Blog blog) {
                // TODO Auto-generated method stub
                blogDao.updateBlog(blog);
        }

        @Override
        public Blog getBlogByBlogId(int id) {
                return blogDao.getBlogByBlogId(id);
        }

        @Override
        public List<Blog> getBlogByUserId(int userId) {
                // TODO Auto-generated method stub
                return blogDao.getBlogByUserId(userId);
        }

        @Override
        public int getBlogIdCount(int userId) {
                // TODO Auto-generated method stub
                return blogDao.getBlogIdCount(userId);
        }

      

}
