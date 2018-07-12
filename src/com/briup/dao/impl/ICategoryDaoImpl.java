package com.briup.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import com.briup.bean.Category;
import com.briup.bean.CategoryDetail;
import com.briup.dao.ICategoryDao;

public class ICategoryDaoImpl  implements ICategoryDao{
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private String username="estore";
	private String password="estore";
	@Override
	public List<Category> listAllCates() {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Category> cates=new ArrayList<>();
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, username, password);
			String sql="select s.id,s.name,d.id,d.name"
							+ "   from s_cate s,s_cate_detail d"
							+ "   where s.id=d.category_id";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			//long Long
			//int Integer
			//byte Byte
			//boolean Boolean
			//char charcater
			Map<Long, Category> map=new HashMap<>();
			while(rs.next()){
				long id=rs.getLong(1);
				String name=rs.getString(2);
				long idd=rs.getLong(3);
				String named=rs.getString(4);
				if(map.containsKey(id)){
					CategoryDetail cd=new CategoryDetail();
					cd.setId(idd);
					cd.setName(named);
					//从map取出大分类
					Category cate=map.get(id);
					cate.getDetail().add(cd);
				}else{
					Category cate=new Category();
					cate.setId(id);
					cate.setName(name);
					CategoryDetail cd=new CategoryDetail();
					cd.setId(idd);
					cd.setName(named);
					Set<CategoryDetail> set=new HashSet<>();
					set.add(cd);
					cate.setDetail(set);
					map.put(id, cate);
				}
			}
			for(long k:map.keySet()){
				Category c=map.get(k);
				cates.add(c);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cates;
	}

}




