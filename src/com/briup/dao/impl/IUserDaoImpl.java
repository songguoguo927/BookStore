package com.briup.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.briup.bean.User;
import com.briup.dao.IUserDao;

public class IUserDaoImpl implements IUserDao{
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private String username="estore";
	private String password="estore";
	@Override
	public void saveUser(User user) {
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, username, password);
			String sql="insert into s_user values(my_seq.nextval,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getZip());
			ps.setString(4, user.getAddress());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getEmail());
			//java.uti.Date转化java.sql.Date
			Date date=new Date(user.getDob().getTime());
			ps.setDate(7, date);
			ps.execute();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	@Override
	public User findUserByName(String name) {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;//结果集一般专门针对于select查询
		User user=null;
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, username, password);
			String sql="select id,username,password,zip,address,phone,email,dob  from s_user where username=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			while(rs.next()){
				user=new User();
				long id=rs.getLong(1);
				String username=rs.getString(2);
				String passwd=rs.getString(3);
				String zip=rs.getString(4);
				String addr=rs.getString(5);
				String phone=rs.getString(6);
				String email=rs.getString(7);
				Date dob=rs.getDate(8);
				user.setId(id);
				user.setUsername(username);
				user.setPassword(passwd);
				user.setZip(zip);
				user.setAddress(addr);
				user.setPhone(phone);
				user.setEmail(email);
				java.util.Date date=new java.util.Date(dob.getTime());
				user.setDob(date);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

@Override
public void updateUser(User user) {
	//第一步注册驱动，与上面类似
	//封装：把代码重复率高的部分写进一个公共的方法里
	Connection conn=null;
	PreparedStatement ps=null;//PreparedStatement对象的目的编译sql语句，并把数据发给数据库
	//不需要结果集
	try {
		Class.forName(driver);
		conn=DriverManager.getConnection(url,username,password);
		String sql="update s_user set password=?,zip=?,adress=?,phone=?,email=? where username=?";//修改语句
		ps=conn.prepareStatement(sql);
		ps.setString(1, user.getPassword());
		ps.setString(2, user.getZip());
		ps.setString(3, user.getAddress());
		ps.setString(4, user.getPhone());
		ps.setString(5, user.getEmail());
		ps.setString(6, user.getUsername());
		ps.execute();
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		try {
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
}




