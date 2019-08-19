package com.lishan.gjq.user;

import java.util.Date;
import java.util.List;

import com.lishan.gjq.photo.Photo;

public interface UserService {
	void reg(String username,String password,String name,String email,Date birthday,String sex,String address );
	User findByUserName(String username);
	User login(String username,String password);
	void emailActive(String username);//用于邮箱激活
	int findStat(String username);//查看用户的状态
	User findByEmail(String email);//根据邮箱来查找用户
	void updatePassword(String password,String username);
	User findUserById(int id);
	String findPassword(String username);
	void updateUser(User user);
	Boolean insertPhotos(int id,String photo);
	List<Photo> findPhoto(int uid);
	void addAddress(Addres addres);
	Addres findAddressByUid(int uid,String address);
	List<Addres> findAddressOrderByTime(int uid);
	void deleteAddress(int id);
	List<Addres> findAllAddress(int uid);
	User findByPhone(String phone);
}
