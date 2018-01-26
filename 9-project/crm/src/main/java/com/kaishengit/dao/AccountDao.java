package com.kaishengit.dao;

import org.apache.commons.dbutils.handlers.BeanHandler;

import com.kaishengit.entity.Account;
import com.kaishengit.util.DbHelp;

public class AccountDao {

	public Account findbyByName(String username) {
		String sql = "select * from t_account where username = ?";
		return DbHelp.query(sql, new BeanHandler<>(Account.class), username);
	}

	public Account findByMobile(String mobile) {
		String sql = "select * from t_Account where mobile = ?";
		return DbHelp.query(sql, new BeanHandler<>(Account.class), mobile);
	}

	public int save(Account account) {
		String sql = "insert into t_account (username, password, mobile, update_time) values (?,?,?,?)";
		return DbHelp.executeInsert(sql, account.getUsername(),account.getPassword(), account.getMobile(),account.getUpdateTime());
	}

}
