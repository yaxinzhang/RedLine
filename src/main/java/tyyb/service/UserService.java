package tyyb.service;

import java.util.List;

import tyyb.entity.User;

public interface UserService {
        /*根据用户名查询*/
        public List<User> findUserByName(String name);
        
      
        /*添加用户*/
        public void addUser(User user);

		public User login(User user1);
		
}
