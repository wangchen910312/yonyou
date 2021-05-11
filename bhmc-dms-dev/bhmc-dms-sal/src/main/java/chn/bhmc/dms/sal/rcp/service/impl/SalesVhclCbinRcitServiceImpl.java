package chn.bhmc.dms.sal.rcp.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.BlobVO;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cmm.service.RegularExpressionService;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
import chn.bhmc.dms.sal.com.util.DateUtils;
import chn.bhmc.dms.sal.com.util.GlobalStatic;
import chn.bhmc.dms.sal.com.util.HttpUtil;
import chn.bhmc.dms.sal.rcp.service.SalesVhclCbinRcitService;
import chn.bhmc.dms.sal.rcp.service.dao.SalesReceiptSystemDAO;
import chn.bhmc.dms.sal.rcp.service.dao.SalesVhclCbinRcitDAO;
import chn.bhmc.dms.sal.rcp.vo.InvoiceVO;
import chn.bhmc.dms.sal.rcp.vo.SalesReceiptSystemVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitAppScanSaveVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitAppScanSearchVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitSearchVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import net.sf.json.JSONObject;

/**
 * <pre>
 * 영수증관리 &gt; 기동차통일영수증관리
 * </pre>
 *
 * @ClassName : SalesVhclCbinRcitServiceImpl.java
 * @Description : 영수증관리 > 기동차통일영수증관리
 * @author chibeom.song
 * @since 2017. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 17.     chibeom.song     최초 생성
 * </pre>
 */
@Service("salesVhclCbinRcitService")
public class SalesVhclCbinRcitServiceImpl extends HService implements SalesVhclCbinRcitService, JxlsSupport {

    /**
     * VIN Master 정보
     */
    @Autowired
    VehicleMasterService vehicleMasterService;

    /**
     *
     */
    @Autowired
    VehOfCustInfoService vehOfCustInfoService;

    @Autowired
    SalesCommonCamelService salesCommonCamelService;

    @Autowired
    CommonCodeService commonCodeService;

    /**
     * 영수증관리 > 기동차통일영수증관리 DAO
     */
    @Resource(name = "salesVhclCbinRcitDAO")
    SalesVhclCbinRcitDAO salesVhclCbinRcitDAO;
    
    /**
     * 发票管理 -> 经销商上线发票系统
     */
    @Resource(name = "SalesReceiptSystemDAO")
    SalesReceiptSystemDAO salesReceiptSystemDAO;

    /**
     * R19092301306 在<机动车统一发票管理>的提交功能中增加对扫描数据“证件号码”的校验。校验规则同客户信息录入模块增加客户时对身份证号的验证。贾明  2019-9-24
     */
    @Autowired
    RegularExpressionService regularExpressionService;
    
    /**
     * 조회 조건에 해당하는 영수증관리 > 기동차통일영수증관리 정보를 조회한다.
     */
    @Override
    public List<SalesVhclCbinRcitVO> selectSalesVehicleCombineReceiptSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
    	return salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptSearchData(searchVO);
    }

    /**
     * 조회 조건에 해당하는 영수증관리 > 기동차통일영수증관리 총 갯수를 조회한다.
     */
    @Override
    public int selectSalesVehicleCombineReceiptSearchCnt(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptSearchCnt(searchVO);
    }
    
    /**
     * 发票扫码查询页面-数量
     * <p>Title: </p >
     * @author TangWei 2021年3月30日 下午3:52:42
     * @param 
     * @return
     */
    @Override
    public int selectSalesVehicleCombineReceiptCnt(SalesVhclCbinRcitAppScanSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptCnt(searchVO);
    }
    
    /**
     * 发票扫码-查询页面数据
     * <p>Title: </p >
     * @author TangWei 2021年3月30日 下午4:08:53
     * @param 
     * @return
     */
    @Override
    public List<SalesVhclCbinRcitAppScanSaveVO> selectSalesVehicleCombineReceiptData(SalesVhclCbinRcitAppScanSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptData(searchVO);
    }

    /**
     * 성(우편번호) 목록을 조회한다.
     */
    @Override
    public List<SalesVhclCbinRcitVO> selectProvinceInfoList(SalesVhclCbinRcitSearchVO searchVO) throws Exception {

        String provinceCd = searchVO.getsProvince();
        searchVO.setsProvince(provinceCd);
        return salesVhclCbinRcitDAO.selectProvinceInfoList(searchVO);
    }

    /**
     * 성(우편번호) 목록을 조회한다.
     */
    @Override
    public List<SalesVhclCbinRcitVO> selectProvinceInfoList(String provinceCd) throws Exception {

        SalesVhclCbinRcitSearchVO searchVO = new SalesVhclCbinRcitSearchVO();
        searchVO.setsProvince(provinceCd);

        return selectProvinceInfoList(searchVO);
    }

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 등록한다.
     */
    @Override
    @SuppressWarnings("static-access")
    public int insertSalesVehicleCombineReceiptSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception {

        int result = 0;
        String userId = LoginUtil.getUserId();

        salesVhclCbinRcitVO.setRegUsrId(userId);
        salesVhclCbinRcitVO.setUpdtUsrId(userId);
        salesVhclCbinRcitVO.setDlrCd(LoginUtil.getDlrCd());

        salesVhclCbinRcitVO.setReceiptImg(salesVhclCbinRcitVO.getScanBlob());
        /**
         * 检验发票提交时 证件号码 是符合 身份证号 、组织机构代码标准
         * R19092301306 在<机动车统一发票管理>的提交功能中增加对扫描数据“证件号码”的校验。校验规则同客户信息录入模块增加客户时对身份证号的验证。贾明 start 2019-9-24
         */
        /**
         * 81 发票在提交的时候，客户验证还需要再增加一个客户类型是护照的验证和士兵类型的验证。 目前都不做校验 2020-5-6 贾明
         String idNumberFift = "FALSE";
	   	 String idNumberEigh = "FALSE";
	   	 String organCode = "FALSE";
	   	if (StringUtils.isNotEmpty(salesVhclCbinRcitVO.getScanSsnCrnNo())) {
	   		//证件号码 15位
	   		if (salesVhclCbinRcitVO.getScanSsnCrnNo().length() == 15) {
	   			idNumberFift = regularExpressionService.selectRegularExpressionByRegiNo15Digit(salesVhclCbinRcitVO.getScanSsnCrnNo());
	           } 
	   		//证件号码 18位
	   		if (salesVhclCbinRcitVO.getScanSsnCrnNo().length() == 18) {
	   			idNumberEigh = regularExpressionService.selectRegularExpressionByRegiNo18Digit(salesVhclCbinRcitVO.getScanSsnCrnNo());
	           }
	   		//组织机构代码标准
	   		organCode = regularExpressionService.selectRegularExpressionByCorpNo(salesVhclCbinRcitVO.getScanSsnCrnNo());
	   	}
	   	//judUnSociCreo
	   	if("false".equals(salesVhclCbinRcitVO.getJudUnSociCreo()) && "FALSE".equals(idNumberFift) && "FALSE".equals(idNumberEigh) && "FALSE".equals(organCode)){
	   		throw processException("crm.info.regExpSsnCrnNo");
	   	}
	   	**/
	    /**
         * 检验发票提交时 证件号码 是符合 身份证号 、组织机构代码标准
         * R19092301306 在<机动车统一发票管理>的提交功能中增加对扫描数据“证件号码”的校验。校验规则同客户信息录入模块增加客户时对身份证号的验证。贾明 end 2019-9-24
         */
        /*
         * // 스캔한 이미지 파일을 읽어 온다.
         * File receiptFile = new File(salesVhclCbinRcitVO.getScanFileImgDir());
         * salesVhclCbinRcitVO.setReceiptImg(FileUtils.readFileToByteArray(
         * receiptFile));
         * FileUtils.writeByteArrayToFile(new
         * File("D:/data/webapps/BHMC-DMS-WEB/FILE_UPLOAD_PATH/2016/04/26/save.jpg"
         * ), salesVhclCbinRcitVO.getReceiptImg());
         */

        int cnt = salesVhclCbinRcitDAO.selectSaleVehicleCombineReceiptCnt(salesVhclCbinRcitVO);

        if (cnt > 0) {
            throw processException("sal.err.dupReceipt");
        }
        
        //CSR 67 发票提交时对（ 发票代码+发票号码）进行唯一性校验  贾明 2020-3-19 start
        int receiptNOCnt = salesVhclCbinRcitDAO.selectSaleVehicleCombineReceiptNOCnt(salesVhclCbinRcitVO);
        
        if (receiptNOCnt > 0) {
            throw processException("sal.err.dupReceipt");
        }
       //CSR 67 发票提交时对（ 发票代码+发票号码）进行唯一性校验  贾明 2020-3-19 END
        
       //CSR 95 不同店上传同一张发票，DCS均接收并覆盖，增加校验不允许重复上传 贾明 2020-5-20 start
        Map<String, Object> messag = new HashMap<String, Object>();
        messag.put("I_VIN_NO", salesVhclCbinRcitVO.getVinNo());
        messag.put("I_RECEIPT_NO", salesVhclCbinRcitVO.getScanRcptNo());
        Data receiveData = salesCommonCamelService.executeCamelClentSearchResult(messag,"SAL253");
        boolean receiRe  =  false;
        receiRe  =  (receiveData.getFooter().getIfResult().equals("Z")) ? true : false;
        List<InvoiceVO> invoiceVO = new ArrayList<InvoiceVO>();
        if(receiRe){
        	invoiceVO = receiveData.readMessages(InvoiceVO.class);
        	if(invoiceVO.size() > 0){
			    throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("sal.err.invoiceSubmitted", new String[]{invoiceVO.get(0).getDlrCd()}, LocaleContextHolder.getLocale())});
        	}
        	
        } else {
        	 String interNum = "SAL253";
        	 throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("sal.err.invoiceInfoCheck", new String[]{interNum}, LocaleContextHolder.getLocale())});
        	 //throw processException("sal.err.invoiceInfoCheck");
        }
       //CSR 95 不同店上传同一张发票，DCS均接收并覆盖，增加校验不允许重复上传 贾明 2020-5-20 END
        
        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);

        salesVhclCbinRcitVO.setRegDt(toDate);
        salesVhclCbinRcitVO.setUpdtDt(toDate);

        // 본테이블에 데이터 저장 原有写SA_0501T表入注掉  贾明 2019-11-11 
        //result = salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptSave(salesVhclCbinRcitVO);
        // 본테이블에 blob이미지 저장 SA_0501T 表 图片数据原有写入注掉  贾明 2019-11-11
        //salesVhclCbinRcitDAO.updateSalesVehicleCombineReceiptImg(salesVhclCbinRcitVO);
        
        // 查询经销商上线发票系统
        SalesReceiptSystemVO test = salesReceiptSystemDAO.selectSalesReceiptSystemData(LoginUtil.getDlrCd());
    	String receiptSystemFlag = test.getReceiptSystemFlag();
    	if (receiptSystemFlag.equals(GlobalStatic.RECEIPT_SYSTEM_FLAG_2)) {
    		// 数衍
    		// S 2021-04-01 宫荣枢，增加调用集中式数衍验证
            // 是否需要处理
            boolean needHandle = true;
            try {
                // 调用集中式接口入参
                JSONObject param = new JSONObject();
                param.put("regUsrId", LoginUtil.getUserId());
                param.put("checkDealerCode", LoginUtil.getDlrCd());
                param.put("receiptCd", salesVhclCbinRcitVO.getReceiptCd());
                param.put("receiptNo", salesVhclCbinRcitVO.getReceiptNo());
                param.put("sumAmt", salesVhclCbinRcitVO.getSumExcTax());
                // 集中式接口要求日期格式
                param.put("receiptIssDt", DateUtils.convertDate2String(salesVhclCbinRcitVO.getReceiptIssDt(), DateUtils.DEFAILT_DATE).replace("-", ""));
                param.put("receiptType", GlobalStatic.RECEIPT_TYPE_3);
                // 读取配置文件【common.properties】获取接口地址
                Properties proConfUrl = PropertiesLoaderUtils
                        .loadProperties(new ClassPathResource("/config/common.properties"));
                // 发送请求
                HttpUtil httpUtil = new HttpUtil();
                String resJsonStr = httpUtil.httpPost(proConfUrl.getProperty("receiptVerifyUrl"), String.valueOf(param));
                Map<String, Object> resMap = JSON.parseObject(resJsonStr);
                String resCode = String.valueOf(resMap.get("resultCode"));
                if (resCode.equals(GlobalStatic.RESULT_CODE_OK)) {
                    // 验证通过
                    String carId = String.valueOf(resMap.get("carId"));
                    // 发票店代码
                    String receiptDlrCd = String.valueOf(resMap.get("dlrCd"));
                    // 车辆店代码
                    String carDlrCd = String.valueOf(resMap.get("carDealerCode"));
                    //String imgPath = String.valueOf(resMap.get("imgPath"));
                    // 发票图片
                    //String receiptImg = String.valueOf(resMap.get("receiptImg"));
                    
                    // 查询车辆是否存在于经销商DMS库
                    VehicleMasterVO carVO = vehicleMasterService.selectCarInfoByCarId(carId);
                    if (carVO!=null) {
                        // 车辆存在
                        VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();
                        vehicleMasterVO.setCarId(carId);
                        // 更新车辆主信息SA_0121T表的绑定发票标识BINDING_RECEIPT_FLAG字段为02
                        vehicleMasterVO.setBindingReceiptFlag(GlobalStatic.BINDING_RECEIPT_FLAG_2);
                        if (!vehicleMasterVO.getTemp4().equals("B")) {
                            // 若变更类型不是B，则更新车辆SA_0121T的“保修日期GRTE_START_DT”为开票日期
                            String timesIssStr = String.valueOf(resMap.get("receiptIssDt"));
                            int timesIss = Integer.parseInt(timesIssStr.substring(0, timesIssStr.length()-3));
                            vehicleMasterVO.setGrteStartDt(new Date(Long.valueOf(timesIss)*1000));
                        }
                        // 更新车辆信息
                        vehicleMasterService.updateCarAfterVerify(vehicleMasterVO);
                        // 设置机动车发票SA_0501T表的是否绑定车辆BINDING_CAR_YN字段为Y
                        salesVhclCbinRcitVO.setBindingCarYn("Y");
                    } else {
                        // 设置机动车发票SA_0501T表的是否绑定车辆BINDING_CAR_YN字段为N，列表sql直连车辆表不可见，后面通过定时任务拉取车辆信息后再更新该字段
                        salesVhclCbinRcitVO.setBindingCarYn("N");
                    }

                    // 获取发票来源，如果结果是“04(他店票他店车)”则无需处理
                    String receiptResource = GlobalStatic.getReceiptResources(LoginUtil.getDlrCd(), receiptDlrCd, carDlrCd);
                    needHandle = receiptResource.equals(GlobalStatic.RECEIPT_RESOURCE_4) ? false : true;
                    salesVhclCbinRcitVO.setReceiptType(GlobalStatic.RECEIPT_TYPE_3);
                    salesVhclCbinRcitVO.setCarId(carId);
                    // 地址
                    salesVhclCbinRcitVO.setAddr(String.valueOf(resMap.get("addr")));
                    // 合格证号码
                    salesVhclCbinRcitVO.setCertNo(String.valueOf(resMap.get("certNo")));
                    // 发动机号码
                    salesVhclCbinRcitVO.setEngnNo(String.valueOf(resMap.get("engnNo")));
                    // 销方店代码
                    salesVhclCbinRcitVO.setOrdDlrCd(String.valueOf(resMap.get("ordDlrCd")));
                    // 发票代码
                    salesVhclCbinRcitVO.setReceiptCd(String.valueOf(resMap.get("receiptCd")));
                    // 发票号码
                    salesVhclCbinRcitVO.setReceiptNo(String.valueOf(resMap.get("receiptNo")));
                    // 开票日期
                    salesVhclCbinRcitVO.setReceiptIssDt(DateUtils.convertString2Date(String.valueOf(resMap.get("receiptIssDt"))));
                    // 发票状态
                    salesVhclCbinRcitVO.setReceiptStatus(String.valueOf(resMap.get("receiptStatus")));
                    // 扫描车号
                    salesVhclCbinRcitVO.setScanVinNo(String.valueOf(resMap.get("scanVinNo")));
                    // 证书编号
                    salesVhclCbinRcitVO.setSsnCrnNo(String.valueOf(resMap.get("ssnCrnNo")));
                    // 申报地区
                    salesVhclCbinRcitVO.setTaxSungCd(String.valueOf(resMap.get("taxSungCd")));
                    // 电话
                    salesVhclCbinRcitVO.setTelNo(String.valueOf(resMap.get("telNo")));
                    // 价税合计
                    salesVhclCbinRcitVO.setSumAmt(Double.parseDouble(String.valueOf(resMap.get("sumAmt"))));
                    // 不含税金额
                    salesVhclCbinRcitVO.setSumExcTax(Double.parseDouble(String.valueOf(resMap.get("sumExcTax"))));
                    // 含税金额
                    salesVhclCbinRcitVO.setSumIncTax(Double.parseDouble(String.valueOf(resMap.get("sumIncTax"))));
                    // 税额
                    salesVhclCbinRcitVO.setTaxAmt(Double.parseDouble(String.valueOf(resMap.get("taxAmt"))));
                    // 是否申报税期
                    salesVhclCbinRcitVO.setTaxChkYn(String.valueOf(resMap.get("taxChkYn")));
                    // 税率
                    salesVhclCbinRcitVO.setTaxRt(String.valueOf(resMap.get("taxRt")));
                    // 纳税人识别号
                    salesVhclCbinRcitVO.setTaxpayerIdCd(String.valueOf(resMap.get("taxpayerIdCd")));
                    // VIN码
                    salesVhclCbinRcitVO.setVinNo(String.valueOf(resMap.get("vinNo")));
                    salesVhclCbinRcitVO.setVinNo1(String.valueOf(resMap.get("vinNo1")));
                    salesVhclCbinRcitVO.setVinNo2(String.valueOf(resMap.get("vinNo2")));
                    // 发票客户名
                    salesVhclCbinRcitVO.setReceiptCustNm(String.valueOf(resMap.get("receiptCustNm")));
                    // 收货人名称
                    salesVhclCbinRcitVO.setMerchNm(String.valueOf(resMap.get("merchNm")));
                    salesVhclCbinRcitVO.setCarType("");
                    salesVhclCbinRcitVO.setBrandModel("");
                    salesVhclCbinRcitVO.setProdArea("");
                    salesVhclCbinRcitVO.setImportCertNo("");
                    salesVhclCbinRcitVO.setComInsNo("");
                    salesVhclCbinRcitVO.setTon("");
                    salesVhclCbinRcitVO.setLimitNum("");
                    salesVhclCbinRcitVO.setEntNm("");
                    salesVhclCbinRcitVO.setSelNm("");
                    salesVhclCbinRcitVO.setSelTaxpayerIdCd("");
                    salesVhclCbinRcitVO.setSelAddr("");
                    salesVhclCbinRcitVO.setSelPhone("");
                    salesVhclCbinRcitVO.setSelBank("");
                    salesVhclCbinRcitVO.setSelBankNo("");
                    salesVhclCbinRcitVO.setDrawer("");
                    // 发票来源
                    salesVhclCbinRcitVO.setReceiptResource(receiptResource);
                    // 发票录入方式
                    salesVhclCbinRcitVO.setReceiptInResource(GlobalStatic.RECEIPT_IN_RESOURCE_2);
                    // 创建时间
                    String timesRegStr = String.valueOf(resMap.get("regDt"));
                    int timesReg = Integer.parseInt(timesRegStr.substring(0, timesRegStr.length()-3));
                    salesVhclCbinRcitVO.setRegDt(new Date(Long.valueOf(timesReg)*1000));
                    salesVhclCbinRcitVO.setCertFst(GlobalStatic.CERT_FST_0);
                } else if (resCode.equals(GlobalStatic.RESULT_CODE_NOT_EXIST)) {
                    // 验证不存在
                    salesVhclCbinRcitVO.setCertFst(GlobalStatic.CERT_FST_4);
                } else {
                    // 验证不通过
                    salesVhclCbinRcitVO.setCertFst(GlobalStatic.CERT_FST_1);
                }
            } catch (Exception e) {
                log.info("调用集中式数衍发票验证接口失败！");
            } finally {
            	// 若发票来源是“04”，表示非本店车非本店票，无需处理
                if (needHandle) {
                	// S 2021-04-01 宫荣枢，增加判断是否需要处理
                	// R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 start
                	result = salesVhclCbinRcitDAO.insertSalesInvoiceInformationSave(salesVhclCbinRcitVO);
                	salesVhclCbinRcitDAO.updateSalesInvoiceInformationImg(salesVhclCbinRcitVO);
                	// R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 end
                	// E 2021-04-01 宫荣枢，增加判断是否需要处理
                }
            }
        	// E 2021-04-01 宫荣枢，增加调用集中式数衍验证
            // S 2021-04-01 宫荣枢，去掉DMS通过camel上传DCS，通过集中式实现
            // ...贾明原来camel上传DCS代码
            // E 2021-04-01 宫荣枢，去掉DMS通过camel上传DCS，通过集中式实现
    	} else {
    		// 美丽源
    		// R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 start
            result = salesVhclCbinRcitDAO.insertSalesInvoiceInformationSave(salesVhclCbinRcitVO);
            salesVhclCbinRcitDAO.updateSalesInvoiceInformationImg(salesVhclCbinRcitVO);
            // R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 end

            //TODO [권기현] EAI 연동 테스트 2017-07-18
            try{
                //Camel InterFace Header Info
                Map<String, Object> message = new HashMap<String, Object>();

                message.put("CAR_ID", salesVhclCbinRcitVO.getCarId());
                message.put("VIN_NO",salesVhclCbinRcitVO.getVinNo());
                message.put("VIN_NO1",salesVhclCbinRcitVO.getVinNo().substring(0, 11));
                message.put("VIN_NO2",salesVhclCbinRcitVO.getVinNo().substring(11, 17));
                message.put("DLR_CD", salesVhclCbinRcitVO.getDlrCd());
                message.put("TAXPAYER_ID_CD", salesVhclCbinRcitVO.getScanPayTaxPinNo());
                message.put("RECEIPT_NO", salesVhclCbinRcitVO.getScanRcptNo());
                message.put("RECEIPT_CD", salesVhclCbinRcitVO.getScanRcptCd());
                message.put("RECEIPT_CUST_NM", salesVhclCbinRcitVO.getScanCustInfo());
                message.put("SSN_CRN_NO", salesVhclCbinRcitVO.getScanSsnCrnNo());
                message.put("RECEIPT_ISS_DT", salesVhclCbinRcitVO.getScanRcptPubDt());
                message.put("SCAN_VIN_NO", salesVhclCbinRcitVO.getScanVinNo());
                message.put("SUM_AMT", salesVhclCbinRcitVO.getScanTaxIncPrice());
                message.put("CERT_NO", salesVhclCbinRcitVO.getScanCertNo());
                message.put("ENGN_NO", salesVhclCbinRcitVO.getScanEngNo());
                message.put("SUM_INC_TAX", salesVhclCbinRcitVO.getScanTaxIncPrice());
                message.put("SUM_EXC_TAX", salesVhclCbinRcitVO.getScanTaxExcPrice());

                message.put("TAX_RT", salesVhclCbinRcitVO.getScanTaxRate().replace("%", ""));

                message.put("TAX_AMT", salesVhclCbinRcitVO.getScanTaxAmt());
                message.put("MERCH_NM", salesVhclCbinRcitVO.getScanSaleCmpnNm());
                message.put("ADDR",  salesVhclCbinRcitVO.getScanSaleCmpnAddr());
                message.put("RECEIPT_IMG",  new String(salesVhclCbinRcitVO.getReceiptImg(),"UTF-8"));
                message.put("TMR_CD",  salesVhclCbinRcitVO.getTmrCd());
                message.put("EVAL_RSLT_CD",  salesVhclCbinRcitVO.getEvalRsltCd());
                message.put("ERR_UP_CD",  salesVhclCbinRcitVO.getErrUpCd());
                message.put("REG_USR_ID",  salesVhclCbinRcitVO.getRegUsrId());
                message.put("REG_DT",  DateUtil.convertToDateTimeString(salesVhclCbinRcitVO.getRegDt()));
                message.put("UPDT_USR_ID", LoginUtil.getUserId());
                message.put("UPDT_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
                message.put("IF_REG_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss") );
                message.put("SDLR_CD",  salesVhclCbinRcitVO.getSdlrCd());
                message.put("TAX_CHK_YN",  "N");
                message.put("REMARK",  salesVhclCbinRcitVO.getRemark());
                message.put("TEMP_C01",  salesVhclCbinRcitVO.getTempCd01());
                message.put("TEMP_C02",  salesVhclCbinRcitVO.getTempCd02());
                message.put("TEMP_C03",  salesVhclCbinRcitVO.getTempCd03());
                message.put("TEMP_C04",  salesVhclCbinRcitVO.getTempCd04());
                message.put("TEMP_C05",  salesVhclCbinRcitVO.getTempCd05());
                message.put("TEMP_N01",  salesVhclCbinRcitVO.getTempN01());
                message.put("TEMP_N02",  salesVhclCbinRcitVO.getTempN02());
                message.put("TEMP_N03",  salesVhclCbinRcitVO.getTempN03());
                message.put("TEMP_N04",  salesVhclCbinRcitVO.getTempN04());
                message.put("TEMP_N05",  salesVhclCbinRcitVO.getTempN05());
                message.put("ORD_DLR_CD",  salesVhclCbinRcitVO.getOrdDlrCd());
                message.put("TAX_SUNG_CD",  salesVhclCbinRcitVO.getTaxSungCd());
                message.put("SDLR_TP",  salesVhclCbinRcitVO.getSdlrTp());
                message.put("SDLR_NM",  salesVhclCbinRcitVO.getSdlrNm());
                message.put("TEL_NO",  salesVhclCbinRcitVO.getTelNo()); //crs 37 发票上传扫描信息显示的画面，在 证件号码 后面增加 手机号码 ，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 查找合同客户表的电话
                // R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 start
                message.put("IDEN_INFO","Y");//增加个标识，Y代表 新增加的上传的  N 代表修改时上传的
                // R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 END

                salesCommonCamelService.executeCamelClent(message,"SAL170");
           } catch(Exception e) {
               log.error(e.getMessage(),e);
               throw e;
           }
    	}
        
        // 히스토리 테이블에 데이터 저장
        //salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptHistSave(salesVhclCbinRcitVO);


        // 此处注释，需要在发票系统返回校验信息后做保修日期变更
        //String warrantyUpdtCd = salesVhclCbinRcitDAO.selectVehicleMasterUpdtCd(salesVhclCbinRcitVO);
        //if (!warrantyUpdtCd.equals("B")) {
            //salesVhclCbinRcitDAO.updateSalesVehicleMasterSave(salesVhclCbinRcitVO);
            // 차량마스터 변경 프로시저 호출
            //VehOfCustInfoVO vehOfCustInfoVO = new VehOfCustInfoVO();
            //vehOfCustInfoVO.setCarId(salesVhclCbinRcitVO.getCarId());
            //vehOfCustInfoService.vinMasterChangeCall(vehOfCustInfoVO);
        //}

        // IS 테이블에 데이터 저장
        //salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptSaveIs(salesVhclCbinRcitVO);
        // 본테이블에 blob이미지 저장
        //salesVhclCbinRcitDAO.updateSalesVehicleCombineReceiptImgIs(salesVhclCbinRcitVO);

        return result;
    }

    /**
     * 영수증관리 > 기동차통일영수증관리 이력 데이터를 등록한다.
     */
    @Override
    public int insertSalesVehicleCombineReceiptHistSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception {

        String userId = LoginUtil.getUserId();

        salesVhclCbinRcitVO.setRegUsrId(userId);
        salesVhclCbinRcitVO.setUpdtUsrId(userId);

        return salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptHistSave(salesVhclCbinRcitVO);
    }

    /**
     * 영수증관리 > 기동차통일영수증관리 데이터를 등록한다.
     */
    @Override
    public void multiSalesVehicleCombineReceiptGridSave(BaseSaveVO<SalesVhclCbinRcitVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for (SalesVhclCbinRcitVO salesVhclCbinRcitVO : obj.getInsertList()) {
            salesVhclCbinRcitVO.setRegUsrId(userId);
            insertSalesVehicleCombineReceiptGridSave(salesVhclCbinRcitVO);
        }

        for (SalesVhclCbinRcitVO salesVhclCbinRcitVO : obj.getUpdateList()) {
            salesVhclCbinRcitVO.setUpdtUsrId(userId);
            updateSalesVehicleCombineReceiptGridSave(salesVhclCbinRcitVO);
        }

    }
    
	/**
     * {@inheritDoc}
     */
    @Override
    public int insertSalesVehicleCombineReceiptGridSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception {
        SalesVhclCbinRcitVO obj = selectSalesVehicleCombineReceiptGridSaveByKey(salesVhclCbinRcitVO.getVinNo());

        if (obj != null) {
            throw processException("global.err.duplicate");
        }

        return salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptGridSave(salesVhclCbinRcitVO);
    }
    
    /**
     * <p>Title:2021/03/01 发票扫码-提交 </p >
     * @author TangWei 2021年3月31日 下午1:29:17
     * @param SalesVhclCbinRcitVO salesVhclCbinRcitVO
     * @return
     */
    @Override
    public int addsalesVehicleCombineReceiptGridScanSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception {
        return salesVhclCbinRcitDAO.addsalesVehicleCombineReceiptGridScanSave(salesVhclCbinRcitVO);
    }
    
    /**
     * <p>Title:发票扫码添加弹出框-保存 </p >
     * @author TangWei 2021年4月11日 上午10:25:24
     * @param Map<String,Object> map
     * @return
     */
    @Override
    public int addReceiptScan(Map<String,Object> map) throws Exception {
        // 获取开票日期
        String receiptPubDt = String.valueOf(map.get("receiptPubDt"));
        // 获取当前日期
        String currentDate = DateUtil.convertToString(new Date(), "yyyy-MM-dd");
        // 判断开票日期和当前日期是否相等,如果开票日期不是当天，立即验证
        if (!receiptPubDt.equals(currentDate)) {
            // 调用集中式验证接口,并接受验证状态的返回值
            Map<String, Object> certFstInfoMap = selectAppReceiptInfoByInterface(map);
            // 验证状态为验证接口返回的状态
            map.put("certFst", certFstInfoMap.get("certFst"));       
        } else { // 开票日期是当天，如果btnFlag=1，为验证操作，不允许验证。如果btnFlag=2，为保存操作，验证状态默认为待验证状态
            // 获取操作标识btnFlag  1:验证    2:保存
            String btnFlag = String.valueOf(map.get("btnFlag"));
            if ("1".equals(btnFlag)) {
                // 如果是1为验证操作，开票日期是当天，不允许验证
                throw processException("sal.error.connotValidaReceiptDtIsCurrentDay");
            }
            // 发票验证状态0.通过、1.未通过、2.不存在、3.待验证
            map.put("certFst", GlobalStatic.CERT_FST_3);
        }
        
        // 根据发票代码和发票号码，查询SA_0510T，获取发票信息
        SalesVhclCbinRcitAppScanSaveVO saveVO = selectCntByReceiptNoAndReceiptCd(map);
        if (saveVO != null) {           
            // 如果saveVO非空，说明发票信息已存在，此时需判断发票是否为已通过状态
            String certFst = saveVO.getCertFst();
            if (GlobalStatic.CERT_FST_0.equals(certFst)) { // 如果发票状态为已通过，则不允许更新
                throw processException("global.err.duplicate");
            } else { // 发票状态不是已通过状态，则更新发票开票价、开票日期和验证状态
                return salesVhclCbinRcitDAO.updateReceiptByReceiptNoAndReceiptCd(map);
            }
        } else {
            // 数据库不存在此发票代码和发票号的发票，将此发票信息插入
            map.put("regUserId", LoginUtil.getUserId());
            // 发票录入来源 01.DMS发票机、02.DMS上传发票图片、03.DMS手动填写、04.APP扫码
            map.put("receiptInResource", GlobalStatic.RECEIPT_IN_RESOURCE_3);
            // 创建日期
            map.put("regDt", new Date());
            // 发票状态  01.正常、02.作废、03.红冲
            map.put("receiptStatus", GlobalStatic.RECEIPT_STATUS_1);
            return salesVhclCbinRcitDAO.addReceiptScan(map);
        }
    }
    
    /**
     * <p>Title:发票扫码录入发票保存时，验证是否已经存在该发票号和发票代码的发票 </p >
     * @author TangWei 2021年4月11日 下午10:22:59
     * @param String receiptNo, String receiptCd
     * @return
     */
    @Override
    public SalesVhclCbinRcitAppScanSaveVO selectCntByReceiptNoAndReceiptCd(Map<String,Object> map) throws Exception {
        return salesVhclCbinRcitDAO.selectCntByReceiptNoAndReceiptCd(map);
    }
    
    /**
     * <p>Title:发票扫码-删除 </p >
     * @author TangWei 2021年4月11日 上午10:27:00
     * @param String appReceiptId
     * @return
     */
    @Override
    public int deleteReceiptByAppReceiptId(String appReceiptId) throws Exception {
        // 先查询SA_0510T表，查询验证状态，如果是已通过的，不允许删除
        SalesVhclCbinRcitAppScanSearchVO searchVO = salesVhclCbinRcitDAO.selectReceiptAppSearchVOByAppReceiptId(appReceiptId);
        String certFst = searchVO.getCertFst();
        if (GlobalStatic.CERT_FST_0.equals(certFst)) {
            // 如果验证状态是已通过的，不可以删除
            throw processException("sal.info.receiptPassCanNotDelete");
        }
        return salesVhclCbinRcitDAO.deleteReceiptByAppReceiptId(appReceiptId);
    }
    
    /**
     * <p>Title:发票扫码-调用集中式接口，返回发票验证状态 </p >
     * @author TangWei 2021年4月12日 下午3:33:26
     * @param Map<String, Object>
     * @return
     */
    @Override
    @SuppressWarnings({ "unchecked", "finally" })
    public Map<String, Object> selectAppReceiptInfoByInterface(Map<String,Object> map) throws Exception {
        try {
        	JSONObject param = new JSONObject();
            param.put("regUserId", LoginUtil.getUserId());
            // 发票录入来源 01.DMS发票机、02.DMS上传发票图片、03.DMS手动填写、04.APP扫码
            param.put("receiptInResource", GlobalStatic.RECEIPT_IN_RESOURCE_3);
            param.put("receiptCd", String.valueOf(map.get("receiptCd")));
            param.put("receiptIssDt",String.valueOf(map.get("receiptPubDt")).replaceAll("-",""));
            param.put("receiptNo", String.valueOf(map.get("receiptNo")));
            param.put("receiptType", GlobalStatic.RECEIPT_TYPE_3);
            param.put("sumAmt", String.valueOf(map.get("sumAmt")));
            param.put("checkDealerCode", LoginUtil.getDlrCd());
            // 调用验证接口，接收返回值
            // 验签
            Properties proConfUrl = PropertiesLoaderUtils
                    .loadProperties(new ClassPathResource("/config/common.properties"));
            String resStr = HttpUtil.httpPost(proConfUrl.getProperty("receiptVerifyUrl"), String.valueOf(param));
            JSONObject resJson = JSONObject.fromObject(resStr); 
            Map<String, Object> responseInfo = JSON.parseObject(String.valueOf(resJson.get("data")), Map.class);
            // 获取发票验证状态  0:成功    1:失败    2:不存在 
            String resultCode = String.valueOf(resJson.get("resultCode"));
            if (GlobalStatic.RESULT_CODE_OK.equals(resultCode)) {
                // 发票验证成功-通过
                map.put("certFst", GlobalStatic.CERT_FST_0);
                // 获取carId
                String carId = String.valueOf(responseInfo.get("carId"));
                // 根据carId查询车辆主信息SA_0121T表，查询是否存在数据
                VehicleMasterVO vehicleMasterVO = vehicleMasterService.selectCarInfoByCarId(carId);
                if (vehicleMasterVO != null) {
                    // 存在数据，更新车辆主信息表SA_0121T的绑定发票标识字段BINDING_RECEIPT_FLAG
                    vehicleMasterVO.setCarId(carId);
                    vehicleMasterVO.setBindingReceiptFlag(GlobalStatic.BINDING_RECEIPT_FLAG_2);
                    if (!"B".equals(vehicleMasterVO.getTemp4())) {
                        // 如果TEMP4不是B，需要更新保修日期字段GRTE_START_DT为开票日期
                        vehicleMasterVO.setGrteStartDt(DateUtil.convertToDate(String.valueOf(map.get("receiptPubDt"))));
                    }
                    vehicleMasterService.updateCarAfterVerify(vehicleMasterVO);
                    // 若车辆存在，SA_0501T表的BINDING_CAR_YN字段为Y
                    responseInfo.put("bindingCarYn", "Y");
                } else {
                    // 若车辆不存在，SA_0501T表的BINDING_CAR_YN字段为N
                    responseInfo.put("bindingCarYn", "N");
                }
                // 验证通过，获取发票来源
                String receiptResource = GlobalStatic.getReceiptResources(LoginUtil.getDlrCd(), String.valueOf(responseInfo.get("dlrCd")), String.valueOf(responseInfo.get("carDealerCode")));
                responseInfo.put("receiptResource", receiptResource);
                responseInfo.put("receiptStatus", GlobalStatic.RECEIPT_STATUS_TRANS.get(String.valueOf(responseInfo.get("receiptStatus"))));
                map.put("receiptResource", receiptResource);
                if (!GlobalStatic.RECEIPT_RESOURCE_4.equals(receiptResource)) {
                    // 当发票来源不是返回04的时候，票和车都是当前操作人所属经销商的，需要同步到SA_0501T表
                    // 根据发票代码和号码查询SA_0501T,验证状态是已通过的，是否存在
                    int responseCount = salesVhclCbinRcitDAO.selectCntByReceiptNoCd(responseInfo);   
                    if (responseCount<=0) {
                        // 不存在数据，插入
                        responseInfo.put("regUsrId",LoginUtil.getUserId());
                        responseInfo.put("receiptNo", String.valueOf(map.get("receiptNo")));
                        responseInfo.put("receiptCd", String.valueOf(map.get("receiptCd")));
                        responseInfo.put("receiptIssDt", DateUtil.convertToDate(String.valueOf(map.get("receiptPubDt"))));
                        responseInfo.put("sumAmt", String.valueOf(map.get("sumAmt")));
                        responseInfo.put("certFst", GlobalStatic.CERT_FST_0);
                        responseInfo.put("receiptType", GlobalStatic.RECEIPT_TYPE_3);
                        String timesStr = String.valueOf(responseInfo.get("regDt"));
                        int times = Integer.parseInt(timesStr.substring(0, timesStr.length()-3));
                        responseInfo.put("regDt", new Date(Long.valueOf(times)*1000));
                        salesVhclCbinRcitDAO.addVhclReceiptInfo(responseInfo);
                    }
                }
            } else if (GlobalStatic.RESULT_CODE_NOT_EXIST.equals(resultCode)) {
                // 发票验证不存在
                map.put("certFst", GlobalStatic.CERT_FST_4);
            } else {
                // 发票验证未通过
                map.put("certFst", GlobalStatic.CERT_FST_1);
            }
        } catch (Exception e) {
            log.info("调用集中式数衍验证接口失败！");
        } finally {
            return map;
        }
    }
    
    /**
     * {@inheritDoc}
     */
    @Override
    public int updateSalesVehicleCombineReceiptGridSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception {

        return salesVhclCbinRcitDAO.updateSalesVehicleCombineReceiptGridSave(salesVhclCbinRcitVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public SalesVhclCbinRcitVO selectSalesVehicleCombineReceiptGridSaveByKey(String vinNo) throws Exception {
        return salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptGridSaveByKey(vinNo);
    }

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > VIN 총 갯수를 조회한다.
     */
    @Override
    public int selectVinNoSearchPopupSearchCnt(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectVinNoSearchPopupSearchCnt(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > VIN 정보를 조회한다.
     */
    @Override
    public List<SalesVhclCbinRcitVO> selectVinNoSearchPopupSearchData(SalesVhclCbinRcitSearchVO searchVO)
            throws Exception {
        return salesVhclCbinRcitDAO.selectVinNoSearchPopupSearchData(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > 2급딜러 정보 cnt 조회
     */
    @Override
    public int selectSecondDealerSearchCnt(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectSecondDealerSearchCnt(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 업로드 > 2급딜러 정보 조회
     */
    @Override
    public List<SalesVhclCbinRcitVO> selectSecondDealerSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectSecondDealerSearchData(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 명세 조회
     */
    @Override
    public SalesVhclCbinRcitVO selectReceiptDetailPopupSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectReceiptDetailPopupSearchData(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 명세 조회
     */
    @Override
    public SalesVhclCbinRcitVO selectReceiptImageSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectReceiptImageSearchData(searchVO);
    }

    /**
     * 기동차통일영수증관리 > 영수증 관리 > 영수증 이미지를 조회
     *
     * @param carId
     * @return
     */
    @Override
    public BlobVO selectSalesVehicleCombineReceiptImg(String carId) throws Exception {
        return salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptImg(carId);
    }

    @Override
    public String selectDealerSungStr(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
        return salesVhclCbinRcitDAO.selectDealerSungStr(searchVO);
    }

    /**
     * 엑셀 다운로드
     * @param list
     * @throws Exception
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        // 唐伟 2021/04/06 区分发票管理和发票扫码Tab页的导出,如果exportId=1，为发票管理页的导出，如果exportId=2，为发票扫码页的导出
        String exportId = (String) params.get("exportId");
        if ("1".equals(exportId)) { // exportId=1,为发票管理页的导出
        	List<SalesVhclCbinRcitVO> list = new ArrayList<>();
        	SalesVhclCbinRcitSearchVO searchVO = new SalesVhclCbinRcitSearchVO();
        	Date sCustSaleStDt = null;
            Date sCustSaleEtDt = null;
            
            searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

            if (params.get("sCustSaleStDt") != null) {
                sCustSaleStDt = DateUtil.convertToDate((String)params.get("sCustSaleStDt"), "yyyyMMdd");
            }

            if (params.get("sCustSaleEtDt") != null) {
                sCustSaleEtDt = DateUtil.convertToDate((String)params.get("sCustSaleEtDt"), "yyyyMMdd");
            }

            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            searchVO.setsCustSaleStDt(sCustSaleStDt);
            searchVO.setsCustSaleEdDt(sCustSaleEtDt);

            String langCd = LocaleContextHolder.getLocale().getLanguage();
            searchVO.setsLangCd(langCd);
            list = salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptSearchData(searchVO);
            
            // 获取SAF001(发票验证结果)、SAF003(发票来源)、SAF004(发票状态)共同编码，翻译导出excel字段值
            List<CommonCodeVO> commonCodesCertFst = commonCodeService.selectCommonCodesByCmmGrpCd("SAF001", null, langCd);
            List<CommonCodeVO> commonCodesReceiptResource = commonCodeService.selectCommonCodesByCmmGrpCd("SAF003", null, langCd);
            List<CommonCodeVO> commonCodesReceiptStatus = commonCodeService.selectCommonCodesByCmmGrpCd("SAF004", null, langCd);
            for (SalesVhclCbinRcitVO vo : list) {
                // 翻译发票验证结果
            	if (vo.getCertFst()!=null && !vo.getCertFst().equals("")) {
                    for (int i=0; i<commonCodesCertFst.size(); i++) {
                        if (vo.getCertFst().equals(commonCodesCertFst.get(i).getCmmCd())) {
                            vo.setCertFstNm(commonCodesCertFst.get(i).getCmmCdNm());
                            continue;
                        }
                    }
                }
                // 翻译发票来源
                if (vo.getReceiptResource()!=null && !vo.getReceiptResource().equals("")) {
                    for (int i=0; i<commonCodesReceiptResource.size(); i++) {
                        if (vo.getReceiptResource().equals(commonCodesReceiptResource.get(i).getCmmCd())) {
                            vo.setReceiptResourceNm(commonCodesReceiptResource.get(i).getCmmCdNm());
                            continue;
                        }
                    }
                }
                // 翻译发票状态
                if (vo.getReceiptStatus()!=null && !vo.getReceiptStatus().equals("")) {
                    for (int i=0; i<commonCodesReceiptStatus.size(); i++) {
                        if (vo.getReceiptStatus().equals(commonCodesReceiptStatus.get(i).getCmmCd())) {
                            vo.setReceiptStatusNm(commonCodesReceiptStatus.get(i).getCmmCdNm());
                            continue;
                        }
                    }
                }
            }
            context.putVar("items", list);
        } else {
        	// exportId=2,为发票扫码页的导出
        	List<SalesVhclCbinRcitAppScanSaveVO> list = new ArrayList<>();
        	SalesVhclCbinRcitAppScanSearchVO searchVO = new SalesVhclCbinRcitAppScanSearchVO();
        	Date sReceiptStDt = null;
        	Date sReceiptEdDt = null;
            Date sScanStDt = null;
            Date sScanEdDt = null;

        	if (params.get("sReceiptStDt") != null) {
        		sReceiptStDt = DateUtil.convertToDate((String)params.get("sReceiptStDt"), "yyyyMMdd");
            }
        	
        	if (params.get("sReceiptEdDt") != null) {
        		sReceiptEdDt = DateUtil.convertToDate((String)params.get("sReceiptEdDt"), "yyyyMMdd");
            }

            if (params.get("sScanStDt") != null) {
            	sScanStDt = DateUtil.convertToDate((String)params.get("sScanStDt"), "yyyyMMdd");
            }
            
            if (params.get("sScanEdDt") != null) {
            	sScanEdDt = DateUtil.convertToDate((String)params.get("sScanEdDt"), "yyyyMMdd");
            }
            
            String sCertfst = (String)params.get("certFst");
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
            searchVO.setsReceiptStDt(sReceiptStDt);
            searchVO.setsReceiptEdDt(sReceiptEdDt);
            searchVO.setScanStDt(sScanStDt);
            searchVO.setScanEdDt(sScanEdDt);
            searchVO.setCertFst(sCertfst);
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            list = salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptDataExcel(searchVO);
            context.putVar("items", list);
        }       
    }

	@Override
	public int updateVehicleUnifiedInvoiceinfo(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception {
		int result = 0;
		String userId = LoginUtil.getUserId();
        salesVhclCbinRcitVO.setUpdtUsrId(userId);
        salesVhclCbinRcitVO.setDlrCd(LoginUtil.getDlrCd());
        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);
        salesVhclCbinRcitVO.setUpdtDt(toDate);
        result = salesVhclCbinRcitDAO.updateVehicleUnifiedInvoiceinfo(salesVhclCbinRcitVO);
        SalesVhclCbinRcitVO obj = salesVhclCbinRcitDAO.selectSalesInvoiceInformationInfo(salesVhclCbinRcitVO);
        //SalesVhclCbinRcitVO obj = selectSalesVehicleCombineReceiptGridSaveByKey(salesVhclCbinRcitVO.getVinNo());
        try{
             //Camel InterFace Header Info SAL170 发送信息
             Map<String, Object> message = new HashMap<String, Object>();

             message.put("CAR_ID", obj.getCarId());
             message.put("VIN_NO",obj.getVinNo());
             message.put("VIN_NO1",obj.getVinNo().substring(0, 11));
             message.put("VIN_NO2",obj.getVinNo().substring(11, 17));
             message.put("DLR_CD", obj.getDlrCd());
             message.put("TAXPAYER_ID_CD", obj.getTaxpayerIdCd());
             message.put("RECEIPT_NO", obj.getReceiptNo());
             message.put("RECEIPT_CD", obj.getReceiptCd());
             message.put("RECEIPT_CUST_NM", obj.getReceiptCustNm());
             message.put("SSN_CRN_NO", obj.getSsnCrnNo());
             message.put("RECEIPT_ISS_DT", salesVhclCbinRcitVO.getScanRcptPubDt());// getscanRcptPubDtDateUtil.convertToDateTimeString(obj.getReceiptIssDt())
             message.put("SCAN_VIN_NO", obj.getScanVinNo());
             message.put("SUM_AMT", obj.getSumAmt());
             message.put("CERT_NO", obj.getCertNo());
             message.put("ENGN_NO", obj.getEngnNo());
             message.put("SUM_INC_TAX", obj.getSumAmt());
             message.put("SUM_EXC_TAX", obj.getSumExcTax());

             message.put("TAX_RT", obj.getTaxRt().replace("%", ""));

             message.put("TAX_AMT", obj.getTaxAmt());
             message.put("MERCH_NM", obj.getMerchNm());
             message.put("ADDR",  obj.getAddr());
             //message.put("RECEIPT_IMG",  new String(obj.getReceiptImg(),"UTF-8"));// 修改时不传发票图片
             message.put("TMR_CD",  obj.getTmrCd());
             message.put("EVAL_RSLT_CD",  obj.getEvalRsltCd());
             message.put("ERR_UP_CD",  obj.getErrUpCd());
             message.put("REG_USR_ID",  obj.getRegUsrId());
             message.put("REG_DT",  DateUtil.convertToDateTimeString(obj.getRegDt()));
             message.put("UPDT_USR_ID", LoginUtil.getUserId());
             message.put("UPDT_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
             message.put("IF_REG_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss") );
             message.put("SDLR_CD",  obj.getSdlrCd());
             message.put("TAX_CHK_YN",  "N");
             message.put("REMARK",  obj.getRemark());
             message.put("TEMP_C01",  obj.getTempCd01());
             message.put("TEMP_C02",  obj.getTempCd02());
             message.put("TEMP_C03",  obj.getTempCd03());
             message.put("TEMP_C04",  obj.getTempCd04());
             message.put("TEMP_C05",  obj.getTempCd05());
             message.put("TEMP_N01",  obj.getTempN01());
             message.put("TEMP_N02",  obj.getTempN02());
             message.put("TEMP_N03",  obj.getTempN03());
             message.put("TEMP_N04",  obj.getTempN04());
             message.put("TEMP_N05",  obj.getTempN05());
             message.put("ORD_DLR_CD",  obj.getOrdDlrCd());
             message.put("TAX_SUNG_CD",  obj.getTaxSungCd());
             message.put("SDLR_TP",  obj.getSdlrTp());
             message.put("SDLR_NM",  obj.getSdlrNm());
             message.put("TEL_NO",  obj.getTelNo()); //crs 37 发票上传扫描信息显示的画面，在 证件号码 后面增加 手机号码 ，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 查找合同客户表的电话
             // R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 start
             message.put("IDEN_INFO","N");//增加个标识，Y代表 新增加的上传的  N 代表修改时上传的N
             // R19111100817 一台车提交了两个不同号的发票，应该显示两行，目前只显示了一行。同时希望可以像<新能源补贴申请审核>页面类似的，可显示全部和最新的数据 贾明 2019-11-11 END

             salesCommonCamelService.executeCamelClent(message,"SAL170");
        }catch(Exception e){
            log.error(e.getMessage(),e);
            throw e;
        }

        return result;
		
	}
	
    /**
     * NO 31 DMS端车辆主信息的发票展示逻辑确定如下：1、车辆对应的发票，只有初审通过状态，没有复核通过的情况，那就以最新审核通过展示；2、有复核通过的发票，那就展示最新复核通过的。
     * 贾明 2019-11-28 
     */
	@Override
	public SalesVhclCbinRcitVO selectVehicleInfoMotorVehInvo(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
		return salesVhclCbinRcitDAO.selectVehicleInfoMotorVehInvo(searchVO);
	}

	
	/**
	 * crs 37 发票上传扫描信息显示的画面，在“证件号码”后面增加“手机号码”，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 查找合同客户表的电话
	 */
	@Override
	public SalesVhclCbinRcitVO selectContractNoSearchTelData(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
		return salesVhclCbinRcitDAO.selectContractNoSearchTelData(searchVO);
	}

}
