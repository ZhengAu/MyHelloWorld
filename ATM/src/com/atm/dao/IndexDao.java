package com.atm.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import com.atm.domain.Account;
import com.atm.domain.History;
import com.atm.utils.DataSourceUtils;

public class IndexDao {
	//查询账户的账号列表
	public List<Object> findAccountList() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from account";
		List<Object> userIdList = runner.query(sql, new ColumnListHandler("userid"));
		return userIdList;
	}
	//登录
	public Account login(String accountId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from account where userid = ?";
		Account account = runner.query(sql, new BeanHandler<Account>(Account.class), accountId);
		return account;
	}
	//更新密码
	public int updatePassword(String userid, String newPassword) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update account set password = ? where userid = ?";
		Object[] params = {newPassword,userid};
		int update = runner.update(sql, params);
		return update;
	}
	//查询历史记录，按时间降序
	public List<History> findAllHistory(String userid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from history where userid = ? order by datetime desc";
		List<History> query = runner.query(sql, new BeanListHandler<History>(History.class),userid);
		return query;
	}
	//查询最近一个月的记录
	public List<History> lastMonthRecords(String userid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from history where userid = ? and DATE_SUB(CURDATE(),INTERVAL 30 DAY) <=datetime order by datetime desc";
		List<History> query = runner.query(sql, new BeanListHandler<History>(History.class),userid);
		return query;
	}
	//被转账的账号
	public List<Object> findTransferAccount(String userid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from account where userid<>?";
		List<Object> userIdList = runner.query(sql, new ColumnListHandler("userid"),userid);
		return userIdList;
	}
	//减少个人账户的余额
	public int updateOwnAccount(History history) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtils.getConnection();
		String sql = "update account set balance = balance - ? where userid = ?";
		Object[] params = {history.getExpense(),history.getAccount().getUserid()};
		int update = runner.update(conn, sql, params);
		return update;
	}
	//增加对方账户的余额
	public int updateOtherAccount(History history) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtils.getConnection();
		String sql = "update account set balance=balance+? where userid = ?";
		Object[] params = {history.getExpense(),history.getSourceid()};
		int update = runner.update(conn, sql, params);
		return update;
	}
	//添加转账、提现、存款的历史交易记录
	public int addHistory(History history) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtils.getConnection();
		String sql = "insert into history values(?,?,?,?,?,?,?)";
		Object[] params = {history.getId(),history.getAccount().getUserid(),history.getDatetime(),
				history.getExpense(),history.getIncome(),history.getSourceid(),history.getRemarks()};
		int update = runner.update(conn, sql, params);
		return update;
	}
	//存款
	public int deposit(String userid, double money) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtils.getConnection();
		String sql = "update account set balance=balance+? where userid=?";
		int update = runner.update(conn, sql, money, userid);
		return update;
	}
	//提现
	public int draw(String userid, double money) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtils.getConnection();
		String sql = "update account set balance=balance-? where userid=?";
		int update = runner.update(conn, sql, money,userid);
		return update;
	}

}
