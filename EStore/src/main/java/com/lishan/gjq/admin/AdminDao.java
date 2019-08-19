package com.lishan.gjq.admin;

import java.util.List;

public interface AdminDao {
	Admin findByUsername(String username);
	List<Lim> findIndexByid(int id);
	List<Admin> findEmp();
	List<Admin> findInfo(String username);
	void updatePassword(Admin admin);
	void addEmps(Admin admin);
	void delectEmps(int id);
	void updateRole(Admin admin);
	
	
}
