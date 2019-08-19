package com.lishan.gjq.user;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lishan.gjq.photo.Photo;
import com.lishan.gjq.util.DateConversion;
import com.lishan.gjq.util.DateUtil;

@Service(value="uService")
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;


	public User findByUserName(String username) {
		// TODO Auto-generated method stub
		System.out.println(username);
		System.out.println("userService"+userDao.findByUserName(username));
		return userDao.findByUserName(username);
	}

	public User login(String username, String password) {
		return userDao.login(username, password);
	}

	public void reg(String username, String password, String name, String email, Date birthday, String sex,
			String address) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setName(name);
		user.setBirthday(birthday);
		user.setAddress(address);
		user.setEmail(email);
		user.setSex(sex);
		System.out.println("userServicevice"+user);
		userDao.reg(user);
		
	}

	public void emailActive(String username) {
		userDao.emailActive(username);
		
	}

	public int findStat(String username) {
		System.out.println("用户的状态"+userDao.findStat(username));
		return userDao.findStat(username);
	}

	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		return userDao.findByEmail(email);
	}

	public void updatePassword(String password, String username) {
		userDao.updatePassword(password, username);
		
	}

	public User findUserById(int id) {
		// TODO Auto-generated method stub
		return userDao.findUserById(id);
	}

	public String findPassword(String username) {
		// TODO Auto-generated method stub
		return userDao.findPassword(username);
	}

	public void updateUser(User user) {
		userDao.updateUser(user);
		
	}

	public Boolean insertPhotos(int id, String photo) {
		System.out.println("dfdfdfdff"+id+" "+photo);
		User user = new User();
		user.setId(id);
		user.setPhoto(photo);
		Integer result1=userDao.insertUserPhoto(user);
		Photo pho = new Photo();
		DateConversion dateConversion = new DateConversion();
		Date date = new Date(System.currentTimeMillis());	
		pho.setTime(date);
		pho.setPhoto(photo);
		pho.setUid(id);
		System.out.println("dfghjk+"+pho);
		if (result1>0) {
			Integer result2 = userDao.insertPhoto(pho);
			if (result2>0) {
				return true;
			}
		}
		return false;
	}

	public List<Photo> findPhoto(int uid) {
		// TODO Auto-generated method stub
		return userDao.findPhoto(uid);
	}

	public void addAddress(Addres addres) {
		userDao.addAddress(addres);
		
	}

	public Addres findAddressByUid(int uid,String address) {
		// TODO Auto-generated method stub
		Addres addres = new Addres();
		addres.setAddress(address);
		addres.setUid(uid);
		System.out.println("sdfghjkl"+addres);
		return userDao.findAddressByUid(addres);
	}

	public List<Addres> findAddressOrderByTime(int uid) {
		// TODO Auto-generated method stub
		return userDao.findAddressOrderByTime(uid);
	}

	public void deleteAddress(int id) {
		userDao.deleteAddress(id);
		
	}

	public List<Addres> findAllAddress(int uid) {
		// TODO Auto-generated method stub
		return userDao.findAllAddress(uid);
	}

	public User findByPhone(String phone) {
		// TODO Auto-generated method stub
		return userDao.findByPhone(phone);
	}

	

	
	
}
