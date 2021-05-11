package chn.bhmc.dms.bat.crm.cso.service;
/**
 * 处理因电话号码重复导致线索生成时找不到客户的情况。
 * @author lxy
 *
 */
public interface BatSalesActiveForHpnoRepeatService {
	  public int updateSalesActiveForHpnoRepeat() throws Exception;

}
