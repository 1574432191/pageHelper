package com.lishan.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.lishan.mapper.UserMapper;
import com.lishan.pojo.User;
import com.lishan.service.UserService;
@Service("uService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public List<User> getUserList() {
		// TODO Auto-generated method stub
		return userMapper.getUserList();
	}

}
