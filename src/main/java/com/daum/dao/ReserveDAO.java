package com.daum.dao;

import java.util.List;


import com.daum.model.ReserveBean;

public interface ReserveDAO {

	List<ReserveBean> Reslist(int h_no);

	List<ReserveBean> getresdate(int hr_date);

	int res_in(ReserveBean rb);
	
	void res_in2(ReserveBean rb);

	int getNopayInfo(ReserveBean rb);

	int payok(ReserveBean rb);
	
	
}
