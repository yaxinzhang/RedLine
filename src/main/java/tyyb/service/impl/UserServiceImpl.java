package tyyb.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import tyyb.dao.UserDao;
import tyyb.entity.User;
import tyyb.service.UserService;
@Service
public class UserServiceImpl implements UserService {
        @Resource
         UserDao userDao;

        @Override
        public void addUser(User user) {
                 userDao.addUser(user);
        }
        /*
         * 注册查询
         */
        @Override
        public List<User> findUserByName(String name) {
                return userDao.findUserByName(name);
        }
			
		@Override
		public User login(User user1) {
			
			return userDao.login(user1);
		}
		
}
