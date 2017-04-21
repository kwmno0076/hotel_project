package com.daum.service;

import java.util.List;


import com.daum.model.ReserveBean;

public interface ReserveService {

	List<ReserveBean> getReslist(int h_no);

	List<ReserveBean> getresdatelist(int hr_date);

	int res_in(ReserveBean rb);

	void res_in2(ReserveBean rb);

	int getNopayinfo(ReserveBean rb);

	int payok(ReserveBean rb);

	
	
	
	
	/*

	int res_in(ReservationBean rb);

	void res_in2(ReservationBean rb);

	
	
	List<ReservationBean> getResinfo(ReservationBean rb);



	int del_res(int r_no);

	List<ReservationBean> getresdatelist2(int r_date);

	int getNopayinfo(ReservationBean rb);
*/
}
