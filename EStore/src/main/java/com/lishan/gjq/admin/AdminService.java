package com.lishan.gjq.admin;

import java.util.List;

import com.lishan.gjq.util.*;

public interface AdminService {
	Result findByUsername(String username,String password);
	Admin findAdmin(String username);
	List<Lim> findIndexByid(int id);
	List<Admin> findEmp();
	List<Admin> findInfo(String username);
	void updatePassword(Admin admin);
	void addEmps(Admin admin);
	void delectEmps(int id);
	void updateRole(Admin admin);
}
