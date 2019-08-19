package com.lishan.gjq.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lishan.gjq.photo.Photo;

public interface UserDao {
	void reg(User user);
	User findByUserName(String username);
	/*@Param注解单一属性，可以将参数映射为@Param里面的属性，然后传到
	 * mapper文件里面的SQL语句中，在使用该注解时，sql语句中使用#{}和${}
	 * 都可以，但是如果不使用该注解，就只能使用#{}，不然会报错
	 * 不使用@Param注解时，参数只能有一个，并且是javaBean
	 * 在SQL语句中可以引用javaBean的属性，而且只能引用JavaBean的属性
	 */
	User login(@Param("username")String username,@Param("password")String password);
	void emailActive(String username);//用于邮箱激活
	int findStat(String username);//查看用户的状态
	User findByEmail(String email);//根据邮箱来查找用户
	void updatePassword(@Param("password")String password,@Param("username")String username);
	User findUserById(int id);
	String findPassword(String username);
	void updateUser(User user);
	Integer insertUserPhoto(User user);
	Integer insertPhoto(Photo photo);
	List<Photo> findPhoto(int uid);
	void addAddress(Addres addres);
	Addres findAddressByUid(Addres addres);
	List<Addres> findAddressOrderByTime(int uid);
	void deleteAddress(int id);
	List<Addres> findAllAddress(int uid);
	User findByPhone(String phone);
}
