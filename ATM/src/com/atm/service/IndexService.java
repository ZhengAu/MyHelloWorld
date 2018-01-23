package com.atm.service;

import java.sql.SQLException;
import java.util.List;

import com.atm.dao.IndexDao;
import com.atm.domain.Account;
import com.atm.domain.History;
import com.atm.utils.DataSourceUtils;

public class IndexService {
	IndexDao dao = new IndexDao();
	//查询账户列表
	public List<Object> findAccountList(){
		List<Object> userIdList = null;
		try {
			userIdList = dao.findAccountList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userIdList;
	}
	
	//登录密码
	public Account login(String accountId) {
		Account account = null;
		try {
			account = dao.login(accountId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return account;
	}
	//更新密码
	public boolean updatePassword(String userid, String newPassword) {
		int row = 0;
		try {
			row = dao.updatePassword(userid,newPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//大于0表示成功，否则失败
		return row>0?true:false;
	}
	//查询历史记录
	public List<History> findAllHistory(String userid) {
		List<History> historyList = null;
		try {
			historyList = dao.findAllHistory(userid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return historyList;
	}
	//查询最近一个月的记录
	public List<History> lastMonthRecords(String userid) {
		List<History> historyList = null;
		try {
			historyList = dao.lastMonthRecords(userid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return historyList;
	}
	//被转账的账号列表
	public List<Object> findTransferAccount(String userid) {
		List<Object> userIdList = null;
		try {
			userIdList = dao.findTransferAccount(userid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userIdList;
	}
	//转账
	public boolean transfer(History history) {
		int updateOwnAccount = 0;
		int updateOtherAccount = 0;
		int addHistory = 0;
		try {
			//开启事务
			DataSourceUtils.startTransaction();
			//减少个人账号的金额
			updateOwnAccount = dao.updateOwnAccount(history);
			//增加对方账号的金额
			updateOtherAccount = dao.updateOtherAccount(history);
			//添加转账的历史记录
			addHistory = dao.addHistory(history);
		} catch (SQLException e) {
			try {
				DataSourceUtils.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally{
			try {
				DataSourceUtils.commitAndRelease();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return (updateOwnAccount>0&&updateOtherAccount>0&&addHistory>0)?true:false;
	}
	//存款
	public boolean deposit(History history) {
		int deposit = 0 ;
		int addHistory = 0;
		try {
			DataSourceUtils.startTransaction();
			//增加金额
			deposit = dao.deposit(history.getAccount().getUserid(),history.getIncome());
			//添加存款的历史记录
			addHistory = dao.addHistory(history);
		} catch (SQLException e) {
			try {
				DataSourceUtils.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally{
			try {
				DataSourceUtils.commitAndRelease();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return (deposit>0&&addHistory>0)?true:false;
	}
	//提现
	public boolean draw(History history) {
		int draw = 0;
		int addHistory = 0;
		try {
			DataSourceUtils.startTransaction();
			//减少金额
			draw = dao.draw(history.getAccount().getUserid(),history.getExpense());
			//添加提现的历史记录
			addHistory = dao.addHistory(history);
		} catch (SQLException e) {
			try {
				DataSourceUtils.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally{
			try {
				DataSourceUtils.commitAndRelease();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return (draw>0&&addHistory>0)?true:false;
	}
}
