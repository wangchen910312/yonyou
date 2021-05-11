package chn.bhmc.dms.bat.httpUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.cdz.service.ChargingPileService;
import chn.bhmc.dms.bat.sal.cdz.vo.ReceiveSaleVehicleVO;
import chn.bhmc.dms.bat.sal.cdz.vo.SalesVehicleMonitorVO;
import chn.bhmc.dms.bat.sal.cdz.vo.UpdateChargingPileVO;
import chn.bhmc.dms.core.support.eai.EaiClient;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : HttpClientSendJobBean.java
 * @Description : 开发充电桩平台创建，也可以用于发送其他接口的HTTP协议请求.
 * @author Bruce Lee
 * @since 2019. 04. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2019. 04. 26.     Bruce Lee     v1.0
 * </pre>
 */

public class HttpClientSendJobBean extends BaseJobBean{
	
	@Autowired
	EaiClient eaiClient;
	
    @Resource(name="chargingPileService")
    ChargingPileService chargingPileService;
    
    private static String OperatorID="123456789";
    private static String sKey="1234567890abcdef";
    private static String ivParameter="1234567890abcdef";
//    private static String urlGetToken = "http://10.37.93.197:81/cpms/v1.0/query_token";//充电桩内网测试环境获取token地址
//    private static String urlSendData = "http://10.37.93.197:81/cpms/v1.0/query_order_create";//充电桩内网测试环境传数据地址
    private static String urlGetToken = "http://10.37.93.198:81/cpms/v1.0/query_token";//充电桩正式环境获取token地址
    private static String urlSendData = "http://10.37.93.198:81/cpms/v1.0/query_order_create";//充电桩正式环境传数据地址
//    private static String urlGetToken = "http://192.168.168.168:6868/cpms/v1.0/query_token";//暂时用一个假的IP地址 "http://10.37.93.197:81/cpms/v1.0/query_token";//内网获取token  测试环境注掉 主干代码才用  贾明
//    private static String urlSendData = "http://192.168.168.168:6868/cpms/v1.0/query_order_create";//暂时用一个假的IP地址 "http://10.37.93.197:81/cpms/v1.0/query_order_create";//内网传数据
//    private static String urlGetToken = "http://58.215.246.190:8667/cpms/v1.0/query_token";//外网获取token
//    private static String urlSendData = "http://58.215.246.190:8667/cpms/v1.0/query_order_create";//外网传数据
    private static String limit = "300";//单次发送数据条数

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{
        	//接收来自页面配置的ifId
            String ifId = context.getJobDetail().getJobDataMap().getString("ifId");

            //如果是充电桩数据上传接口
            if("DmsToCdz001".equals(ifId)){
            	//查询当前待发送的充电桩数据
            	UpdateChargingPileVO searchVO = new UpdateChargingPileVO();
            	searchVO.setLimit(limit);
            	List<UpdateChargingPileVO> vos = chargingPileService.selectChargingPileList(searchVO);
            	if(null!=vos&&vos.size()>0){
            		for(int i=0;i<vos.size();i++){
            			UpdateChargingPileVO vo = vos.get(i);
            			//Data组装
            			String getTokenStr = "{\"OperatorID\":\""+OperatorID+"\",\"OperatorSecret\":\""+sKey+"\"}";
                    	
                    	//加密要传的Data
                    	String enString = AesCBC.getInstance().encrypt(getTokenStr,"utf-8",sKey,ivParameter);
                    	Pattern p = Pattern.compile("\\s*|\t|\r|\n");
                		Matcher m = p.matcher(enString);
                		String enGetTokenStr = m.replaceAll("");
                		
                		String seq = "0001";
                		
                		//获得时间磋
                		Date d = new Date();
                		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
            			String timestamp = sdf.format(d);
                        System.out.println("当前时间："+sdf.format(d));
                		String src = OperatorID + enGetTokenStr + timestamp + seq;
                		byte[] macmd5 = HMacMD5Util.getHmacMd5Bytes(sKey.getBytes(), src.getBytes());
                        String sigGetToken = HMacMD5Util.bytesToHexString(macmd5).toUpperCase();
                        
                        //组装要传的字符串
                		StringBuffer sbGetToken = new StringBuffer();
                		sbGetToken.append("{");
                		sbGetToken.append("\"OperatorID\":").append("\"").append(OperatorID).append("\",");
                		sbGetToken.append("\"Data\":").append("\"").append(enGetTokenStr).append("\",");
            			sbGetToken.append("\"TimeStamp\":").append("\"").append(timestamp).append("\",");
            			sbGetToken.append("\"Seq\":").append("\"").append(seq).append("\",");
            			sbGetToken.append("\"Sig\":").append("\"").append(sigGetToken).append("\"");
            			sbGetToken.append("}");
                		System.out.println(sbGetToken.toString());
                		
                    	//传给充电桩平台，并获得token信息
                    	String getReturnJson = SendToCdzHttpUtil.post(urlGetToken, sbGetToken.toString(), "");
                    	JSONObject returnObj = new JSONObject();
                    	returnObj = (JSONObject) JSONValue.parse(getReturnJson);
                    	String returnData = (String) returnObj.get("Data");
                    	String dataStringDen = AesCBC.getInstance().decrypt(returnData,"utf-8",sKey,ivParameter);
                    	JSONObject tokenObj = new JSONObject();
                    	tokenObj = (JSONObject) JSONValue.parse(dataStringDen);
                    	String accessToken = (String) tokenObj.get("AccessToken");
                    	System.out.println("accessToken   :   "+accessToken);
            			
            			/*----------------------------------------------以下是传输数据--------------------------------------------------------*/
            			//判断是否获取到了token
        	        	if(null!=accessToken&&!"".equals(accessToken)){
        	        		//充电桩数据到充电桩平台增加 开票日期为空校验 2019-7-29 贾明 start  
        	        		String invoiceDate = vo.getInvoiceDateSta();
        	        		if("" == invoiceDate || null == invoiceDate){
        	        			invoiceDate = "";
        	        		} else {
        	        			invoiceDate = dateToStamp(invoiceDate);
        	        		}
        	        		//充电桩数据到充电桩平台增加 开票日期为空校验 2019-7-29 贾明 end  
        	        		//String invoiceDate = dateToStamp(vo.getInvoiceDateSta());
        	            	
        	            	String installationNo = vo.getInstallationNo()==null?"":vo.getInstallationNo();
        	            	String CustomerName = vo.getCustName()==null?"":vo.getCustName();
        	            	String CustomerPhone = vo.getCustPhone()==null?"":vo.getCustPhone();
        	            	String DelearCode = vo.getDlrCd()==null?"":vo.getDlrCd();
        	            	String DelearName = vo.getDlrNm()==null?"":vo.getDlrNm();
        	            	String Vehicle = vo.getCarModel()==null?"":vo.getCarModel();
        	            	String VIN = vo.getVinNo()==null?"":vo.getVinNo();
        	            	String Zone = vo.getDivisionName()==null?"":vo.getDivisionName();
        	            	/**  大区加华去掉 贾明  2019-7-23 start
        	            	if(null!=Zone&&!"".equals(Zone)&&!"其他".equals(Zone)){
        	            		Zone = "华"+Zone;
        	            	}
        	            	 大区加华去掉 贾明  2019-7-23 end
        	            	**/
        	            	String Province = vo.getInstallProvince()==null?"":vo.getInstallProvince();
        	            	String City = vo.getInstallCity()==null?"":vo.getInstallCity();
        	            	String District = vo.getInstallArea()==null?"":vo.getInstallArea();
        	            	String Address = vo.getAddress()==null?"":vo.getAddress();
        	            	String InstallationType = vo.getIsNeed();
        	            	if(null!=InstallationType&&"01".equals(InstallationType)){
        	            		InstallationType = "1";
        	            	}else{
        	            		InstallationType = "0";
        	            	}
        	            	String Remark = vo.getRemark();
        	        		String ordTp  = vo.getOrdTp();//NDMS销售的车辆信息中增加“订单类型”并且把该信息传输到充电桩平台  贾明 2019-7-19
        	        		String ordTpNm = vo.getOrdTpNm();//NDMS销售的车辆信息中增加“订单类型中文”并且把该信息传输到充电桩平台  贾明 2019-7-19
        	            	StringBuffer sb = new StringBuffer();
        	    			sb.append("{");
        	    			sb.append("\"OrderNo\":").append("\"").append(installationNo).append("\",");
        	    			sb.append("\"InvoiceDate\":").append("\"").append(invoiceDate).append("\",");
        	    			sb.append("\"CustomerName\":").append("\"").append(CustomerName).append("\",");
        	    			sb.append("\"CustomerPhone\":").append("\"").append(CustomerPhone).append("\",");
        	    			sb.append("\"DelearCode\":").append("\"").append(DelearCode).append("\",");
        	    			sb.append("\"DelearName\":").append("\"").append(DelearName).append("\",");
        	    			sb.append("\"Vehicle\":").append("\"").append(Vehicle).append("\",");
        	    			sb.append("\"VIN\":").append("\"").append(VIN).append("\",");
        	    			sb.append("\"Zone\":").append("\"").append(Zone).append("\",");
        	    			sb.append("\"Province\":").append("\"").append(Province).append("\",");
        	    			sb.append("\"City\":").append("\"").append(City).append("\",");
        	    			sb.append("\"District\":").append("\"").append(District).append("\",");
        	    			sb.append("\"Address\":").append("\"").append(Address).append("\",");
        	    			sb.append("\"InstallationType\":").append("\"").append(InstallationType).append("\",");
        	    			sb.append("\"Remark\":").append("\"").append(Remark).append("\",");
        	    			sb.append("\"OrdTp\":").append("\"").append(ordTp).append("\",");//NDMS销售的车辆信息中增加“订单类型”并且把该信息传输到充电桩平台  贾明 2019-7-19
        	    			sb.append("\"OrdTpNm\":").append("\"").append(ordTpNm).append("\"");//NDMS销售的车辆信息中增加“订单类型中文”并且把该信息传输到充电桩平台  贾明 2019-7-19
        	    			sb.append("}");
        	    			
        	    			System.out.println(sb.toString());
        	    			//加密要传的Data
        	            	String enStringData = AesCBC.getInstance().encrypt(sb.toString(),"utf-8",sKey,ivParameter);
        	            	Pattern pData = Pattern.compile("\\s*|\t|\r|\n");
        	        		Matcher mData = pData.matcher(enStringData);
        	        		String enDataStr = mData.replaceAll("");
        	        		
        	        		//获得时间磋
        	        		String seqData = "0001";
        	        		Date dData = new Date();
        	        		SimpleDateFormat sdfData = new SimpleDateFormat("yyyyMMddHHmmss");
        	    			String timestampData = sdf.format(dData);
        	                System.out.println("当前时间："+sdfData.format(d));
        	        		String srcData = OperatorID + enDataStr + timestampData + seqData;
        	        		byte[] macmd5Data = HMacMD5Util.getHmacMd5Bytes(sKey.getBytes(), srcData.getBytes());
        	                String sigSendData = HMacMD5Util.bytesToHexString(macmd5Data).toUpperCase();
        	                
        	                //组装要传的字符串
        	        		StringBuffer sbSendData = new StringBuffer();
        	        		sbSendData.append("{");
        	        		sbSendData.append("\"OperatorID\":").append("\"").append(OperatorID).append("\",");
        	        		sbSendData.append("\"Data\":").append("\"").append(enDataStr).append("\",");
        	    			sbSendData.append("\"TimeStamp\":").append("\"").append(timestampData).append("\",");
        	    			sbSendData.append("\"Seq\":").append("\"").append(seqData).append("\",");
        	    			sbSendData.append("\"Sig\":").append("\"").append(sigSendData).append("\"");
        	    			sbSendData.append("}");
        	    			
        	    			System.out.println(sbSendData.toString());
        	    			String result=SendToCdzHttpUtil.post(urlSendData, sbSendData.toString(), accessToken);
        	    			JSONObject resultObj = new JSONObject();
        	    			resultObj = (JSONObject) JSONValue.parse(result);
                        	String resultMsg = (String) resultObj.get("Msg");
        	    			
        	    			if(resultMsg.contains("请求成功！")){
    	            			UpdateChargingPileVO chargingPileVO = new UpdateChargingPileVO();
    	            			chargingPileVO.setInstallationNo(vo.getInstallationNo());
    	            			//新增序列
    	            			chargingPileVO.setIfSeq(vo.getIfSeq());
    	            			chargingPileVO.setIfresult("Z");
    	            			chargingPileVO.setIffailmsg("SUCCESS");
    	            			chargingPileService.updateChargingPileIs(chargingPileVO);
        	    			}else{
        	    				UpdateChargingPileVO chargingPileVO = new UpdateChargingPileVO();
    	            			chargingPileVO.setInstallationNo(vo.getInstallationNo());
    	            			//新增序列
    	            			chargingPileVO.setIfSeq(vo.getIfSeq());
    	            			chargingPileVO.setIfresult("E");
    	            			chargingPileVO.setIffailmsg(resultMsg);
    	            			chargingPileService.updateChargingPileIs(chargingPileVO);
        	    			}
        	        	}
            		}
            	}
            }else if("DmsToTbrat001".equals(ifId)){
            	//往北理工发即溯源系统
            	String limit = "1000";//单次传输条数;
            	ReceiveSaleVehicleVO searchVO = new ReceiveSaleVehicleVO();
        		searchVO.setLimit(limit);
        		List<Map<String,Object>> vehicleList=new ArrayList<>();
        		List<ReceiveSaleVehicleVO> vos = chargingPileService.selectSaleVehicleList(searchVO);
        		for(int i=0;i<vos.size();i++){
    	            Map<String,Object> vehicle=new HashMap<>();
    	            ReceiveSaleVehicleVO vo = (ReceiveSaleVehicleVO)vos.get(i);
    	            vehicle.put("vin", vo.getVinNo());
    	            vehicle.put("licensePlate", vo.getLicensePlate());
    	            
    	            if("租赁乘用车".equals(vo.getVehTypeName())) {
    	            	vehicle.put("vehTypeName", "111807");
    	            }else if("公务乘用车".equals(vo.getVehTypeName())) {
    	            	vehicle.put("vehTypeName", "111805");
    	            }else if("出租乘用车".equals(vo.getVehTypeName())) {
    	            	vehicle.put("vehTypeName", "111806");
    	            }else if("私人乘用车".equals(vo.getVehTypeName())) {
    	            	vehicle.put("vehTypeName", "111808");
    	            }else {
    	            	//vehicle.put("vehTypeName", "111808");
    	            	//如果以前都不满足，传给溯源系统为下面数据，贾明 2020-6-29 
    	            	vehicle.put("vehTypeName", vo.getVehTypeName());
    	            }
    	            vehicle.put("saleTime", vo.getSaleTime());
    	            vehicle.put("saleArea", vo.getSaleArea());
    	            vehicle.put("ownerName", vo.getOwnerName());
    	            vehicle.put("Idnum",vo.getIdnum());
    	            vehicle.put("epname", vo.getEpname());
    	            vehicle.put("epaddress", vo.getEpaddress());
    	            vehicle.put("epcode", vo.getEpcode());
    	            vehicleList.add(vehicle);
        		}
                String result = SendToBlgHttpUtil.receiveSaleVehicle(vehicleList);
//                System.out.println(result);
                //修改回传的errorMessages里面没有包含的车为成功状态，后面处理失败的车都会有返回的错误信息
        		for(int i=0;i<vos.size();i++){
        			ReceiveSaleVehicleVO vo = (ReceiveSaleVehicleVO)vos.get(i);
        			//如果回传回来的错误信息不包含的车作为成功来更新
        			if(result.indexOf(vo.getVinNo())==-1){
            			vo.setIfresult("Z");
            			vo.setIffailmsg("SUCCESS");
            			chargingPileService.updateReceiveSalesVehicleIs(vo);
        			}
        		}
                
                if(null!=result&&!"".equals(result)){
    	            JSONObject resultJSON = new JSONObject();
    	            resultJSON = (JSONObject)JSONValue.parse(result);
                	//如果errorMessages是空对象，代表没有任何错误
                	if(null!=resultJSON&&null!=resultJSON.get("errorMessages")){
                		JSONArray resultArray = new JSONArray();
                		resultArray = (JSONArray)resultJSON.get("errorMessages");
                		//解析反馈的errorMessages，将其中的错误车辆信息根据反馈结果进行更新
                		for(int i=0;i<resultArray.size();i++){
                			JSONObject resultError = (JSONObject)resultArray.get(i);
                			ReceiveSaleVehicleVO vo = new ReceiveSaleVehicleVO();
                			if(null!=resultError&&!"".equals((String)resultError.get("id")))
                			vo.setVinNo((String)resultError.get("id"));
                			vo.setIfresult("E");
                			if(null!=resultError&&!"".equals((String)resultError.get("message"))){
                				vo.setIffailmsg((String)resultError.get("message"));
                			}
                			chargingPileService.updateReceiveSalesVehicleIs(vo);
                		}
                	}
                }
                //销售数据发送监控平台
            }else if("DmsToMonitor001".equals(ifId)){
//            	System.out.println("HttpClientSendJobBean DmsToMonitor001——2");
            	String limit = "200";//单次传输条数;
            	SalesVehicleMonitorVO searchVO = new SalesVehicleMonitorVO();
        		searchVO.setLimit(limit);
        		List<Map<String,Object>> vehicleList=new ArrayList<>();
        		List<SalesVehicleMonitorVO> vos = chargingPileService.selectSalesMonitorList(searchVO);
        		for(int i=0;i<vos.size();i++){
    	            Map<String,Object> vehicle=new HashMap<>();
    	            SalesVehicleMonitorVO vo = (SalesVehicleMonitorVO)vos.get(i);
    	            vehicle.put("vin", vo.getVin());
    	            vehicle.put("sellTime", vo.getSellTime());
    	            vehicle.put("sellCity", vo.getSellCity());
    	            vehicle.put("dealerName", vo.getDealerName());
    	            vehicle.put("dealerCode", vo.getDealerCode());
    	            vehicle.put("carLicense", vo.getCarLicense());
    	            vehicle.put("carLicenseColor", vo.getCarLicenseColor());
    	            vehicle.put("saveCity", vo.getSaveCity());
    	            vehicle.put("saveAddress", vo.getSaveAddress());
    	            vehicle.put("driveLicenseNo", vo.getDriveLicenseno());
    	            vehicle.put("licenseRegisterDate", vo.getLicenseRegisterDate());
    	            vehicle.put("licenseGrantDate", vo.getLicenseGrantDate());
    	            //客户类型个人还是公司转化
    	            if(null==vo.getCustomerType()||"01".equals(vo.getCustomerType())||"1".equals(vo.getCustomerType())){
    	            	vehicle.put("customerType", "1");
    	            }else if("02".equals(vo.getCustomerType())||"2".equals(vo.getCustomerType())){
    	            	vehicle.put("customerType", "2");
    	            }else{
    	            	vehicle.put("customerType", "1");
    	            }
    	            vehicle.put("privateOwnerName", vo.getPrivateOwnerName());
    	            vehicle.put("privateOwnerIdentity", vo.getPrivateOwnerIdentity());
    	            vehicle.put("privateOwnerPhone", vo.getPrivateOwnerPhone());
    	            vehicle.put("privateOwnerAddress", vo.getPrivateOwnerAddress());
    	            vehicle.put("unitName", vo.getUnitName());
    	            vehicle.put("vehUseFor", vo.getVehUseFor());
    	            vehicle.put("organizationCode", vo.getOrganizationCode());
    	            vehicle.put("legalPersonName", vo.getLegalPersonName());
    	            vehicle.put("legalPersonPhone", vo.getLegalPersonPhone());
    	            vehicle.put("legalPersonAddress", vo.getLegalPersonAddress());
    	            
    	            vehicleList.add(vehicle);
        		}
//        		System.out.println("HttpClientSendJobBean vehicleList1");
        		//有数据才发起请求
        		if(vehicleList.size()>0){
	                String result = SendToMonitorHttpUtil.sendToMonitor(vehicleList);
	//                System.out.println(result);
//	                System.out.println("HttpClientSendJobBean DmsToMonitor001 result1" + result);
	                if(null!=result&&!"".equals(result)){
	                	//如果errorMessages是空对象，代表没有任何错误
	            		JSONArray resultArray = (JSONArray)JSONValue.parse(result);
	            		//解析反馈的errorMessages，将其中的错误车辆信息根据反馈结果进行更新
	            		for(int i=0;i<resultArray.size();i++){
	            			JSONObject resultError = (JSONObject)resultArray.get(i);
	            			SalesVehicleMonitorVO vo = new SalesVehicleMonitorVO();
	            			if(null!=resultError&&!"".equals((String)resultError.get("id")))
	            			vo.setVin((String)resultError.get("id"));
	            			//没有报错信息，就修改为Z，SUCCESS，有错误信息就改为E和具体的错误信息
	            			if(null==resultError||null==resultError.get("errorMessages")||"".equals((String)resultError.get("errorMessages"))||"null".equals((String)resultError.get("errorMessages")))
	            			{
	            				vo.setIffailmsg("SUCCESS");
	            				vo.setIfresult("Z");
	            			}else if(null!=resultError&&null!=resultError.get("errorMessages")&&!"".equals((String)resultError.get("errorMessages"))&&!"null".equals((String)resultError.get("errorMessages"))){
	            				vo.setIffailmsg((String)resultError.get("errorMessages"));
	            				vo.setIfresult("E");
	            			}
	            			chargingPileService.updateSalesMonitorIs(vo);
	            		}
	                }
        		}
            }
        }catch(Exception e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        	throw new JobExecutionException(e.getMessage(), e);
        }
    }
    
    /* 
     * 将时间转换为时间戳
     */    
    public static String dateToStamp(String s) throws ParseException{
        String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = simpleDateFormat.parse(s);
        long ts = date.getTime();
        res = String.valueOf(ts).substring(0, 10);
        return res;
    }
}
