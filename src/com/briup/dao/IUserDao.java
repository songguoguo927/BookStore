package com.briup.dao;

import com.briup.bean.User;

public interface IUserDao {
	/*
	 * 保存用户对象
	 */
	public void saveUser(User user);
	/*
	 * 基于名字查找对象
	 */
	public User findUserByName(String name);
	/*
	 * 修改用户
	 */
	public void updateUser(User user);
}




