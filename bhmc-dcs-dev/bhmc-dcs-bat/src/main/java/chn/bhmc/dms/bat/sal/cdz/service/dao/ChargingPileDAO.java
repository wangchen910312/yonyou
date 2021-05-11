package chn.bhmc.dms.bat.sal.cdz.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.bat.sal.cdz.vo.ReceiveSaleVehicleVO;
import chn.bhmc.dms.bat.sal.cdz.vo.SalesVehicleMonitorVO;
import chn.bhmc.dms.bat.sal.cdz.vo.UpdateChargingPileVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignMngDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 5. 20
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("chargingPileDAO")
public interface ChargingPileDAO {

	/**
     * 查询充电桩数据发送给充电桩平台
     * @param searchVO - ChargingPileVO
     * @return 조회 목록
     */
	public List<UpdateChargingPileVO> selectChargingPileList(UpdateChargingPileVO searchVO);
	
	/**
     * 将充电桩平台回传安装信息更新到业务表
     * @param searchVO - ChargingPileVO
     * @return 조회 목록
     */
	public void updateChargingPile(UpdateChargingPileVO vo);
	
	/**
     * 将充电桩平台回传安装信息更新到接口表准备下发经销商
     * @param searchVO - ChargingPileVO
     * @return 조회 목록
     */
	public void updateChargingPileIs(UpdateChargingPileVO vo);
	
	/**
	 * 将充电桩平台回传安装信息更新到接口表准备下发经销商
	 * @param searchVO - ChargingPileVO
	 * @return 조회 목록
	 */
	public void insertChargingPile(UpdateChargingPileVO vo);
	
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
	 * @param searchVO - SalesVehicleMonitorVO
	 * @return
	 */
	public List<SalesVehicleMonitorVO> selectSalesMonitorList(SalesVehicleMonitorVO searchVO) throws Exception;
	
	/**
     * 更新待发送监控平台销售的数据
     * @param searchVO - SalesVehicleMonitorVO
     * @return 
     */
	public void updateSalesMonitorIs(SalesVehicleMonitorVO salesVehicleMonitorVO);
}
