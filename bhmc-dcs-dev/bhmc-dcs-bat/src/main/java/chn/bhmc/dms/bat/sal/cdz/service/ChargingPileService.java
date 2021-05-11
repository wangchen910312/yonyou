package chn.bhmc.dms.bat.sal.cdz.service;

import java.util.List;

import chn.bhmc.dms.bat.sal.cdz.vo.ReceiveSaleVehicleVO;
import chn.bhmc.dms.bat.sal.cdz.vo.SalesVehicleMonitorVO;
import chn.bhmc.dms.bat.sal.cdz.vo.UpdateChargingPileVO;

/**
 * 이월판매취소결과조회 서비스
 *
 * @author Kim yewon
 * @since 2016. 5. 20.
 * @version 1.0
 
 */

public interface ChargingPileService {

	/**
     * 查询充电桩数据发送给充电桩平台
     * @param searchVO - ChargingPileVO
     * @return
     */
	public List<UpdateChargingPileVO> selectChargingPileList(UpdateChargingPileVO searchVO) throws Exception;
	
	/**
     * 更新待发送充电桩平台的数据
     * @param searchVO - ChargingPileVO
     * @return 
     */
	public void updateChargingPileIs(UpdateChargingPileVO chargingPileVO);
	
	/**
     * 更新充电桩平台反馈的安装
     * @param searchVO - ChargingPileVO
     * @return 
     */
	public void updateChargingPile(UpdateChargingPileVO chargingPileVO) throws Exception;
	
	/**
     * 批量更新充电桩平台反馈的安装
     * @param searchVO - ChargingPileVO
     * @return 
     */
	public String updateChargingPile(String jsonFromCdz) throws Exception;
	
	
	/**
	 * 查询销售车辆数据发送给北理工平台
	 * @param searchVO - ChargingPileVO
	 * @return
	 */
	public List<ReceiveSaleVehicleVO> selectSaleVehicleList(ReceiveSaleVehicleVO searchVO) throws Exception;
	
	/**
     * 更新待发送北理工平台销售的数据
     * @param searchVO - ReceiveSaleVehicleVO
     * @return 
     */
	public void updateReceiveSalesVehicleIs(ReceiveSaleVehicleVO receiveSaleVehicleVO);
	
	/**
	 * 查询销售车辆数据发送给监控平台
	 * @param searchVO - ChargingPileVO
	 * @return
	 */
	public List<SalesVehicleMonitorVO> selectSalesMonitorList(SalesVehicleMonitorVO searchVO) throws Exception;
	
	/**
     * 更新待发送监控平台销售的数据
     * @param searchVO - ReceiveSaleVehicleVO
     * @return 
     */
	public void updateSalesMonitorIs(SalesVehicleMonitorVO salesVehicleMonitorVO);
}
