package tyyb.dao;

import java.util.List;
import tyyb.entity.User;

public interface UserDao {
	public List<User> findUserByName(String name);



	public void addUser(User user);
	

	public User login(User user1);

}
