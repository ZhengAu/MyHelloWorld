package com.atm.web.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.atm.domain.Account;
import com.atm.domain.History;
import com.atm.service.IndexService;
import com.atm.utils.CommonUtils;
import com.google.gson.Gson;

public class IndexServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	IndexService service = new IndexService();
	//鎻愮幇
	public void draw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String moneyStr = request.getParameter("money");
		double money =	Double.parseDouble(moneyStr);
		//灏佽account锛宧istory
		Account account = new Account();
		account.setUserid(userid);
		History history = new History();
		history.setAccount(account);
		history.setDatetime(new Date());
		history.setExpense(money);
		history.setId(CommonUtils.getUUID());
		history.setIncome(0);
		history.setRemarks(null);
		history.setSourceid(null);
		
		boolean isSuccess = false;
		isSuccess = service.draw(history);
		//鏇存柊session涓殑account锛岃繖鏍锋洿鏂板ソ鍚楋紵
		Account newAccount = null;
		newAccount=service.login(userid);
		request.getSession().setAttribute("account", newAccount);
		
		response.setCharacterEncoding("UTF-8");
		if(isSuccess){
			response.getWriter().write("{\"isSuccess\":\"鎻愮幇鎴愬姛锛乗\"}");
		}else{
			response.getWriter().write("{\"isSuccess\":\"鎻愮幇澶辫触锛乗\"}");			
		}
	}
	//瀛樻
	public void deposit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String moneyStr = request.getParameter("money");
		double money =	Double.parseDouble(moneyStr);
		//灏佽account锛宧istory
		Account account = new Account();
		account.setUserid(userid);
		History history = new History();
		history.setAccount(account);
		history.setDatetime(new Date());
		history.setExpense(0);
		history.setId(CommonUtils.getUUID());
		history.setIncome(money);
		history.setRemarks(null);
		history.setSourceid(null);
		
		boolean isSuccess = false;
		isSuccess = service.deposit(history);
		//鏇存柊session涓殑account锛岃繖鏍锋洿鏂板ソ鍚楋紵
		Account newAccount = null;
		newAccount=service.login(userid);
		request.getSession().setAttribute("account", newAccount);
		
		response.setCharacterEncoding("UTF-8");
		if(isSuccess){
			response.getWriter().write("{\"isSuccess\":\"瀛樻鎴愬姛锛乗\"}");
		}else{
			response.getWriter().write("{\"isSuccess\":\"瀛樻澶辫触锛乗\"}");			
		}
	}
	//杞处
	public void transfer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String sourceid = request.getParameter("sourceid");
		String transferMoneyStr = request.getParameter("transferMoney");
		double transferMoney = Double.valueOf(transferMoneyStr);
		//灏佽account
		Account account = new Account();
		account.setUserid(userid);
		//灏佽history
		History history = new History();
		history.setId(CommonUtils.getUUID());
		history.setDatetime(new Date());
		history.setExpense(transferMoney);
		history.setIncome(0);
		history.setRemarks(null);
		history.setSourceid(sourceid);
		history.setAccount(account);
		//灏佽瀹屾瘯
		boolean isSuccess = false;
		isSuccess = service.transfer(history);
		//鏇存柊session涓殑account锛屼綑棰濆凡鍙�
		Account newAccount=null;
		newAccount=service.login(userid);
		request.getSession().setAttribute("account", newAccount);
		//杩斿洖鏁版嵁缁橝JAX
		response.setCharacterEncoding("UTF-8");
		if(isSuccess){
			response.getWriter().write("{\"isSuccess\":\"杞处鎴愬姛锛乗\"}");
		}else{
			response.getWriter().write("{\"isSuccess\":\"杞处澶辫触锛乗\"}");			
		}
	}
	//鏌ヨ瑕佽浆璐︾殑璐︽埛
	public void findTransferAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		List<Object> list = null;
		list = service.findTransferAccount(userid);
		//杞崲鎴怞SON鏍煎紡骞惰繑鍥�
		Gson gson = new Gson();
		String json = gson.toJson(list);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}
	//鏌ヨ鏈�杩戜竴涓湀鐨勮褰�
	public void lastMonthRecords(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		List<History> historyList = null;
		historyList = service.lastMonthRecords(userid);
		Gson gson = new Gson();
		String json = gson.toJson(historyList);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}
	//鏌ヨ鍘嗗彶璁板綍
	public void history(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		List<History> historyList = null;
		historyList = service.findAllHistory(userid);
		Gson gson = new Gson();
		String json = gson.toJson(historyList);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}
	//淇敼瀵嗙爜
	public void updatePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		boolean updatePassword = false;
		response.setCharacterEncoding("UTF-8");
		if(newPassword.equals(confirmPassword)){
			updatePassword = service.updatePassword(userid,newPassword);
			if(updatePassword){
				response.getWriter().write("{\"isSuccess\":\"淇敼瀵嗙爜鎴愬姛锛乗\"}");
			}else{
				response.getWriter().write("{\"isSuccess\":\"淇敼瀵嗙爜澶辫触锛乗\"}");			
			}
		}else {
			response.getWriter().write("{\"isSuccess\":\"涓ゆ杈撳叆鐨勫瘑鐮佷笉涓�鑷达紒\"}");						
		}
	}
	//閫�鍑虹櫥褰曪紝鍙栨秷
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("account");
		response.sendRedirect(request.getContextPath());
	}
	//鐧诲綍
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String accountId = request.getParameter("accountId");
		Account account = null;
		account=service.login(accountId);
		//瀛樻斁鍦╯ession鍩�
		session.setAttribute("account", account);
		//杞崲鎴怞SON鏍煎紡骞惰繑鍥�
		Gson gson = new Gson();
		String json = gson.toJson(account);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}
	//鏌ヨ璐︽埛璐﹀彿鍒楄〃
	public void findAccountList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Object> accountList = null;
		accountList = service.findAccountList();
		//杞崲鎴怞SON鏍煎紡骞惰繑鍥�
		Gson gson = new Gson();
		String json = gson.toJson(accountList);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}
	
}