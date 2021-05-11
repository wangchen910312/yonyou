package chn.bhmc.dms.mob.api.sales.dao;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.mob.api.sales.vo.SalesInvoiceVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import able.com.mybatis.Mapper;

@Mapper("salesInvoiceScanDAO")
public interface SalesInvoiceScanDAO {

	/**
	 * 查询扫描发票信息
	 * @param saveInvoiceVO
	 * @return
	 * @throws Exception
	 */
	public List<SalesInvoiceVO> selectInvoiceInfo(SalesInvoiceVO invoiceVO) throws Exception;
	
	/**
	 * 写扫描发票信息
	 * @param saveInvoiceVO
	 * @return
	 * @throws Exception
	 */
	public int insertInvoiceInfo(SalesInvoiceVO invoiceVO) throws Exception;
	
	/**
	 * 更新描发票信息
	 * @param saveInvoiceVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvoiceInfo(SalesInvoiceVO invoiceVO) throws Exception;
	
	/**
	 * 查询发票信息
	 * @param searchVo
	 * @return
	 * @throws Exception
	 */
	public int selectInvoiceInfoCnt(SalesInvoiceVO searchVo) throws Exception;

	/**
	 * 更新 GRTE_START_DT 保修开始日期  TEMP4 BINDING_RECEIPT_FLAG 绑定标识
	 * @param upVehicleMasterVO
	 */
	public void updateVehicleMasterMain(VehicleMasterVO upVehicleMasterVO);
    
	/**
	 * 若车辆不存在，SA_0501T表的BINDING_CAR_YN字段为N
	 * @param dataMap
	 */
	public void updateBindingCarYn(Map<String, Object> dataMap);;
}
