package chn.bhmc.dms.bat.sal.inv.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.sal.inv.service.StockMntService;
import chn.bhmc.dms.bat.sal.inv.service.dao.StockMntDAO;
@Service("stockMntService")
public class StockMntServiceImpl  extends HService implements StockMntService{
	@Resource(name="stockMntDAO")
    StockMntDAO stockMntDAO;

	@Override
	public void insertStockIf() throws Exception {
		stockMntDAO.insertStockIf();
	}
}
