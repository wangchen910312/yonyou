package chn.bhmc.dms.bat.sal.rcp.service.impl;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import able.com.service.HService;
import chn.bhmc.dms.bat.common.util.DateUtils;
import chn.bhmc.dms.bat.common.util.GlobalStatic;
import chn.bhmc.dms.bat.common.util.HttpUtil;
import chn.bhmc.dms.bat.sal.rcp.service.BatchRcpRictVerifyService;
import chn.bhmc.dms.bat.sal.rcp.service.dao.BatchRcpRictVerifyDAO;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchRcpReceiptVO;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchRcpRictVerifyVO;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchVehicleMasterVO;
import chn.bhmc.dms.core.util.LoginUtil;


/**
 * <p>Title: 机动车发票定时调用集中式接口验证真伪</p>
 * @author Gongrs 2021年3月30日 下午5:04:54
 */
@Service("batchRcpRictVerifyService")
public class BatchRcpRictVerifyServiceImpl extends HService implements BatchRcpRictVerifyService {

    @Resource(name="batchRcpRictVerifyDAO")
    BatchRcpRictVerifyDAO batchRcpRictVerifyDAO;

    @Override
    @SuppressWarnings("static-access")
    public void updateRcpRictVerify() throws Exception {
        /*
         *  查询待验证的机动车发票数据：开票日期非当前日期、验证状态为待验证
         *  原SA_0501T表存放上传发票图片生成的发票数据，业务逻辑不变；增加存放数衍发票机传过来的验证通过的发票数据
         *  新增加SA_0510T表存放APP扫码方式录入的发票数据，经数衍验证通过后将数据同步到SA_0501T表
         */
        List<BatchRcpRictVerifyVO> needVerifyList = batchRcpRictVerifyDAO.selectVerifyList(DateUtils.getCurrentDateTimeStr(DateUtils.DEFAILT_DATE));
        // 新增验证通过的机动车发票数据
        List<BatchRcpReceiptVO> addReceiptList = new ArrayList<BatchRcpReceiptVO>();
        // 更新APP扫码发票验证状态
        List<BatchRcpRictVerifyVO> updateAppReceiptList = new ArrayList<BatchRcpRictVerifyVO>();
        // 更新机动车统一发票验证状态
        List<BatchRcpReceiptVO> updateReceiptList = new ArrayList<BatchRcpReceiptVO>();
        for (BatchRcpRictVerifyVO rictVerifyVO : needVerifyList) {
            // 调用集中式接口入参
            JSONObject param = new JSONObject();
            param.put("regUserId", LoginUtil.getUserId());
            param.put("checkDealerCode", LoginUtil.getDlrCd());
            param.put("receiptCd", rictVerifyVO.getReceiptCd());
            param.put("receiptNo", rictVerifyVO.getReceiptNo());
            param.put("sumAmt", rictVerifyVO.getSumAmt());
            param.put("receiptIssDt", rictVerifyVO.getReceiptIssDt());
            param.put("receiptType", GlobalStatic.RECEIPT_TYPE_3);
            param.put("regDt", DateUtils.getCurrentDateTimeStr());
            
            // 读取配置文件【common.properties】获取接口地址
            Properties proConfUrl = PropertiesLoaderUtils
                    .loadProperties(new ClassPathResource("/config/common.properties"));
            // 发送请求
            HttpUtil httpUtil = new HttpUtil();
            String resJsonStr = httpUtil.httpPost(proConfUrl.getProperty("receiptVerifyUrl"), String.valueOf(param));
            Map<String, Object> resMap = JSON.parseObject(resJsonStr);
            String resCode = String.valueOf(resMap.get("resultCode"));
            if (resCode.equals(GlobalStatic.RESULT_CODE_OK)) {
                // 车辆主键
                String carId = String.valueOf(resMap.get("carId"));
                // 发票店代码
                String receiptDlrCd = String.valueOf(resMap.get("dlrCd"));
                // 车辆店代码
                String carDlrCd = String.valueOf(resMap.get("carDealerCode"));
                
                // 获取发票来源，如果结果是“04(他店票他店车)”则无需处理
                String receiptResource = GlobalStatic.getReceiptResources(LoginUtil.getDlrCd(), receiptDlrCd, carDlrCd);
                
                // 机动车发票是否绑定车辆
                String bindingCarYn = "N";
                // 查询车辆是否存在
                BatchVehicleMasterVO carVO = batchRcpRictVerifyDAO.selectCarInfoByCarId(carId);
                if (carVO!=null) {
                    // 车辆存在
                    BatchVehicleMasterVO vehicleMasterVO = new BatchVehicleMasterVO();
                    vehicleMasterVO.setCarId(carId);
                    // 更新车辆主信息SA_0121T表的绑定发票标识BINDING_RECEIPT_FLAG字段为02
                    vehicleMasterVO.setBindingReceiptFlag(GlobalStatic.BINDING_RECEIPT_FLAG_2);
                    if (!carVO.getTemp4().equals("B")) {
                        // 若变更类型不是B，则更新车辆SA_0121T的“保修日期GRTE_START_DT”为开票日期
                        String timesIssStr = String.valueOf(resMap.get("receiptIssDt"));
                        int timesIss = Integer.parseInt(timesIssStr.substring(0, timesIssStr.length()-3));
                        vehicleMasterVO.setGrteStartDt(new Date(Long.valueOf(timesIss)*1000));
                    }
                    // 更新车辆信息
                    batchRcpRictVerifyDAO.updateCarAfterVerify(vehicleMasterVO);
                    // 设置机动车发票SA_0501T表的是否绑定车辆BINDING_CAR_YN字段为Y
                    bindingCarYn = "Y";
                } else {
                    // 设置机动车发票SA_0501T表的是否绑定车辆BINDING_CAR_YN字段为N，列表sql直连车辆表不可见，后面通过定时任务拉取车辆信息后再更新该字段
                    bindingCarYn = "N";
                }
                
                // 根据发票录入来源区分更新不同业务表(SA_0501T、SA_0510T)
                String receiptInResource = rictVerifyVO.getReceiptInResource();
                if (receiptInResource.equals(GlobalStatic.RECEIPT_IN_RESOURCE_3) || receiptInResource.equals(GlobalStatic.RECEIPT_IN_RESOURCE_4)) {
                    // DMS手动填写/APP扫码方式：将验证通过的机动车发票数据同步到机动车统一发票表
                    rictVerifyVO.setReceiptResource(receiptResource);
                    rictVerifyVO.setReceiptStatus(GlobalStatic.RECEIPT_STATUS_TRANS.get(String.valueOf(resMap.get("receiptStatus"))));
                    rictVerifyVO.setCertFst(GlobalStatic.CERT_FST_0);
                    updateAppReceiptList.add(rictVerifyVO);
                    
                    // 根据发票号码和发票代码查询机动车统一发票信息
                    Map<String, Object> receiptParam = new HashMap<String, Object>();
                    receiptParam.put("receiptNo", rictVerifyVO.getReceiptNo());
                    receiptParam.put("receiptCd", rictVerifyVO.getReceiptCd());
                    List<BatchRcpReceiptVO> isExistReceipt = batchRcpRictVerifyDAO.selectReceipts(receiptParam);
                    // 1.检查发票数据是否已经存在与机动车统一发票表，不存在则新增
                    // 2.同时校验发票来源，如果结果是“04(他店票他店车)”则无需新增
                    if (isExistReceipt.size()==0 && !receiptResource.equals(GlobalStatic.RECEIPT_RESOURCE_4)) {
                        BatchRcpReceiptVO receipt = new BatchRcpReceiptVO();
                        /**********************S 二期新增加字段****************************/
                        receipt.setReceiptType(GlobalStatic.RECEIPT_TYPE_3);
                        receipt.setCarType(String.valueOf(resMap.get("carType")));
                        receipt.setBrandModel(String.valueOf(resMap.get("brandModel")));
                        receipt.setProdArea(String.valueOf(resMap.get("prodArea")));
                        receipt.setImportCertNo(String.valueOf(resMap.get("importCertNo")));
                        receipt.setComInsNo(String.valueOf(resMap.get("comInsNo")));
                        receipt.setTon(String.valueOf(resMap.get("ton")));
                        receipt.setLimitNum(String.valueOf(resMap.get("limitNum")));
                        receipt.setEntNm(String.valueOf(resMap.get("entNm")));
                        receipt.setSelNm(String.valueOf(resMap.get("selNm")));
                        receipt.setSelTaxpayerIdCd(String.valueOf(resMap.get("selTaxpayerIdCd")));
                        receipt.setSelAddr(String.valueOf(resMap.get("selAddr")));
                        receipt.setSelPhone(String.valueOf(resMap.get("selPhone")));
                        receipt.setSelBank(String.valueOf(resMap.get("selBank")));
                        receipt.setSelBankNo(String.valueOf(resMap.get("selBankNo")));
                        receipt.setDrawer(String.valueOf(resMap.get("drawer")));
                        receipt.setBindingCarYn(bindingCarYn);
                        /**********************E 二期新增加字段****************************/
                        receipt.setCarId(carId);
                        // VIN码
                        receipt.setVinNo(String.valueOf(resMap.get("vinNo")));
                        receipt.setVinNo1(String.valueOf(resMap.get("vinNo1")));
                        receipt.setVinNo2(String.valueOf(resMap.get("vinNo2")));
                        receipt.setDlrCd(receiptDlrCd);
                        // 纳税人识别号
                        receipt.setSelTaxpayerIdCd(String.valueOf(resMap.get("taxpayerIdCd")));
                        // 发票号码
                        receipt.setReceiptNo(rictVerifyVO.getReceiptNo());
                        // 发票代码
                        receipt.setReceiptCd(rictVerifyVO.getReceiptCd());
                        // 发票客户名
                        receipt.setReceiptCustNm(String.valueOf(resMap.get("receiptCustNm")));
                        receipt.setSsnCrnNo(String.valueOf(resMap.get("ssnCrnNo")));
                        receipt.setReceiptIssDt(rictVerifyVO.getReceiptIssDt());
                        // 扫描车号
                        receipt.setScanVinNo(String.valueOf(resMap.get("scanVinNo")));
                        // 价税合计
                        receipt.setSumAmt(String.valueOf(resMap.get("sumAmt")));
                        // 合格证号码
                        receipt.setCertNo(String.valueOf(resMap.get("certNo")));
                        // 发动机号码
                        receipt.setEngnNo(String.valueOf(resMap.get("engnNo")));
                        // 价税合计
                        receipt.setSumIncTax(String.valueOf(resMap.get("sumIncTax")));
                        // 不含税金额
                        receipt.setSumExcTax(String.valueOf(resMap.get("sumExcTax")));
                        // 税率
                        receipt.setTaxRt(String.valueOf(resMap.get("taxRt")));
                        // 税额
                        receipt.setTaxAmt(String.valueOf(resMap.get("taxAmt")));
                        // 收货人名称
                        receipt.setMerchNm(String.valueOf(resMap.get("merchNm")));
                        // 地址
                        receipt.setAddr(String.valueOf(resMap.get("addr")));
                        receipt.setReceiptImg("");
                        receipt.setTmrCd("");
                        receipt.setEvalRsltCd("");
                        receipt.setErrUpCd("");
                        receipt.setRegUserId("");
                        receipt.setSdlrCd("");
                        receipt.setTaxChkYn(String.valueOf(resMap.get("taxChkYn")));
                        receipt.setRemark("");
                        receipt.setOrdDlrCd("");
                        receipt.setTaxSungCd("");
                        receipt.setSdlrTp("");
                        receipt.setSdlrNm("");
                        receipt.setTelNo("");
                        receipt.setUploadShop("");
                        receipt.setScanDt(rictVerifyVO.getScanDt());
                        // 验证状态
                        receipt.setCertFst(GlobalStatic.CERT_FST_0); 
                        // 发票来源
                        receipt.setReceiptResource(receiptResource);
                        // 发票录入方式
                        receipt.setReceiptInResource(rictVerifyVO.getReceiptInResource());
                        // 发票状态
                        receipt.setReceiptStatus(GlobalStatic.RECEIPT_STATUS_TRANS.get(String.valueOf(resMap.get("receiptStatus"))));
                        // 创建时间
                        String timesRegStr = String.valueOf(resMap.get("regDt"));
                        int timesReg = Integer.parseInt(timesRegStr.substring(0, timesRegStr.length()-3));
                        receipt.setRegDt(new Date(Long.valueOf(timesReg)*1000));
                        addReceiptList.add(receipt);
                    }
                } else if (receiptInResource.equals(GlobalStatic.RECEIPT_IN_RESOURCE_2)) {
                    // DMS上传发票图片方式
                    BatchRcpReceiptVO receiptVO = new BatchRcpReceiptVO();
                    /**********************S 二期新增加字段****************************/
                    receiptVO.setReceiptType(GlobalStatic.RECEIPT_TYPE_3);
                    receiptVO.setCarType(String.valueOf(resMap.get("carType")));
                    receiptVO.setBrandModel(String.valueOf(resMap.get("brandModel")));
                    receiptVO.setProdArea(String.valueOf(resMap.get("prodArea")));
                    receiptVO.setImportCertNo(String.valueOf(resMap.get("importCertNo")));
                    receiptVO.setComInsNo(String.valueOf(resMap.get("comInsNo")));
                    receiptVO.setTon(String.valueOf(resMap.get("ton")));
                    receiptVO.setLimitNum(String.valueOf(resMap.get("limitNum")));
                    receiptVO.setEntNm(String.valueOf(resMap.get("entNm")));
                    receiptVO.setSelNm(String.valueOf(resMap.get("selNm")));
                    receiptVO.setSelTaxpayerIdCd(String.valueOf(resMap.get("selTaxpayerIdCd")));
                    receiptVO.setSelAddr(String.valueOf(resMap.get("selAddr")));
                    receiptVO.setSelPhone(String.valueOf(resMap.get("selPhone")));
                    receiptVO.setSelBank(String.valueOf(resMap.get("selBank")));
                    receiptVO.setSelBankNo(String.valueOf(resMap.get("selBankNo")));
                    receiptVO.setDrawer(String.valueOf(resMap.get("drawer")));
                    receiptVO.setBindingCarYn(bindingCarYn);
                    /**********************E 二期新增加字段****************************/
                    receiptVO.setCarId(rictVerifyVO.getAppReceiptId());
                    receiptVO.setCertFst(GlobalStatic.CERT_FST_0);
                    receiptVO.setReceiptResource(receiptResource);
                    receiptVO.setReceiptStatus(GlobalStatic.RECEIPT_STATUS_TRANS.get(String.valueOf(resMap.get("receiptStatus"))));
                    updateReceiptList.add(receiptVO);
                }
            }
        }
        // 批量更新APP扫码发票验证状态
        if (updateAppReceiptList.size()>0) {
            batchRcpRictVerifyDAO.updateRcpAppReceiptVerifys(updateAppReceiptList);
        }
        // 批量更新机动车统一发票验证状态
        if (updateReceiptList.size()>0) {
            batchRcpRictVerifyDAO.updateRcpReceiptVerifys(updateReceiptList);
        }
        // 批量新增机动车发票
        if (addReceiptList.size()>0) {
            batchRcpRictVerifyDAO.insertRcpReceipts(addReceiptList);
        }
//        JSONObject body = new JSONObject();
//        body.put("key", "value");
//        // 验签
//        Map<String, String> headers = new HashMap<String, String>();
//        String appkey= "test";
//        String secretKey= "test";
//        long timestamp = System.currentTimeMillis()/1000;
//        String nonce = "1";
//        headers.put("appkey", appkey);      // 应用密钥
//        headers.put("nonce", nonce);        // 随机数
//        headers.put("signTimestamp", String.valueOf(new Date().getTime()));     // 当前时间
//        try {
//            headers.put("digitalSign", encodeMD5(secretKey + nonce + timestamp).toLowerCase());
//        } catch (Exception exception) {
//            System.out.println("出错了");
//        }
//        
//        try {
//            String resStr = httpPost("", body, headers);
//            JSONObject resJson = JSONObject.fromObject(resStr);
//            if (resJson.get("").equals("")) {
//                batchRcpRictVerifyDAO.updateRcpRictVerify();
//            }
//        } catch (Exception exception) {
//            System.out.println("调用集中式验证发票真伪接口出错了");
//        }
    }
    
    /**
     * <p>Title: MD5加密</p>
     * @author Gongrs 2021年3月31日 下午1:41:21
     * @param data:需加密字符串
     */
    private static String encodeMD5(String data) throws Exception {
        java.security.MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] array = md.digest(data.getBytes("UTF-8"));
        StringBuilder sb = new StringBuilder();
        for (byte item : array) {
            sb.append(Integer.toHexString((item & 0xFF) | 0x100).substring(1, 3));
        }
        return sb.toString().toUpperCase();
    }
    
    private Map<String, Object> testMap() {
        Map<String, Object> resMap = new HashMap<String, Object>();
        resMap.put("carId", "H00019714226");
        resMap.put("dlrCd", "D2327");
        resMap.put("carDealerCode", "D2327");
        resMap.put("receiptIssDt", "1578844800000");
        resMap.put("receiptStatus", "0");
        resMap.put("carType", "轿车");
        resMap.put("brandModel", "北京现代牌BH7140XMS");
        resMap.put("prodArea", "重庆");
        resMap.put("importCertNo", "test");
        resMap.put("comInsNo", "test");
        resMap.put("ton", "test");
        resMap.put("limitNum", "5");
        resMap.put("entNm", "test");
        resMap.put("selNm", "福州中诺汽车有限公司");
        resMap.put("selTaxpayerIdCd", "91350100749054027C");
        resMap.put("selAddr", "福州市仓山区则徐大道625号");
        resMap.put("selPhone", "0591-83485515");
        resMap.put("selBank", "招商银行福州分行白马支行");
        resMap.put("selBankNo", "591903406710201");
        resMap.put("drawer", "test");
        resMap.put("vinNo", "LBECBACB6KW115838");
        resMap.put("vinNo1", "LBECBACB6K");
        resMap.put("vinNo2", "115838");
        resMap.put("selTaxpayerIdCd", "91350100749054027C");
        resMap.put("receiptCustNm", "福州福瑞特电子有限公司");
        resMap.put("ssnCrnNo", "9135010457702973X3");
        resMap.put("scanVinNo", "LBECBACB6KW115838");
        resMap.put("sumAmt", "46400.0");
        resMap.put("engnNo", "KG051592");
        resMap.put("sumIncTax", "46400.0");
        resMap.put("sumExcTax", "41061.95");
        resMap.put("taxRt", "0.13");
        resMap.put("taxAmt", "5338.05");
        resMap.put("selAddr", "福州市仓山区则徐大道625号");
        resMap.put("taxChkYn", "Y");
        resMap.put("regDt", "1618453820000");
        return resMap;
    }
}