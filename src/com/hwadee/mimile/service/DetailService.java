package com.hwadee.mimile.service;


import java.sql.SQLException;
import java.util.List;

import com.hwadee.mimile.dao.DetailDao;
import com.hwadee.mimile.pojo.Detail;

public class DetailService {
	
	DetailDao detailDao;
	
	public void saveDetail(Detail detail , Integer oid){
		detailDao.saveDetail(detail, oid);
	}
	
	
	public void saveDetails(){
		detailDao.saveDetails();
	}
	
	
	public List<Detail> showDetails() throws SQLException{
		System.out.println("before it works");
		return detailDao.showDetails();
	}
	

}
