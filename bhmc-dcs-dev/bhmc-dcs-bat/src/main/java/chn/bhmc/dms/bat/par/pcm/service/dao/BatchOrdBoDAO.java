package chn.bhmc.dms.bat.par.pcm.service.dao;

import able.com.mybatis.Mapper;

@Mapper("batchOrdBoDAO")
public interface BatchOrdBoDAO {
	/**
	 * 系统自动判断，关闭缺货申请  JiaMing 2020-11-26
	 * @throws Exception
	 */
	public void executeBatchORdBoProcedure() throws Exception;
	
	public void updateAppealStatus() throws Exception;
}
