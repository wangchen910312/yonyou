package chn.bhmc.dms.bat.par.pcm.service;

public interface BatchOrdBoService {
	
	/**
	 * 系统自动判断，关闭缺货申请  JiaMing 2020-11-26
	 * @throws Exception
	 */
	public void executeBatchORdBoProcedure() throws Exception;
	
	/**
	 * 回复记录中配件的到达仓库时间晚于（当前日期+N天）某日期 ，仅修改单据状态为采购科处理中。
	 * @param n
	 * @throws Exception
	 */
	public void updateAppealStatus() throws Exception;
}
