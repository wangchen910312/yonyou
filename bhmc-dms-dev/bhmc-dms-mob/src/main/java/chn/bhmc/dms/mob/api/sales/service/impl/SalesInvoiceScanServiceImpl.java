package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.alibaba.fastjson.JSON;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;
//import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.core.io.ClassPathResource;

import com.alibaba.fastjson.JSONObject;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import chn.bhmc.dms.mob.api.sales.dao.SalesInvoiceScanDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesInvoiceScanService;
import chn.bhmc.dms.mob.api.sales.vo.SalesInvoiceVO;
import chn.bhmc.dms.sal.com.util.GlobalStatic;
import chn.bhmc.dms.sal.com.util.HttpUtil;
import chn.bhmc.dms.sal.rcp.service.dao.SalesVhclCbinRcitDAO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleMasterDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

import java.io.IOException;
import java.text.SimpleDateFormat;

@Service("salesInvoiceScanService")
public class SalesInvoiceScanServiceImpl extends HService implements SalesInvoiceScanService {

	@Resource(name="salesInvoiceScanDAO")
	SalesInvoiceScanDAO salesInvoiceScanDAO;
	
	 @Resource(name="vehicleMasterDAO")
	 VehicleMasterDAO vehicleMasterDAO;
	    
	 
	 @Resource(name = "salesVhclCbinRcitDAO")
	 SalesVhclCbinRcitDAO salesVhclCbinRcitDAO;
	 
	 @Autowired
	 VehicleMasterService vehicleMasterService;
	
	
	@Override
	public String processInvoiceInformation(SalesInvoiceVO searchVo) throws Exception {
		String retVal = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String receiptIssDtStr = searchVo.getReceiptIssDtStr();
		String sysDate = DateUtil.getDate("yyyyMMdd");
		
		SalesInvoiceVO intInvoiceVo = new SalesInvoiceVO();
		
		intInvoiceVo.setReceiptCd(searchVo.getReceiptCd()); //发票代码
		intInvoiceVo.setReceiptNo(searchVo.getReceiptNo()); //发票号码
		intInvoiceVo.setSumAmt(searchVo.getSumAmt());//发票金额
		intInvoiceVo.setScanDt(searchVo.getScanDt());//扫码日期
		//'发票录入来源（01.DMS发票机、02.DMS上传发票图片、03.DMS手动填写、04.APP扫码）';
		intInvoiceVo.setReceiptInResource(GlobalStatic.RECEIPT_IN_RESOURCE_4);
		//'开票日期';
		intInvoiceVo.setReceiptIssDt(sdf.parse(searchVo.getReceiptIssDtStr()));
		intInvoiceVo.setReceiptIssDtStr(searchVo.getReceiptIssDtStr());
		intInvoiceVo.setRegUsrId(LoginUtil.getUserId());//录入人
		int receiptCt = salesInvoiceScanDAO.selectInvoiceInfoCnt(searchVo);
		//intInvoiceVo.setRegDt(new Date());//录入时间
		//如果开票日期等于当前日期直接写入 SA_0510T 表
		if(receiptIssDtStr.equals(sysDate)){
			//验证状态（01.通过、02.未通过、03.待验证、04.不存在）
			intInvoiceVo.setCertFst(GlobalStatic.CERT_FST_3);
			if(receiptCt == 0){
				salesInvoiceScanDAO.insertInvoiceInfo(intInvoiceVo);
			}
			retVal = "5";
		}else{
			//1、先查询 SA_0510T 表信息 根据  发票代码（cd）和发票号码（no） ①如果存在且验证状态不是验证通过，则更新发票信息；
			//②如果存在且验证状态已通过，提示已存在，不更新
			
			List<SalesInvoiceVO> salesInList = null ;
			if(receiptCt > 0){
				salesInList = salesInvoiceScanDAO.selectInvoiceInfo(searchVo);
				SalesInvoiceVO salesInvVO = salesInList.get(0);
				String certFst = salesInvVO.getCertFst();
				//1 通过 提示 已存在，不更新
				if(GlobalStatic.CERT_FST_0.equals(certFst)){
					retVal = "tg";
				} else {
					//更新
					retVal = processInvoiceInfo(intInvoiceVo,"UP");
				}
			}else{
				 retVal = processInvoiceInfo(intInvoiceVo,"IN");
			}
			
		}
		return retVal;
	}
	
	/**
	 * 处理发票信息
	 * @param searchVo
	 * @return
	 * @throws Exception 
	 */
	private String processInvoiceInfo(SalesInvoiceVO searchVo,String dis) throws Exception {
		//String retVal = "";
		//调用发票接口
		Map<String, Object> resMap = hpptPostInvoceInter(searchVo.getReceiptCd(),searchVo.getReceiptNo(),searchVo.getReceiptIssDtStr(),searchVo.getSumAmt());
		
		String resCode = String.valueOf(resMap.get("resultCode"));
		
		//验证通过
		if(resCode.equals(GlobalStatic.RESULT_CODE_OK)) {
			Map<String, Object> dataMap = JSON.parseObject(String.valueOf(resMap.get("data")));
			// 车辆主键
            String carId = String.valueOf(dataMap.get("carId"));
            // 发票店代码 开票经销商code
            String receiptDlrCd = String.valueOf(dataMap.get("dlrCd"));
            // 车辆店代码  车辆所属经销商code
            String carDlrCd = String.valueOf(dataMap.get("carDealerCode"));
            
			SalesInvoiceVO intVo = new SalesInvoiceVO();
			intVo.setRegUsrId(LoginUtil.getUserId());
			intVo.setReceiptCd(searchVo.getReceiptCd()); //发票代码
			intVo.setReceiptNo(searchVo.getReceiptNo()); //发票号码
			intVo.setSumAmt(searchVo.getSumAmt());//发票金额
			intVo.setScanDt(searchVo.getScanDt());//扫码日期
			//'发票录入来源（01.DMS发票机、02.DMS上传发票图片、03.DMS手动填写、04.APP扫码）';
			intVo.setReceiptInResource(GlobalStatic.RECEIPT_IN_RESOURCE_4);
			//'开票日期';
			intVo.setReceiptIssDt(searchVo.getReceiptIssDt());
			
			//验证状态（1.通过、0.未通过、03.待验证、04.不存在）
			intVo.setCertFst(GlobalStatic.CERT_FST_0);
			
			// 获取发票来源，如果结果是“04(他店票他店车)”则无需处理
            String receiptResource = GlobalStatic.getReceiptResources(LoginUtil.getDlrCd(), receiptDlrCd, carDlrCd);
			//'发票来源（01.本店开票、02.他店开票、03.二网开票）';
            intVo.setReceiptResource(receiptResource);//从发票接口拿数据
			
			//'发票状态（01.正常、02.作废、03.红冲）';
            intVo.setReceiptStatus(GlobalStatic.RECEIPT_STATUS_TRANS.get(String.valueOf(dataMap.get("receiptStatus"))));//从发票接口拿数据
			 // 根据carId查询车辆主信息SA_0121T表，查询是否存在数据
            VehicleMasterVO vehicleMasterVO = vehicleMasterService.selectCarInfoByCarId(carId);
            if (vehicleMasterVO != null) {
                // 存在数据，更新车辆主信息表SA_0121T的绑定发票标识字段BINDING_RECEIPT_FLAG
                vehicleMasterVO.setCarId(carId);
                vehicleMasterVO.setBindingReceiptFlag(GlobalStatic.BINDING_RECEIPT_FLAG_2);
                if (!"B".equals(vehicleMasterVO.getTemp4())) {
                    // 如果TEMP4不是B，需要更新保修日期字段GRTE_START_DT为开票日期
                    vehicleMasterVO.setGrteStartDt(intVo.getReceiptIssDt());
                }
                vehicleMasterService.updateCarAfterVerify(vehicleMasterVO);
                // 若车辆存在，SA_0501T表的BINDING_CAR_YN字段为Y
                dataMap.put("bindingCarYn", "Y");
            } else {
                // 若车辆不存在，SA_0501T表的BINDING_CAR_YN字段为N
            	dataMap.put("bindingCarYn", "N");
            	salesInvoiceScanDAO.updateBindingCarYn(dataMap);
            }
            
            dataMap.put("receiptResource", receiptResource);
            dataMap.put("receiptStatus", GlobalStatic.RECEIPT_STATUS_TRANS.get(String.valueOf(dataMap.get("receiptStatus"))));
			//验证通过后，判断发票来源，若返回的发票来源不是04 将数据同步到机票表 SA_0501T，若04则无需同步（代表非本店票非本店车）
			if(!receiptResource.equals(GlobalStatic.RECEIPT_RESOURCE_4)){
				int responseCount = salesVhclCbinRcitDAO.selectCntByReceiptNoCd(dataMap);
				 if (responseCount<=0) {
	                    // 不存在数据，插入
						 dataMap.put("regUsrId",LoginUtil.getUserId());
						 dataMap.put("receiptNo", String.valueOf(searchVo.getReceiptNo()));
						 dataMap.put("receiptCd", String.valueOf(searchVo.getReceiptCd()));
						 dataMap.put("receiptIssDt", intVo.getReceiptIssDt());
						 dataMap.put("sumAmt", String.valueOf(searchVo.getSumAmt()));
						 dataMap.put("certFst", GlobalStatic.CERT_FST_0);
						 dataMap.put("receiptType", GlobalStatic.RECEIPT_TYPE_3);
		                 String timesStr = String.valueOf(dataMap.get("regDt"));
		                 int times = Integer.parseInt(timesStr.substring(0, timesStr.length()-3));
		                 dataMap.put("regDt", new Date(Long.valueOf(times)*1000));
		                 salesVhclCbinRcitDAO.addVhclReceiptInfo(dataMap);
	                } 
			}
			
			//更新SA_0510T表 
			if("IN".equals(dis)){
				salesInvoiceScanDAO.insertInvoiceInfo(intVo);
			}
			if("UP".equals(dis)){
				salesInvoiceScanDAO.updateInvoiceInfo(intVo);
			}
		}
		return resCode;
	}

	@SuppressWarnings("static-access")
	private Map<String, Object> hpptPostInvoceInter(String receiptCd,String receiptNo, String receiptIssDtStr, double sumAmt) throws Exception {
		// 调用集中式接口入参
        JSONObject param = new JSONObject();
        param.put("checkDealerCode", LoginUtil.getDlrCd());//当前登陆账号所属经销商代码
        param.put("receiptCd", receiptCd);//发票code
        param.put("receiptInResource", GlobalStatic.RECEIPT_IN_RESOURCE_4);//录入方式，机动车表字段备注有 发票录入来源（01.DMS发票机、02.DMS上传发票图片、03.DMS手动填写、04.APP扫码）
        param.put("receiptIssDt", receiptIssDtStr);//开票时间（yyyymmdd)
        param.put("receiptNo", receiptNo);//发票号
        param.put("receiptType", GlobalStatic.RECEIPT_TYPE_3);//000001-专用发票 000003-机动车发票 000004-普通发票  000015-二手车发票
        param.put("regUsrId", LoginUtil.getUserId());//当前用户id
        param.put("sumAmt", sumAmt);
        // 读取配置文件【common.properties】获取接口地址
        Properties proConfUrl = PropertiesLoaderUtils
                .loadProperties(new ClassPathResource("/config/common.properties"));
        // 发送请求
        HttpUtil httpUtil = new HttpUtil();
        String resJsonStr = httpUtil.httpPost(proConfUrl.getProperty("receiptVerifyUrl"), String.valueOf(param));
        Map<String, Object> resMap = JSON.parseObject(resJsonStr);
		return resMap;
	}

	public static void main(String[] args) throws IOException {
		JSONObject param = new JSONObject();
		param.put("checkDealerCode", "D2327");//当前登陆账号所属经销商代码
        param.put("receiptCd", "150001722060");//发票code
        param.put("receiptInResource", GlobalStatic.RECEIPT_IN_RESOURCE_4);//录入方式，机动车表字段备注有 发票录入来源（01.DMS发票机、02.DMS上传发票图片、03.DMS手动填写、04.APP扫码）
        param.put("receiptIssDt", "20180525");//开票时间（yyyymmdd)
        param.put("receiptNo", "00957219");//发票号
        param.put("receiptType", GlobalStatic.RECEIPT_TYPE_3);//000001-专用发票 000003-机动车发票 000004-普通发票  000015-二手车发票
        param.put("regUsrId", "admin");//当前用户id
        param.put("sumAmt", 120689.66);

		 // 发送请求
		 // 读取配置文件【common.properties】获取接口地址
        Properties proConfUrl = PropertiesLoaderUtils
                .loadProperties(new ClassPathResource("/config/common.properties"));
        HttpUtil httpUtil = new HttpUtil();
        String resJsonStr = httpUtil.httpPost(proConfUrl.getProperty("receiptVerifyUrl"), String.valueOf(param));
        System.out.println("33"+resJsonStr);
        Map<String, Object> resMap = JSON.parseObject(resJsonStr);
        System.out.println("e"+resMap);
        
		
	}
	/**
	 * 车辆主信息
	 * 保修开始日期
	 * @param carId
	 * @param receiptIssDtStr
	 */
	public void proceOwnerInfo(String carId,Date receiptIssDtStr){
		//查询车辆主信息表信息SA_0121T 修改保修改开始日期
		VehicleMasterSearchVO searchVO = new VehicleMasterSearchVO();
		//searchVO.setsVinNo("");//
		//searchVO.setsDlrCd(LoginUtil.getDlrCd());
		searchVO.setsCarId(carId);//从数衍接口获取
		
		int vinCnt = vehicleMasterDAO.selectVehicleMasterByConditionCnt(searchVO);
		if(vinCnt > 0){
			List<VehicleMasterVO> list = vehicleMasterDAO.selectVehicleMasterByCondition(searchVO);
			VehicleMasterVO vehicleMasterVO = list.get(0);
			if(!StringUtil.nullConvert(vehicleMasterVO.getTemp4()).equals("B")){
				VehicleMasterVO upVehicleMasterVO = new VehicleMasterVO();
				upVehicleMasterVO.setCarId(carId);
				upVehicleMasterVO.setUpdtUsrId(LoginUtil.getDlrCd());
				upVehicleMasterVO.setGrteStartDt(receiptIssDtStr);
				salesInvoiceScanDAO.updateVehicleMasterMain(upVehicleMasterVO);
			}
		}
	}
	
	@Override
	public List<SalesInvoiceVO> selectInvoiceInfo(SalesInvoiceVO invoiceVO) throws Exception {
		return salesInvoiceScanDAO.selectInvoiceInfo(invoiceVO);
	}

	@Override
	public int insertInvoiceInfo(SalesInvoiceVO invoiceVO) throws Exception {
		invoiceVO.setRegUsrId(LoginUtil.getUserId());
		String pattern = "yyyy-MM-dd HH:mm:ss";
	    Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString(new Date(),pattern) ,pattern);
		invoiceVO.setRegDt(toDate);
		return salesInvoiceScanDAO.insertInvoiceInfo(invoiceVO);
	}
	
	@Override
	public int updateInvoiceInfo(SalesInvoiceVO invoiceVO) throws Exception {
		return salesInvoiceScanDAO.updateInvoiceInfo(invoiceVO);
	}

	@Override
	public int selectInvoiceInfoCnt(SalesInvoiceVO searchVo) throws Exception {
		return salesInvoiceScanDAO.selectInvoiceInfoCnt(searchVo);
	}

	

}
