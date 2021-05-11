package chn.bhmc.dms.bat.httpUtils;


import com.fasterxml.jackson.databind.ObjectMapper;
import jodd.http.HttpRequest;
import jodd.http.HttpResponse;
import jodd.json.JsonSerializer;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StringUtils;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by zhang yufei on 2018/7/3.
 */
public class SendToMonitorHttpUtil {

    /**
     * 主机厂平台地址
     * 此地址改为系统部署后的映射地址，以下地址位北理工对外地址，可首次测试使用
     */
//    public static String ip1 = "http://192.144.214.48:8888";//开发人员本机测试地址
    public static String ip1 = "http://10.37.93.164:48000";//生产运营内网地址
//    public static String ip1 = "http://106.39.12.16:48000";//生产运营外网地址
    //主机厂调用接口令牌，由乙方技术支持提供，且需由甲方提供主机厂全称及统一厂商社会信用代码
    public static String vehicle_token="N/C2vZRtDyvAQ0odvvre2B5w/eprt20+";
    //主机厂调用接口密钥，由乙方技术支持提供
    public static String vehicle_key="d1f83f777809cd66a43d40a43d5276bb";
    //电池厂调用接口令牌，由乙方技术支持提供，且需由甲方提供电池厂全称及统一厂商社会信用代码
    public static String factory_token="pOAJJSBmAThb8kPJh4VAX+zs/YAHFqxd";
    //电池厂调用接口密钥，由乙方技术支持提供
    public static String factory_key="vAREamtPvwanVe2M";

    public static void main(String args[]) {
        long start = System.currentTimeMillis();
        System.out.println("开始 "+start);
        try{
        //1.主机厂车辆生产
        //createVehiclePack();
        //2.电池厂电池生产
        //createBatteryPack();
        //3.主机厂车辆销售
        createSale();
        //4.电池厂售后
        //createReplaceBattery();
        //5.主机厂维修
        //createReplaceRecord();
        //6.电池厂维修
        //createFactoryRepair();
        //7.主机厂回收网点入库
        //createRecoverStorage();
        //8.主机厂回收网点退役
        //createRetireVehicle();
        //9.主机厂车辆换电入库
        //createReplaceBatteryInStorage();
        //10.主机厂车辆换电记录
        //createReplaceReplacement();
        //11.主机厂车辆换电维修
        //createReplaceRepair();
        //12.主机厂车辆换电退役
        //createReplaceRetire();
        //13.电池厂电池退役
        //createRetireFactory();



        //getBatteryIsImport();
        //getBatteryIsBindingsVIN();
        }catch(Exception e){
        	e.printStackTrace();
        }
        long end = System.currentTimeMillis();
        System.out.println("完成 "+end);// + (end - start)
    }

    /*public static void createVehiclePack(){
        List<String> packList=new ArrayList<>();
        packList.add("P100");
        Map<String,Object> vinMap=new HashMap<>();
        vinMap.put("vin","");
        vinMap.put("vehModelName","vehModel01");
        vinMap.put("packCodeList",packList);
        vinMap.put("systemCode","S001");
        vinMap.put("offlineProductionTime","2018-01-01 00:00:00");
        vinMap.put("vehicleBrand","奔驰");
        vinMap.put("vehicleName","奔驰");
        vinMap.put("vehicleType","1");
        List<Map<String,Object>> vinList=new ArrayList<>();
        vinList.add(vinMap);
        Map<String,Object> vehicleMap=new HashMap<>();
        vehicleMap.put("vinList",vinList);
        HttpResponse response = send(ip1+"/bitnei/v1.0/battery/vehicle/receiveVehicleProduce", vehicleMap, vehicle_token, vehicle_key);
        String result = parsToMap(response, vehicle_key);
        System.out.println(result);
    }

    public static void createBatteryPack(){
        List<String> cellList1=new ArrayList<>();
        cellList1.add("C111");
        Map<String,Object> module1=new HashMap<>();
        module1.put("code","M110");
        module1.put("cellList",cellList1);
        module1.put("modelId","zhangM");
        module1.put("cellModelId","zhangC");
        List<Map<String,Object>> moduleList1=new ArrayList<>();
        moduleList1.add(module1);
        Map<String,Object> pack1=new HashMap<>();
        pack1.put("code","P100");
        pack1.put("moduleList",moduleList1);
        pack1.put("serial","1");
        pack1.put("modelId","zhangP");
        pack1.put("systemId","S001");
        pack1.put("systemModelId","zhangS");
        pack1.put("orderNo","o001");
        List<Map<String,Object>> packList=new ArrayList<>();
        packList.add(pack1);
        HttpResponse response = send(ip1+"/bitnei/v1.0/battery/vehicle/receiveBatteryProduce", packList, factory_token, factory_key);
        String result = parsToMap(response, factory_key);
        System.out.println(result);
    }
    */

    public static void createSale() throws Exception{
        List<Map<String,Object>> vehicleList=new ArrayList<>();
        Map<String,Object> vehicle=new HashMap<>();
        vehicle.put("vin", "LNBSCB3F0DD130955");
        vehicle.put("sellTime", "2019-06-20 15:34:55");
        vehicle.put("sellCity", "北京");
        vehicle.put("dealerCode", "D2327");
        vehicle.put("dealerName", "湖南省珈同汽车销售服务有限公司");
//        vehicle.put("sellerName", "王超");
        vehicle.put("carLicense", "京A30204");
        vehicle.put("carLicenseColor", "1");
        vehicle.put("saveCity", "北京");
        vehicle.put("saveAddress", "霄云路38号");
        vehicle.put("driveLicenseNo", "7A239934213");
        vehicle.put("licenseRegisterDate", "2015-06-39");
        vehicle.put("licenseGrantDate", "2015-06-39");
        vehicle.put("customerType", "1");//新增
        vehicle.put("privateOwnerName", "李德");
        vehicle.put("privateOwnerIdentity", "220104198203224517");
        vehicle.put("privateOwnerPhone", "13943189898");//新增
        vehicle.put("privateOwnerAddress", "霄云路38号霞光里院内");//新增
        vehicle.put("unitName", "北京现代");
        vehicle.put("vehUseFor", "5");
        vehicle.put("organizationCode", "BHMC30293");
        vehicle.put("legalPersonName", "张大懵");
        vehicle.put("legalPersonPhone", "13943189898");
        vehicle.put("legalPersonAddress", "北京鼓楼四合院");
//        vehicle.put("domain", "1");//删除
//        vehicle.put("licenseCity", "北京");//删除
//        vehicle.put("useProperty", "2");//删除
//        vehicle.put("useUnit", "无");//删除
//        vehicle.put("chargingPileCity", "北京");//删除
//        vehicle.put("chargingPileAddress", "霄云路38号霞光里院内");//删除
//        vehicle.put("noticeName", "李德来");//删除
//        vehicle.put("configName", "吉林省长春市");//删除
//        vehicle.put("unitType", "合资");//删除
//        vehicle.put("unitCode", "BHMC");//删除
        
        vehicleList.add(vehicle);
        
        HttpResponse response = send(ip1+"/open/v1/dmsInfo/addOrUpdate", vehicleList, vehicle_token, vehicle_key);
        String result = parsToMap(response, vehicle_key);
        System.out.println(result);
        
        String data = decrypt(result,vehicle_key);
        System.out.println(data);
        
        /*Map<String,Object> vehicle=new HashMap<>();
        vehicle.put("termNo", "LNBSCB3F0DD130955");
        vehicle.put("iccid", "2019-06-20 15:34:55");
        vehicle.put("imei", "北京");
        
        vehicleList.add(vehicle);
        HttpResponse response = send(ip1+"/open/v1/term/addOrUpdate", vehicleList, vehicle_token, vehicle_key);
        
        String result = parsToMap(response, vehicle_key);
        System.out.println(result);
        */
        
    }
    
    public static String sendToMonitor(List<Map<String,Object>> vehicleList) throws Exception{
        HttpResponse response = send(ip1+"/open/v1/dmsInfo/addOrUpdate", vehicleList, vehicle_token, vehicle_key);
        String result = parsToMap(response, vehicle_key);
//        System.out.println(result);
        return result;
    }

    /*
    public static void createReplaceBattery(){
        Map<String,Object> cell1=new HashMap<>();
        cell1.put("code","C211");
        cell1.put("type","C");
        List<Map<String,Object>> cellList1=new ArrayList<>();
        cellList1.add(cell1);
        Map<String,Object> module1=new HashMap<>();
        module1.put("code","M210");
        module1.put("childCodeList",cellList1);
        module1.put("modelId","zhangM");
        module1.put("type","M");
        List<Map<String,Object>> moduleList1=new ArrayList<>();
        moduleList1.add(module1);
        Map<String,Object> pack1=new HashMap<>();
        pack1.put("code","P200");
        pack1.put("childCodeList",moduleList1);
        pack1.put("modelId","zhangP");
        pack1.put("type","P");
        pack1.put("orderCode","R001");
        List<Map<String,Object>> packList=new ArrayList<>();
        packList.add(pack1);
        HttpResponse response = send(ip1+"/bitnei/v1.0/battery/sail/receiveReplaceBattery", packList, factory_token, factory_key);
        String result = parsToMap(response, factory_key);
        System.out.println(result);
    }

    public static void createReplaceRecord(){
        List<Map<String,Object>> recordList=new ArrayList<>();
        Map<String,Object> record=new HashMap<>();
        record.put("vin", "LNBSCB3F0DD130955");
        record.put("replaceDate", "2018-01-05");
        record.put("oldCode", "P100");
        record.put("whereaboutsId", "123456789123456789");
        record.put("whereaboutsName", "维修厂");
        record.put("newCode", "P200");
        record.put("batterySpecies", "P");
        recordList.add(record);
        HttpResponse response = send(ip1+"/bitnei/v1.0/battery/sail/receiveReplaceRecord", recordList, vehicle_token, vehicle_key);
        String result = parsToMap(response, vehicle_key);
        System.out.println(result);
    }

    public static void createFactoryRepair(){
        Map<String,Object> cell1=new HashMap<>();
        cell1.put("code","C311");
        cell1.put("type","C");
        List<Map<String,Object>> cellList1=new ArrayList<>();
        cellList1.add(cell1);
        Map<String,Object> module1=new HashMap<>();
        module1.put("code","M310");
        module1.put("childCodeList",cellList1);
        module1.put("type","M");
        List<Map<String,Object>> moduleList1=new ArrayList<>();
        moduleList1.add(module1);
        Map<String,Object> pack1=new HashMap<>();
        pack1.put("code","P300");
        pack1.put("childCodeList",moduleList1);
        pack1.put("type","P");
        pack1.put("orderCode","R001");
        List<Map<String,Object>> repairList=new ArrayList<>();
        Map<String,Object> repair=new HashMap<>();
        repair.put("vin", "LNBSCB3F0DD130955");
        repair.put("replaceDate", "2018-01-05");
        repair.put("oldCode", "P200");
        repair.put("whereaboutsId", "123456789123456789");
        repair.put("whereaboutsName", "维修厂");
        repair.put("newCodeBean", pack1);
        repair.put("batterySpecies", "P");
        repairList.add(repair);
        HttpResponse response = send(ip1+"/bitnei/v1.0/battery/sail/receiveReplaceOld", repairList, factory_token, factory_key);
        String result = parsToMap(response, factory_key);
        System.out.println(result);
    }

    public static void createRecoverStorage(){
        List<Map<String,Object>> recoverStorageList=new ArrayList<>();
        Map<String,Object> recoverStorage=new HashMap<>();
        recoverStorage.put("storageDate", "2018-01-05");
        recoverStorage.put("recoverUnitCode", "123456789123456789");
        recoverStorage.put("recoverUnitName", "维修厂");
        recoverStorage.put("code", "P400");
        recoverStorage.put("batterySpecies", "P");
        recoverStorageList.add(recoverStorage);
        HttpResponse response = send(ip1+"/bitnei/v1.0/battery/recover/receiveRecoverStorage", recoverStorageList, vehicle_token, vehicle_key);
        String result = parsToMap(response, vehicle_key);
        System.out.println(result);
    }

    public static void createRetireVehicle(){
        List<Map<String,Object>> retireVehicleList=new ArrayList<>();
        Map<String,Object> retireVehicle=new HashMap<>();
        retireVehicle.put("code", "P400");
        retireVehicle.put("whereaboutsCode", "123456789123412341");
        retireVehicle.put("whereaboutsName", "维修厂");
        retireVehicle.put("retireDate", "2018-01-05");
        retireVehicle.put("batterySpecies", "P");
        retireVehicle.put("retireUnitCode", "123456789123123123");
        retireVehicle.put("retireUnitName", "退役厂商");
        retireVehicle.put("factoryType", "5");
        retireVehicle.put("batteryType", "A");
        retireVehicle.put("batteryWeight", "2.5");
        retireVehicleList.add(retireVehicle);
        HttpResponse response = send(ip1+"/bitnei/v1.0/battery/sail/receiveRetiredOldVehicle", retireVehicleList, vehicle_token, vehicle_key);
        String result = parsToMap(response, vehicle_key);
        System.out.println(result);
    }

    public static void createReplaceBatteryInStorage(){
        List<String> cellList1=new ArrayList<>();
        cellList1.add("C511");
        Map<String,Object> module1=new HashMap<>();
        module1.put("code","M510");
        module1.put("cellList",cellList1);
        module1.put("cellCodeSize","1");
        List<Map<String,Object>> moduleList1=new ArrayList<>();
        moduleList1.add(module1);
        Map<String,Object> pack1=new HashMap<>();
        pack1.put("code","P500");
        pack1.put("moduleList",moduleList1);
        pack1.put("replaceUnitCode","123456789123412342");
        pack1.put("replaceUnitName","换电厂");

        List<String> cellList2=new ArrayList<>();
        cellList2.add("C611");
        Map<String,Object> module2=new HashMap<>();
        module2.put("code","M610");
        module2.put("cellList",cellList2);
        module2.put("cellCodeSize","1");
        List<Map<String,Object>> moduleList2=new ArrayList<>();
        moduleList2.add(module2);
        Map<String,Object> pack2=new HashMap<>();
        pack2.put("code","P600");
        pack2.put("moduleList",moduleList2);
        pack2.put("replaceUnitCode","123456789123412342");
        pack2.put("replaceUnitName","换电厂");

        List<Map<String,Object>> packList=new ArrayList<>();
        packList.add(pack1);
        packList.add(pack2);

        HttpResponse response = send(ip1+"/bitnei/v1.0/battery/replaceBattery/batteryInStorage", packList, vehicle_token, vehicle_key);
        String result = parsToMap(response, factory_key);
        System.out.println(result);
    }

    public static void createReplaceReplacement(){
        List<Map<String,Object>> recordList=new ArrayList<>();
        Map<String,Object> record=new HashMap<>();
        record.put("vin", "LNBSCB3F0DD130955");
        record.put("oldCode", "P500");
        record.put("newCode", "P600");
        record.put("replaceUnitCode","123456789123412342");
        record.put("replaceUnitName","换电厂");
        record.put("replaceDate", "2018-01-05");
        recordList.add(record);
        HttpResponse response = send(ip1+"/bitnei/v1.0/battery/replaceBattery/replacementBattery", recordList, vehicle_token, vehicle_key);
        String result = parsToMap(response, vehicle_key);
        System.out.println(result);
    }

    public static void createReplaceRepair(){
        Map<String,Object> cell1=new HashMap<>();
        cell1.put("code","C711");
        cell1.put("type","C");
        List<Map<String,Object>> cellList1=new ArrayList<>();
        cellList1.add(cell1);
        Map<String,Object> module1=new HashMap<>();
        module1.put("code","M710");
        module1.put("childCodeList",cellList1);
        module1.put("type","M");
        List<Map<String,Object>> moduleList1=new ArrayList<>();
        moduleList1.add(module1);
        Map<String,Object> pack1=new HashMap<>();
        pack1.put("code","P700");
        pack1.put("childCodeList",moduleList1);
        pack1.put("type","P");
        List<Map<String,Object>> repairList=new ArrayList<>();
        Map<String,Object> repair=new HashMap<>();
        repair.put("vin", "LNBSCB3F0DD130955");
        repair.put("repairDate", "2018-01-05");
        repair.put("oldCode", "P600");
        repair.put("newCode", "P700");
        repair.put("newCodeBean", pack1);
        repair.put("retireUnitCode", "123456789123412341");
        repair.put("retireUnitName", "维修厂");
        repair.put("whereaboutsCode", "123456789123412342");
        repair.put("whereaboutsName", "出库厂");
        repairList.add(repair);
        HttpResponse response = send(ip1+"/bitnei/v1.0/battery/replaceBattery/replaceRepairBattery", repairList, vehicle_token, vehicle_key);
        String result = parsToMap(response, factory_key);
        System.out.println(result);
    }

    public static void createReplaceRetire(){
        List<Map<String,Object>> retireVehicleList=new ArrayList<>();
        Map<String,Object> retireVehicle=new HashMap<>();
        retireVehicle.put("code", "P500");
        retireVehicle.put("whereaboutsCode", "123456789123456789");
        retireVehicle.put("whereaboutsName", "电池厂");
        retireVehicle.put("retireDate", "2018-01-05");
        retireVehicle.put("batterySpecies", "P");
        retireVehicle.put("retireUnitCode", "123456789123123123");
        retireVehicle.put("retireUnitName", "退役厂商");
        retireVehicle.put("factoryType", "4");
        retireVehicle.put("batteryType", "A");
        retireVehicle.put("batteryWeight", "2.5");
        retireVehicleList.add(retireVehicle);
        HttpResponse response = send(ip1+"/bitnei/v1.0/battery/sail/receiveRetiredOldReplace", retireVehicleList, vehicle_token, vehicle_key);
        String result = parsToMap(response, vehicle_key);
        System.out.println(result);
    }

    public static void createRetireFactory(){
        List<Map<String,Object>> retireVehicleList=new ArrayList<>();
        Map<String,Object> retireVehicle=new HashMap<>();
        retireVehicle.put("code", "P200");
        retireVehicle.put("whereaboutsCode", "123456789123456789");
        retireVehicle.put("whereaboutsName", "电池厂");
        retireVehicle.put("retireDate", "2018-01-05");
        retireVehicle.put("batterySpecies", "P");
        retireVehicle.put("retireUnitCode", "123456789123123123");
        retireVehicle.put("retireUnitName", "退役厂商");
        retireVehicle.put("factoryType", "2");
        retireVehicle.put("batteryType", "A");
        retireVehicle.put("batteryWeight", "2.5");
        retireVehicleList.add(retireVehicle);
        HttpResponse response = send(ip1+"/bitnei/v1.0/battery/sail/receiveRetiredOld", retireVehicleList, factory_token, factory_key);
        String result = parsToMap(response, vehicle_key);
        System.out.println(result);
    }*/

    public static HttpResponse send(String url, Object data, String token, String key)  throws Exception{
        Map<String, Object> requestMap = new HashMap<String, Object>();
        String requestMsg = new JsonSerializer().deep(true).serialize(data);
//            String requestMsg = "[{\"legalPersonPhone\":null,\"vehUseFor\":null,\"dealerName\":\"chf测试经销商\",\"sellCity\":\"广州\",\"unitName\":null,\"dealerCode\":\"chfTestCode\",\"saveCity\":\"珠海\",\"privateOwnerAddress\":\"广东珠海\",\"legalPersonAddress\":null,\"carLicense\":\"测CHF001\",\"carLicenseColor\":1,\"legalPersonName\":null,\"privateOwnerIdentity\":\"ceshiyige\",\"privateOwnerPhone\":\"18788991452\",\"customerType\":1,\"privateOwnerName\":\"陈cc\",\"saveAddress\":\"珠海市唐家大洲科技园\",\"organizationCode\":null,\"licenseGrantDate\":\"2019-04-09\",\"driveLicenseNo\":\"testDrive001\",\"vin\":\"chftestvinf20196131\",\"licenseRegisterDate\":\"2019-04-01\",\"sellTime\":\"2019-01-01\"},{\"legalPersonPhone\":\"18900101564\",\"vehUseFor\":2,\"dealerName\":\"珠海测试经销商\",\"sellCity\":\"深圳\",\"unitName\":\"chf测试运营公司\",\"dealerCode\":\"testcode001\",\"saveCity\":\"江门\",\"privateOwnerAddress\":null,\"legalPersonAddress\":\"不说了吧\",\"carLicense\":\"测CHF002\",\"carLicenseColor\":1,\"legalPersonName\":\"陈华锋\",\"privateOwnerIdentity\":null,\"privateOwnerPhone\":null,\"customerType\":2,\"privateOwnerName\":null,\"saveAddress\":\"江门测试地址\",\"organizationCode\":\"CHFSISJFS0012\",\"licenseGrantDate\":\"2019-06-09\",\"driveLicenseNo\":\"HFTest0001\",\"vin\":\"chftestvinf20196132\",\"licenseRegisterDate\":\"2019-05-01\",\"sellTime\":\"2019-01-01\"}]";
//            System.out.println(requestMsg);
        String str = encrypt(requestMsg, key);
//        System.out.println("str======  : "+str);
        String enStr = str;
        if (str!=null) {
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			Matcher m = p.matcher(str);
			enStr = m.replaceAll("");
		}
//        System.out.println("enStr======  : "+enStr);
        
        requestMap.put("requestMsg", enStr);
        requestMap.put("timestamp", System.currentTimeMillis());
        String sign = byteArrayToHexString(encryptHMAC(enStr.getBytes(), key));
        requestMap.put("sign", sign);
//        System.out.println("HttpClientSendJobBean DmsToMonitor001 send");
        HttpResponse response = getRequest(url, token, requestMap).send().unzip().unzip();
//        System.out.println("HttpClientSendJobBean DmsToMonitor001 response back");
        return response;
    }

    public static String parsToMap( HttpResponse response,String key) throws Exception{
//		System.out.println("SendToMonitorHttpUtil2 parsToMap  ");
        ObjectMapper mapper = new ObjectMapper();
        Map map = mapper.readValue(response.body(), Map.class);
        String result="";
        if(isNotEmpty(map.get("data"))){
        	//result = map.get("data").toString();
//        	System.out.println(map.get("data").toString());
        	result = decrypt(map.get("data").toString(),key);
        }else {
//        	System.out.println(map.get("msg").toString());
            result = map.get("msg").toString();
        }
//    	System.out.println("SendToMonitorHttpUtil2 result  "+result);
        //获取到参数对应的二进制数
        byte[] temp = result.getBytes("iso-8859-1");
        //通过对应的二进制数 手动编码成utf-8的字符串
        result = new String(temp, "utf-8");
        return result;
    }

    public static String encrypt(String content, String password) {
        try {
            if(StringUtils.isEmpty(content)) {
                return "";
            }
            KeyGenerator kgen = KeyGenerator.getInstance("AES");
            SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
            secureRandom.setSeed(password.getBytes());
            kgen.init(128, secureRandom);
            SecretKey secretKey = kgen.generateKey();
            byte[] enCodeFormat = secretKey.getEncoded();
            SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
            BASE64Encoder coder = new BASE64Encoder();
            coder.encode(enCodeFormat);
            Cipher cipher = Cipher.getInstance("AES");
            byte[] byteContent = content.getBytes("utf-8");
            cipher.init(1, key);
            byte[] result = cipher.doFinal(byteContent);
            String str = new BASE64Encoder().encode(result);
//            String str = Base64.encode(result);
            return str;
        } catch (NoSuchAlgorithmException var13) {
            ;
        } catch (NoSuchPaddingException var14) {
            ;
        } catch (InvalidKeyException var15) {
            ;
        } catch (UnsupportedEncodingException var16) {
            ;
        } catch (IllegalBlockSizeException var17) {
            ;
        } catch (BadPaddingException var18) {
            ;
        }
        return null;
    }

    public static boolean isNotEmpty(Object o) {
        if (o == null) {
            return false;
        }
        if ("".equals(FilterNull(o.toString()))) {
            return false;
        } else {
            return true;
        }
    }

    public static String FilterNull(Object o) {
        return o != null && !"null".equals(o.toString()) ? o.toString().trim() : "" ;
    }

    public static String decrypt(String str, String password) {
        try {
        	byte[] content = new BASE64Decoder().decodeBuffer(str);//先用base64解密
//            byte[] content = Base64.decode(str);
            KeyGenerator kgen = KeyGenerator.getInstance("AES");
            SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
            secureRandom.setSeed(password.getBytes());
            kgen.init(128, secureRandom);
            SecretKey secretKey = kgen.generateKey();
            byte[] enCodeFormat = secretKey.getEncoded();
            SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
            Cipher cipher = Cipher.getInstance("AES");
            cipher.init(2, key);
            byte[] result = cipher.doFinal(content);
            return new String(result, "UTF-8");
        } catch (NoSuchAlgorithmException var10) {
            ;
        } catch (NoSuchPaddingException var11) {
            ;
        } catch (InvalidKeyException var12) {
            ;
        } catch (IllegalBlockSizeException var13) {
            ;
        } catch (BadPaddingException var14) {
            ;
        } catch (Exception var15) {
            ;
        }
        return "";
    }

    public static byte[] encryptHMAC(byte[] data, String key) throws Exception {
        SecretKey secretKey = new SecretKeySpec(key.getBytes(), "HmacMD5");
        Mac mac = Mac.getInstance(secretKey.getAlgorithm());
        mac.init(secretKey);
        return mac.doFinal(data);
    }

    public static String byteArrayToHexString(byte[] bytes) {
        StringBuilder sb = new StringBuilder(bytes.length * 2);
        byte[] var2 = bytes;
        int var3 = bytes.length;
        for(int var4 = 0; var4 < var3; ++var4) {
            byte aByte = var2[var4];
            int v = aByte & 255;
            if(v < 16) {
                sb.append('0');
            }
            sb.append(Integer.toHexString(v));
        }
        return sb.toString();
    }

    public static HttpRequest getRequest(String url, String accessToken, Map<String, Object> params) {
    	HttpRequest request = HttpRequest.post(url);
        request.header("Authorization", "Bearer " + accessToken);
        request.header("Content-Type", "application/json;charset=UTF-8");
        request.acceptEncoding("gzip,deflate");
        request.body((new JsonSerializer()).deep(true).serialize(params));
        /*String requestMsg = params.get("requestMsg").toString();
        String sign = params.get("sign").toString();
        String timestamp = params.get("timestamp").toString();
        StringBuilder sb = new StringBuilder();
         sb.append("{");
		 sb.append("\"requestMsg\":").append('"' + requestMsg + '"');
		 sb.append(",\"sign\":").append('"' +sign + '"');
		 sb.append(",\"timestamp\":").append('"'+ timestamp + '"');
	     sb.append("}");
        
	     String parmsJsonStr = sb.toString();
//	     System.out.println("我的值"+parmsJsonStr);
	      request.body(parmsJsonStr);
	      System.out.println("HttpClientSendJobBean DmsToMonitor001 parmsJsonStr1" + parmsJsonStr);
	      */
        return request;
    }
}
