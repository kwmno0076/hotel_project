package com.daum.dao;

import java.util.List;

import com.daum.model.ReserveBean;

public interface AdminReserveDAO {

	int ReserveListCount(ReserveBean bean);

	List<ReserveBean> ReserveList(ReserveBean bean);

	
	
}
