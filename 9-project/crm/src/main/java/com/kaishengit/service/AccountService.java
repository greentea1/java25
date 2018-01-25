package com.kaishengit.service;

import org.apache.commons.codec.digest.DigestUtils;

import com.kaishengit.dao.AccountDao;
import com.kaishengit.entity.Account;
import com.kaishengit.exception.ServiceException;
import com.kaishengit.util.Config;

public class AccountService {

	AccountDao accDao = new AccountDao();
	/**
	 * @param username 用户名
	 * @param password 密码
	 * @return account对象
	 */
	public Account login(String username, String password) {
		Account account = accDao.findbyByName(username);
		String md5Password = DigestUtils.md5Hex(password + Config.get("user.password.salt"));
		
		if(account != null && md5Password.equals(account.getPassword())) {
			 return account;
		} else {
			throw new ServiceException("用户名或者密码错误");
		}
	}

}
