package tyyb.dao;

import java.util.List;
import java.util.Map;

import tyyb.entity.Blog;

public interface BlogDao {
        public List<Blog> getBlogByUserId(int userId);
	public List<Blog> getBlogByUserId(Map map);
        public void addBlog(Blog blog);
        public void delBlog(int id);
        public void updateBlog(Blog blog);
        public Blog getBlogByBlogId(int blog);
        public int getBlogIdCount(int userId);
}
