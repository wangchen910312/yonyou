package chn.bhmc.dms.bat.sal.inv.service.dao;

import able.com.mybatis.Mapper;

@Mapper("stockMntDAO")
public interface StockMntDAO {
	public void insertStockIf() throws Exception;

}
