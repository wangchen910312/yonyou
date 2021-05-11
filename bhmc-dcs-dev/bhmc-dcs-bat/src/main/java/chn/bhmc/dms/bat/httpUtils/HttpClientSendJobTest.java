package chn.bhmc.dms.bat.httpUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.cdz.service.ChargingPileService;
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

public class HttpClientSendJobTest{
	
	@Autowired
	EaiClient eaiClient;
	
    @Resource(name="chargingPileService")
    ChargingPileService chargingPileService;
    
    private static String OperatorID="123456789";
    private static String sKey="1234567890abcdef";
    private static String ivParameter="1234567890abcdef";
    private static String urlGetToken = "http://58.215.246.190:8667/cpms/v1.0/query_token";
    private static String urlSendData = "http://58.215.246.190:8667/cpms/v1.0/query_order_create";

    public static void main(String[] args) throws Exception {
        try{

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
        	//获得开票日期磋
    		
        	String invoiceDate = dateToStamp("2019-05-07 12:12:12");
        	
//        	String installationNo = vo.getInstallationNo();
//        	String CustomerName = vo.getCustName();
//        	String CustomerPhone = vo.getCustPhone();
//        	String DelearCode = vo.getDlrCd();
//        	String DelearName = vo.getDlrNm();
//        	String Vehicle = vo.getCarModel();
//        	String VIN = vo.getVinNo();
//        	String Zone = vo.getDivisionName();
//        	String Province = vo.getProvince();
//        	String City = vo.getCity();
//        	String District = vo.getOfficeName();
//        	String Address = vo.getAddress();
//        	String InstallationType = vo.getIsNeed();
        	
        	String installationNo = "FAD2327201904300001";
        	String CustomerName = "测试充电桩";
        	String CustomerPhone = "15756233342";
        	String DelearCode = "D2327";
        	String DelearName = "大同嘉欣";
        	String Vehicle = " 1.6T GLX DCT";
        	String VIN = "LBEMDAFC6HZ110603";
        	String Zone = "华北区";
        	String Province = "吉林";
        	String City = "长春";
        	String District =  "朝阳";
        	String Address = "湖西路进化街";
        	String InstallationType = "1";
        	String Remark = "无";
        	
			//判断是否获取到了token
        	if(null!=accessToken&&!"".equals(accessToken)){
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
    			
//    			ChargingPileVO chargingPileVO = new ChargingPileVO();
//    			chargingPileVO.setInstallationNo(installationNo);
//    			chargingPileService.updateChargingPileIs(chargingPileVO);
            }
        }catch(Exception e){
            throw new Exception(e.getMessage());
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
