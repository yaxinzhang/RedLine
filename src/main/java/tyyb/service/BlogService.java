package tyyb.service;

import java.util.List;

import tyyb.entity.Blog;
import tyyb.entity.Page;

public interface BlogService {
        public List<Blog> getBlogByUserId(int userId,Page page);
        public List<Blog> getBlogByUserId(int userId);

        public void addBlog(Blog blog) ;
        public void delBlog(int id) ;
        public void updateBlog(Blog blog);
        public Blog getBlogByBlogId(int id) ;
        public int getBlogIdCount(int userId);
             
}
