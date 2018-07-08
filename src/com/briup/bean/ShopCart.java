package com.briup.bean;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class ShopCart implements IShopCart {
	/*
	 * orderlines存储加入到购物车中的产品，key为产品ip，value为订单项（订单项中存在数量）
	 * 注意：购物车中产品登陆之后添加，下次在登陆的时候购物车中没有内容
	 * 购物车存储在session会回，每一个用户登陆到服务器，服务器都会为
	 * 每一个客户端分配一个session对象，session的有效时间30分钟
	 */
	private Map<Long,OrderLine> orderlines = new HashMap<Long,OrderLine>();
	
	public void addProduct(Product product) throws Exception{
		System.out.println("进入ShopCart的add()方法！");
		int number = 1;
		long id = product.getId();
		if(orderlines.containsKey(id)) {
			OrderLine orderline = (OrderLine) orderlines.get(id);
			number = orderline.getNum()+1;
			orderline.setNum(new Integer(number));
		}else {
			OrderLine orderline = new OrderLine();
			orderline.setNum(new Integer(number));
			orderline.setProduct(product);
			orderlines.put(id, orderline);
		}
	}


	public void removeAllProducts() throws Exception{
		System.out.println("进入ShopCart的removeAllProducts()方法！");
		orderlines.clear();
	}


	public BigDecimal getTotalPrice() throws Exception{
		System.out.println("进入ShopCart的getTotalPrice()方法！");
		BigDecimal totalPrice = new BigDecimal(0);
		Iterator<OrderLine> iter = getOrderlines();
		while(iter.hasNext()) {
			OrderLine o = (OrderLine) iter.next();
			Product p = o.getProduct();
			BigDecimal sum = new BigDecimal(p.getPrice()*o.getNum());
			totalPrice = totalPrice.add(sum);
		}
		return totalPrice;
	}

	public Iterator<OrderLine> getOrderlines() throws Exception{
		System.out.println("进入ShopCart的getOrderlines()方法！");
		return orderlines.values().iterator();
	}

	@Override
	public void removeProduct(Long productid) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("进入ShopCart的removeProduct()方法！");
		orderlines.remove(productid);
	}

	@Override
	public void updateProduct(Long productid, Integer number) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("进入ShopCart的updateProduct()方法！");
		OrderLine orderline = orderlines.get(productid);
		orderline.setNum(number);
	}


	@Override
	public int getShopCartSize() throws Exception {
		// TODO Auto-generated method stub
		return orderlines.size();
	}
}
