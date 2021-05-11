package chn.bhmc.dms.sal.com.service;

import java.util.List;

import chn.bhmc.dms.sal.com.vo.CommercialInsuranceVO;

/**
 * 
 * 商业保险查询
 * 
 * @author wushibin
 * @since 2019.7. 4.
 * @version 1.0
 * @see
 */

public interface CommercialInsuranceService {

	/**
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	public List<CommercialInsuranceVO> sendPostReq(CommercialInsuranceVO commercialInsuranceVO) throws Exception;

	public List<CommercialInsuranceVO> insuranceExpires(CommercialInsuranceVO commercialInsuranceVO) throws Exception;
	
	public int selectcontByCarNo(CommercialInsuranceVO commercialInsuranceVO) throws Exception;
	
	public List<CommercialInsuranceVO> selectInfoByCarRegNo(CommercialInsuranceVO commercialInsuranceVO) throws Exception;
	

}
