package com.briup.service;

import com.briup.bean.OrderLine;
import com.briup.common.exception.OrderException;

public interface IOrderLineService {
	/**
	 * 保存订单明细
	 * */
	public void saveOrder(OrderLine order) throws OrderException;
	/**
	 * 根据ID删除订单明细
	 * */
	public void delOrder(Long orderid) throws OrderException;

}