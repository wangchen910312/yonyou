package chn.bhmc.dms.bat.sal.rcp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchVehicleReceiptVO;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchVehicleVO;

/**
 * <p>Title: 将待绑定机票的VIN对应车辆拉取下来</p>
 * @author chenshengan 2021年4月20日 
 */
@Mapper("pullDownVehicleReceiptDAO")
public interface PullDownVehicleReceiptDAO {

	/**
	 * 查询所有“是否绑定车辆”字段为'N'的发票信息
	 * @return
	 * @throws Exception
	 */
	public List<BatchVehicleReceiptVO> selectVehicleReceipt() throws Exception;
    
	/**
	 * 修改发票“是否绑定车辆”字段改为'Y'
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public int updateVehicleReceiptBindingCarYn(List<BatchVehicleVO> list) throws Exception;
	
	/**
	 * 查询所有从DCS拉取到的车辆信息
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public List<BatchVehicleReceiptVO> selectVehicle(List<BatchVehicleReceiptVO> list) throws Exception;
	
	/**
	 * 修改车辆信息表“绑定发票标识”字段为'02'
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public int updateVehicleBindingReceiptFlag(List<BatchVehicleVO> list) throws Exception;
	
	/**
	 * 修改车辆信息表“保修日期”字段为发票开票日期
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public int updateVehicleGrteStartDt(List<BatchVehicleVO> list) throws Exception;
	
	/**
	 * 新增车辆信息
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public int addVehicle(List<BatchVehicleVO> list) throws Exception;
	
}
