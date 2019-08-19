package com.lishan.gjq.province;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value="pService")
public class ProvinceServiceImpl implements ProvinceService{
	@Autowired
	private ProvinceDao provinceDao;

	public List<Province>  getProvince(int parentid) {
		// TODO Auto-generated method stub
		return provinceDao.getProvince(parentid);
	}

}
