package chn.bhmc.dms.bat.sal.cdz.web;


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
import org.quartz.JobExecutionException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.bat.httpUtils.AesCBC;
import chn.bhmc.dms.bat.httpUtils.HMacMD5Util;
import chn.bhmc.dms.bat.httpUtils.SendToBlgHttpUtil;
import chn.bhmc.dms.bat.httpUtils.SendToCdzHttpUtil;
import chn.bhmc.dms.bat.httpUtils.SendToMonitorHttpUtil;
import chn.bhmc.dms.bat.sal.cdz.service.ChargingPileService;
import chn.bhmc.dms.bat.sal.cdz.vo.ReceiveSaleVehicleVO;
import chn.bhmc.dms.bat.sal.cdz.vo.ReturnJSON;
import chn.bhmc.dms.bat.sal.cdz.vo.SalesVehicleMonitorVO;
import chn.bhmc.dms.bat.sal.cdz.vo.UpdateChargingPileVO;

@Controller
@RequestMapping(value = "/salesInter/sal/cdz")
public class ChargingPileController extends HController {
    
	@Resource(name="chargingPileService")
    ChargingPileService chargingPileService;
    
    private static String OperatorID="123456789";
    private static String sKey="1234567890abcdef";
    private static String ivParameter="1234567890abcdef";
    private static String urlGetToken = "http://10.37.93.198:81/cpms/v1.0/query_token";//正式内网获取token
    private static String urlSendData = "http://10.37.93.198:81/cpms/v1.0/query_order_create";//正式内网传数据
//    private static String urlGetToken = "http://10.37.93.197:81/cpms/v1.0/query_token";//测试内网获取token
//    private static String urlSendData = "http://10.37.93.197:81/cpms/v1.0/query_order_create";//测试内网传数据
//    private static String urlGetToken = "http://58.215.246.190:8667/cpms/v1.0/query_token";//测试外网获取token
//    private static String urlSendData = "http://58.215.246.190:8667/cpms/v1.0/query_order_create";//测试外网传数据
    private static String limit = "200";//单次发送数据条数


    /**
     * 充电桩安装信息接口
     * @return chn.bhmc.dms.bat.sal.cmm.service
     */
    /*@SuppressWarnings("unchecked")
	@RequestMapping(value = "/updateChargingPile.do", method = RequestMethod.POST)
    @ResponseBody
    public UpdateChargingPileVO updateChargingPile(@RequestBody UpdateChargingPileVO vo){
    	UpdateChargingPileVO vo1 = new UpdateChargingPileVO(); 
    	String msg;
    	try {
			chargingPileService.updateChargingPile(vo);
			msg="SUCCESS";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg=e.getMessage();
		}
    	vo1.setStatus(msg);
        return vo1;
    }*/
    
    /**
     * 充电桩安装信息接口
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateChargingPile.do", method = RequestMethod.POST)
    @ResponseBody
    public ReturnJSON updateChargingPile(@RequestBody UpdateChargingPileVO vo) throws Exception {
    	ReturnJSON returnJSON = new ReturnJSON();
    	try {
			chargingPileService.updateChargingPile(vo);
  	        returnJSON.setResultCode(200);
  	        returnJSON.setMsg("success");
  	        returnJSON.setInstallationNo(vo.getInstallationNo());
		} catch (Exception e) {
			returnJSON.setResultCode(500);
			returnJSON.setMsg("failed"+e.getMessage());
			returnJSON.setInstallationNo(vo.getInstallationNo());
		}
    	
        return returnJSON;
    }
    
    
    /**
     * 充电桩安装信息接口
     * @param searchVO
     * @return
     * @throws JobExecutionException 
     */
    @RequestMapping(value = "/sendChargingPile.do", method = RequestMethod.POST)
    @ResponseBody
    public ReturnJSON sendChargingPile(@RequestBody UpdateChargingPileVO vo1) throws JobExecutionException{
    	ReturnJSON returnJSON = new ReturnJSON();
        try{	
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
    	        		String invoiceDate = dateToStamp(vo.getInvoiceDateSta());
    	            	
    	            	String installationNo = vo.getInstallationNo()==null?"":vo.getInstallationNo();
    	            	String CustomerName = vo.getCustName()==null?"":vo.getCustName();
    	            	String CustomerPhone = vo.getCustPhone()==null?"":vo.getCustPhone();
    	            	String DelearCode = vo.getDlrCd()==null?"":vo.getDlrCd();
    	            	String DelearName = vo.getDlrNm()==null?"":vo.getDlrNm();
    	            	String Vehicle = vo.getCarModel()==null?"":vo.getCarModel();
    	            	String VIN = vo.getVinNo()==null?"":vo.getVinNo();
    	            	String Zone = vo.getDivisionName()==null?"":vo.getDivisionName();
    	            	if(null!=Zone&&!"".equals(Zone)&&!"其他".equals(Zone)){
    	            		Zone = "华"+Zone;
    	            	}
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
    	    			sb.append("\"Remark\":").append("\"").append(Remark).append("\"");
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
	            			chargingPileVO.setIfresult("Z");
	            			chargingPileVO.setIffailmsg("SUCCESS");
	            			chargingPileService.updateChargingPileIs(chargingPileVO);
    	    			}else{
    	    				UpdateChargingPileVO chargingPileVO = new UpdateChargingPileVO();
	            			chargingPileVO.setInstallationNo(vo.getInstallationNo());
	            			chargingPileVO.setIfresult("E");
	            			chargingPileVO.setIffailmsg(resultMsg);
	            			chargingPileService.updateChargingPileIs(chargingPileVO);
    	    			}
    	        	}
        		}
        	}
    	
	    	returnJSON.setResultCode(200);
			returnJSON.setMsg("success");
        }
        catch(Exception e){
        	returnJSON.setResultCode(200);
    		returnJSON.setMsg(e.getMessage());
    		throw new JobExecutionException(e.getMessage(), e);
        }
    	return returnJSON;
    }
    
    /**
     * 新能源北理工车辆销售接口
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/receiveSaleVehicle.do", method = RequestMethod.POST)
    @ResponseBody
    public ReturnJSON receiveSaleVehicle(@RequestBody ReceiveSaleVehicleVO voIn) throws Exception {
    	ReturnJSON returnJSON = new ReturnJSON();
    	try {
    		ReceiveSaleVehicleVO searchVO = new ReceiveSaleVehicleVO();
    		searchVO.setLimit(limit);
    		List<Map<String,Object>> vehicleList=new ArrayList<>();
    		List<ReceiveSaleVehicleVO> vos = chargingPileService.selectSaleVehicleList(searchVO);
    		for(int i=0;i<vos.size();i++){
	            Map<String,Object> vehicle=new HashMap<>();
	            ReceiveSaleVehicleVO vo = (ReceiveSaleVehicleVO)vos.get(i);
	            vehicle.put("vin", vo.getVinNo());
	            vehicle.put("licensePlate", vo.getLicensePlate());
	            vehicle.put("vehTypeName", vo.getVehTypeName());
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
            System.out.println(result);
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
            
  	        returnJSON.setResultCode(200);
  	        returnJSON.setMsg("success");
		} catch (Exception e) {
			returnJSON.setResultCode(500);
			returnJSON.setMsg("failed"+e.getMessage());
			throw new JobExecutionException(e.getMessage(), e);
		}
    	
        return returnJSON;
    }
    
    /**
     * 新能源监控平台接口
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/sendSalesMonitor.do", method = RequestMethod.POST)
    @ResponseBody
    public ReturnJSON sendSalesMonitor(@RequestBody UpdateChargingPileVO voIn) throws Exception {
    	ReturnJSON returnJSON = new ReturnJSON();
    	try {
    		System.out.println("HttpClientSendJobBean DmsToMonitor001——2");
        	String limit = "200";//单次传输条数;
        	SalesVehicleMonitorVO searchVO = new SalesVehicleMonitorVO();
    		searchVO.setLimit(limit);
    		List<Map<String,Object>> vehicleList=new ArrayList<>();
    		List<SalesVehicleMonitorVO> vos = chargingPileService.selectSalesMonitorList(searchVO);
    		if(null!=vos&&vos.size()>0){
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
		            if(null==vo.getCustomerType()||"01".equals(vo.getCustomerType())){
		            	vehicle.put("customerType", "1");
		            }else if("02".equals(vo.getCustomerType())){
		            	vehicle.put("customerType", "1");
		            }else{
		            	vehicle.put("customerType", vo.getCustomerType());
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
	    		System.out.println("HttpClientSendJobBean vehicleList1");
	            String result = SendToMonitorHttpUtil.sendToMonitor(vehicleList);
	//            System.out.println(result);
	            System.out.println("HttpClientSendJobBean DmsToMonitor001 result1" + result);
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
            
  	        returnJSON.setResultCode(200);
  	        returnJSON.setMsg("success");
		} catch (Exception e) {
			returnJSON.setResultCode(500);
			returnJSON.setMsg("failed"+e.getMessage());
			throw new JobExecutionException(e.getMessage(), e);
		}
    	
        return returnJSON;
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