package com.daum.service;

import java.util.List;

import com.daum.model.ReserveBean;

public interface AdminReserveService {

	int getReserveListCount(ReserveBean bean);

	List<ReserveBean> getReserveList(ReserveBean bean);

	
}
