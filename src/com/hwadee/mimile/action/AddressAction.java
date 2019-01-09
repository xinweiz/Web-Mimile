package com.hwadee.mimile.action;

import com.hwadee.mimile.dao.AddressDao;
import com.hwadee.mimile.pojo.Address;

public class AddressAction {
	public Address address=new Address();
	AddressDao addressDao=new AddressDao();
	public String addAddress()
	
	{
//		addressDao.addAddress(address);
		return "T";
	}
}
