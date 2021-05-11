package chn.bhmc.dms.bat.sal.rcp.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import chn.bhmc.dms.bat.sal.rcp.service.PullDownVehicleReceiptService;
import chn.bhmc.dms.bat.sal.rcp.service.dao.PullDownVehicleReceiptDAO;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchVehicleReceiptVO;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchVehicleVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 
 * <p>Title: 将待绑定机票的VIN对应车辆拉取下来</p >
 * @author chenshengan 2021年5月8日 上午10:59:40
 * @param 
 * @return
 */
@Service("pullDownVehicleReceiptService")
public class PullDownVehicleReceiptServiceImpl extends HService implements PullDownVehicleReceiptService {

	@Resource(name="pullDownVehicleReceiptDAO")
	PullDownVehicleReceiptDAO pullDownVehicleReceiptDAO;
	
	/**
     * Camel Client Factory
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;
	
	@Override
	public void updateVehicleReceipt() throws Exception {
		/**
		 * 验证通过后车非本店的，跑定时任务：将待绑定机票的VIN对应车辆拉取下来
		 * 逻辑：
         * ①查询机动车发票SA_0501T，“是否绑定车辆BINDING_CAR_YN”为N的机票，根据该数据的CarId调用相关接口将车辆信息从DCS拉取到DMS库
         * ②调用完毕，验证是否拉取成功，成功后，修改机票“是否绑定车辆”为Y
         * ③拉取成功后，修改车辆SA_0121T的“绑定发票标识BINDING_RECEIPT_FLAG”为02，判断车辆SA_0121T的“变更类型TEMP4”字段是否是B，
         * 不是B则更新“保修日期GRTE_START_DT”为开票日期
		 */
		// 查询所有“是否绑定车辆”为N的发票
		List<BatchVehicleReceiptVO> batchRcpReceiptVOList = pullDownVehicleReceiptDAO.selectVehicleReceipt();
		
		List<BatchVehicleVO> insertVehicleList = new ArrayList<BatchVehicleVO>();
		for (BatchVehicleReceiptVO batchVehicleReceiptVO : batchRcpReceiptVOList) { // 循环发票信息
			List<BatchVehicleVO> batchVehicleVOs = selectBatchVehicleVO(batchVehicleReceiptVO); // 根据发票信息调用相关接口将车辆信息从DCS拉取到DMS库
			insertVehicleList.add(batchVehicleVOs.get(0));
		}
//		List<BatchVehicleVO> insertVehicleList = testList();
		if (insertVehicleList.size() > 0) {
			pullDownVehicleReceiptDAO.addVehicle(insertVehicleList); // 将接口拉取到的车辆信息存入dms库中
		} else {
			return ;
		}
		
		// 查询车辆表信息
//		List<BatchVehicleReceiptVO> vehicleList = pullDownVehicleReceiptDAO.selectVehicle(batchRcpReceiptVOList);
		if (insertVehicleList.size() > 0) { // 判断接口是否把车辆信息从DCS拉取到DMS
			pullDownVehicleReceiptDAO.updateVehicleReceiptBindingCarYn(insertVehicleList); // 将拉取到车辆信息的发票“是否绑定车辆”改为'Y'
			
			List<BatchVehicleVO> updateList = new ArrayList<BatchVehicleVO>();
			for (BatchVehicleVO vehicle : insertVehicleList) { // 循环车辆信息
				for (BatchVehicleReceiptVO receipt : batchRcpReceiptVOList) { // 循环发票信息
					if (vehicle.getTemp4() != null && !vehicle.getTemp4().equals("B") && receipt.getCarId().equals(vehicle.getCarId()) && vehicle.getGrteStartDt() == null) { // 判断车辆信息的temp4字段的值是否为'B'
						updateList.add(vehicle);
					}
				}
			}
			pullDownVehicleReceiptDAO.updateVehicleBindingReceiptFlag(insertVehicleList); // 将拉取到的车辆信息“绑定发票标识”改为'02'
			if (updateList.size() > 0) { // 判断是否有需要修改保修日期的车辆
				pullDownVehicleReceiptDAO.updateVehicleGrteStartDt(updateList); // 修改车辆保修日期为发票开票日期
			}
			
		}
		
	}
	
	/**
	 * 
	 * <p>Title: 调用SAL126接口获取DCS库中车辆信息</p >
	 * @author chenshengan 2021年5月8日 上午10:37:57
	 * @param 
	 * @return
	 */
	private List<BatchVehicleVO> selectBatchVehicleVO (BatchVehicleReceiptVO vehicleReceiptVO) throws Exception {
		Map<String, Object> message = new HashMap<String, Object>();

        if (StringUtil.nullConvert(vehicleReceiptVO.getDlrCd()).equals("")) {
        	vehicleReceiptVO.setDlrCd(LoginUtil.getDlrCd());
        }

        message.put("DLR_CD", vehicleReceiptVO.getDlrCd());          //Dealer Code
        message.put("VIN_NO", vehicleReceiptVO.getVinNo());          //VIN Number
//        message.put("CARLINE_CD", vehicleReceiptVO.getCarlineCd());  //Car Line Code
//        message.put("CAR_REG_NO", vehicleReceiptVO.getCarRegNo());   //Car Regist Number

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL126");           // service id
        camelClient.setSender(vehicleReceiptVO.getDlrCd());
        camelClient.addSendMessage(message);

        Data receiveData = camelClient.sendRequest();
        List<BatchVehicleVO> list = new ArrayList<BatchVehicleVO>();

        if (receiveData.getFooter().getIfResult().equals("Z")) { // 判断接口获取数据是否成功
        	list = receiveData.readMessages(BatchVehicleVO.class);
        } else {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }
		return list;
	}
	
	public List<BatchVehicleVO> testList (){
		List<BatchVehicleVO> list = new ArrayList<BatchVehicleVO>();
		BatchVehicleVO vo = new BatchVehicleVO();
		vo.setCarId("H00019713564");
		vo.setVinNo("LBEADAFC3GX029748");
		vo.setVinNo1("LBEADADC1JX");
		vo.setVinNo2("450183");
		vo.setDlrCd("D2327");
		vo.setGreyYn("N");
		vo.setDelYn("N");
		vo.setOpenYn("N");
		vo.setLv2DlrStockGrDt(null);
		vo.setLv2DlrStockYn("N");
		vo.setRegUsrId("ERP_BATCH");
		vo.setRegDt(new Date());
		vo.setPreGiYn("N");
		vo.setStrYn("N");
		vo.setBlockYn("N");
		vo.setBindingReceiptFlag("01");
		list.add(vo);
		BatchVehicleVO vo1 = new BatchVehicleVO();
		vo1.setCarId("H00019713566");
		vo1.setVinNo("LBECBACB9JW059800");
		vo1.setVinNo1("LBECBACB9JW");
		vo1.setVinNo2("059800");
		vo1.setDlrCd("D2327");
		vo1.setGreyYn("N");
		vo1.setDelYn("N");
		vo1.setOpenYn("N");
		vo1.setLv2DlrStockGrDt(null);
		vo1.setLv2DlrStockYn("N");
		vo1.setRegUsrId("ERP_BATCH");
		vo1.setRegDt(new Date());
		vo1.setPreGiYn("N");
		vo1.setStrYn("N");
		vo1.setBlockYn("N");
		vo1.setBindingReceiptFlag("01");
		list.add(vo1);
		BatchVehicleVO vo2 = new BatchVehicleVO();
		vo2.setCarId("H00019713568");
		vo2.setVinNo("LBECFAHB8HZ484091");
		vo2.setVinNo1("LBECFAHB8HZ");
		vo2.setVinNo2("484091");
		vo2.setDlrCd("D2327");
		vo2.setGreyYn("N");
		vo2.setDelYn("N");
		vo2.setOpenYn("N");
		vo2.setLv2DlrStockGrDt(null);
		vo2.setLv2DlrStockYn("N");
		vo2.setRegUsrId("ERP_BATCH");
		vo2.setRegDt(new Date());
		vo2.setPreGiYn("N");
		vo2.setStrYn("N");
		vo2.setBlockYn("N");
		vo2.setBindingReceiptFlag("01");
		list.add(vo2);
		return list;
	}

}
