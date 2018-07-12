package com.briup.service.impl;

import java.util.List;

import com.briup.bean.Category;
import com.briup.dao.ICategoryDao;
import com.briup.dao.impl.ICategoryDaoImpl;
import com.briup.service.ICategoryService;

public class ICategoryServiceImpl implements ICategoryService{
	private ICategoryDao dao=new ICategoryDaoImpl();
	@Override
	public List<Category> listCategory() {
		// TODO Auto-generated method stub
		return dao.listAllCates();
	}

	@Override
	public void saveCategory(Category category) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delCategory(Long categoryId) {
		// TODO Auto-generated method stub
		
	}

}
