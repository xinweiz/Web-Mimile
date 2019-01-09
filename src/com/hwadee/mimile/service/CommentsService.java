package com.hwadee.mimile.service;
import java.util.List;

import com.hwadee.mimile.dao.CommentsDao;
import com.hwadee.mimile.pojo.Comments;
import com.hwadee.mimile.pojo.User;
public class CommentsService {
	CommentsDao commentsDao=new CommentsDao();
	///////////////还没有加添加！
	public List findAll(int gid)
	{
		return commentsDao.findAll(gid);
	}
	///通过uid获得username
	public User findUserByUid(int uid){
		return commentsDao.findUserByUid(uid);
	}
}
