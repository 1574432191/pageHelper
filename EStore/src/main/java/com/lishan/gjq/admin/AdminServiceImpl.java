package com.lishan.gjq.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lishan.gjq.admin.AdminService;
import com.lishan.gjq.util.Result;
@Service("aService")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao adminDao;
	public Result findByUsername(String username,String password) {
		Result result = new Result();
		Admin admin = adminDao.findByUsername(username);
		System.out.println(admin);
		if (admin==null) {
			result.setData(0);
			result.setMsg("用户不存在");
			return result;
		}
		if (!admin.getPassword().equals(password)) {
			result.setData(1);
			result.setMsg("密码错误");
			return result;		
		}else {
			result.setData(2);
			result.setMsg("登录成功");
			return result;
		}
	
	}
	public Admin findAdmin(String username) {
		// TODO Auto-generated method stub
		return adminDao.findByUsername(username);
	}
	public List<Lim> findIndexByid(int id) {
		// TODO Auto-generated method stub
		return adminDao.findIndexByid(id);
	}
	public List<Admin> findEmp() {
		// TODO Auto-generated method stub
		return adminDao.findEmp();
	}
	public List<Admin> findInfo(String username) {
		// TODO Auto-generated method stub
		return adminDao.findInfo(username);
	}
	public void updatePassword(Admin admin) {
		adminDao.updatePassword(admin);
		
	}
	public void addEmps(Admin admin) {
		// TODO Auto-generated method stub
		adminDao.addEmps(admin);
	}
	public void delectEmps(int id) {
		adminDao.delectEmps(id);
		
	}
	public void updateRole(Admin admin) {
		adminDao.updateRole(admin);
		
	}
	
}
