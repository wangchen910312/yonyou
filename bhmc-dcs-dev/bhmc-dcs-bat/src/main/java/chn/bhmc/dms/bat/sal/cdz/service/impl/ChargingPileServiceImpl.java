package chn.bhmc.dms.bat.sal.cdz.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.sal.cdz.service.ChargingPileService;
import chn.bhmc.dms.bat.sal.cdz.service.dao.ChargingPileDAO;
import chn.bhmc.dms.bat.sal.cdz.vo.ReceiveSaleVehicleVO;
import chn.bhmc.dms.bat.sal.cdz.vo.SalesVehicleMonitorVO;
import chn.bhmc.dms.bat.sal.cdz.vo.UpdateChargingPileVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CancDeliveryServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.      Kim yewon              최초 생성
 * </pre>
 */

@Service("chargingPileService")
public class ChargingPileServiceImpl extends HService implements ChargingPileService {

    /**
     * 引入充电桩DAO
     */
    @Resource(name="chargingPileDAO")
    ChargingPileDAO chargingPileDAO;

	@Override
	public void updateChargingPileIs(UpdateChargingPileVO chargingPileVO) {
		chargingPileDAO.updateChargingPileIs(chargingPileVO);
	}
	
	/**
     * 查询充电桩数据并以便接口发送给充电桩平台
     */
    @Override
    public List<UpdateChargingPileVO> selectChargingPileList(UpdateChargingPileVO searchVO) throws Exception {
        return chargingPileDAO.selectChargingPileList(searchVO);
    }

	@Override
	/**
	 * 单独接收充电桩反馈的安装信息
	 * */
	public void updateChargingPile(UpdateChargingPileVO vo) throws Exception {
		chargingPileDAO.updateChargingPile(vo);
		chargingPileDAO.insertChargingPile(vo);
	}
	
	@Override
	/**
	 * 批量接收充电桩反馈的安装信息
	 * */
	public String updateChargingPile(String jsonFromCdz) throws Exception {
//		JSONObject jsonObj = (JSONObject) JSONValue.parse(jsonFromCdz);
		JSONArray jsonArray = (JSONArray)JSONValue.parse(jsonFromCdz);
		String result = "";
		for(int i=0;i<jsonArray.size();i++){
			JSONObject jsonObj = (JSONObject)jsonArray.get(i);
			UpdateChargingPileVO vo = new UpdateChargingPileVO();
			vo.setInstallationNo((String)jsonObj.get("OrderNo"));
			vo.setStatus((String)jsonObj.get("Status"));
			vo.setInvoiceDateSta((String)jsonObj.get("ExecDate"));//借用InvoiceDateSta字段接收ExecDate字符串信息
			vo.setExecRemark((String)jsonObj.get("ExecRemark"));
			vo.setCompany((String)jsonObj.get("Company"));
			vo.setName((String)jsonObj.get("Name"));
			vo.setMobile((String)jsonObj.get("Mobile"));
			vo.setEmail((String)jsonObj.get("Email"));
			
//			Status	执行状态	STRING
//			ExecDate	执行日期	DATETIME
//			ExecRemark	执行备注	STRING
//			Company	服务商名称	STRING
//			Name	服务商负责人	STRING
//			Mobile	服务商联系方式	STRING
//			Email	服务商邮箱	STRING

			chargingPileDAO.updateChargingPile(vo);
		}
		
		return result;
	}
	
	
	/**
     * 查询销售车辆数据发送给北理工平台
     */
    @Override
    public List<ReceiveSaleVehicleVO> selectSaleVehicleList(ReceiveSaleVehicleVO searchVO) throws Exception {
        return chargingPileDAO.selectSaleVehicleList(searchVO);
    }
    
    @Override
	public void updateReceiveSalesVehicleIs(ReceiveSaleVehicleVO receiveSaleVehicleVO) {
		chargingPileDAO.updateReceiveSalesVehicleIs(receiveSaleVehicleVO);
	}
    
    /**
     * 查询销售车辆数据发送给监控平台
     */
    @Override
    public List<SalesVehicleMonitorVO> selectSalesMonitorList(SalesVehicleMonitorVO searchVO) throws Exception {
        return chargingPileDAO.selectSalesMonitorList(searchVO);
    }
    
    @Override
	public void updateSalesMonitorIs(SalesVehicleMonitorVO salesVehicleMonitorVO) {
		chargingPileDAO.updateSalesMonitorIs(salesVehicleMonitorVO);
	}
   
}
