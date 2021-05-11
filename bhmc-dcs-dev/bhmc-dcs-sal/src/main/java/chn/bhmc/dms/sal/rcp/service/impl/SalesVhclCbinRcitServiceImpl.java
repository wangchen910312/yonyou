package chn.bhmc.dms.sal.rcp.service.impl;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.BlobVO;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
import chn.bhmc.dms.sal.rcp.service.SalesVhclCbinRcitService;
import chn.bhmc.dms.sal.rcp.service.dao.SalesVhclCbinRcitDAO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitSearchVO;
import chn.bhmc.dms.sal.rcp.vo.SalesVhclCbinRcitVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoVO;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

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
    
    
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 영수증관리 > 기동차통일영수증관리 DAO
     */
    @Resource(name = "salesVhclCbinRcitDAO")
    SalesVhclCbinRcitDAO salesVhclCbinRcitDAO;

    @Resource(name="eaiClient")
    EaiClient eaiClient;

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
    public int insertSalesVehicleCombineReceiptSave(SalesVhclCbinRcitVO salesVhclCbinRcitVO) throws Exception {

        int result = 0;
        String userId = LoginUtil.getUserId();

        salesVhclCbinRcitVO.setRegUsrId(userId);
        salesVhclCbinRcitVO.setUpdtUsrId(userId);
        salesVhclCbinRcitVO.setDlrCd(LoginUtil.getDlrCd());

        salesVhclCbinRcitVO.setReceiptImg(salesVhclCbinRcitVO.getScanBlob());

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

        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);

        salesVhclCbinRcitVO.setRegDt(toDate);
        salesVhclCbinRcitVO.setUpdtDt(toDate);

        // 본테이블에 데이터 저장
        result = salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptSave(salesVhclCbinRcitVO);
        // 본테이블에 blob이미지 저장
        salesVhclCbinRcitDAO.updateSalesVehicleCombineReceiptImg(salesVhclCbinRcitVO);

        // 히스토리 테이블에 데이터 저장
        //salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptHistSave(salesVhclCbinRcitVO);


        String warrantyUpdtCd = salesVhclCbinRcitDAO.selectVehicleMasterUpdtCd(salesVhclCbinRcitVO);
        if (!warrantyUpdtCd.equals("B")) {
            // 차량마스터테이블에 보증수리적용일자를 영수증 발행일자로 업데이트
            salesVhclCbinRcitDAO.updateSalesVehicleMasterSave(salesVhclCbinRcitVO);
            // 차량마스터 변경 프로시저 호출
            VehOfCustInfoVO vehOfCustInfoVO = new VehOfCustInfoVO();
            vehOfCustInfoVO.setCarId(salesVhclCbinRcitVO.getCarId());
            /*vehOfCustInfoService.vinMasterChangeCall(vehOfCustInfoVO); 대기중*/
        }

        // IS 테이블에 데이터 저장
        salesVhclCbinRcitDAO.insertSalesVehicleCombineReceiptSaveIs(salesVhclCbinRcitVO);
        // 본테이블에 blob이미지 저장
        salesVhclCbinRcitDAO.updateSalesVehicleCombineReceiptImgIs(salesVhclCbinRcitVO);

        /*
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
            salesCommonCamelService.executeWebSeviceEaiCall(salesVhclCbinRcitVO.getDlrCd(), "SAL171", "SAL", message, "N");

       }catch(Exception e){
           log.error(e.getMessage(),e);
           throw e;
       }
       */

        /*
        //EAI 호출
        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()

        .ifId("SAL200")
        .company("H")
        .sender("DCS")
        .receiver("ALL")
        .build()
        .buildCommDMSDoc();

        eaiClient.sendRequest(reqCommDMSDoc);
         */


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
    @SuppressWarnings("restriction")
	@Override
    public SalesVhclCbinRcitVO selectReceiptImageSearchData(SalesVhclCbinRcitSearchVO searchVO) throws Exception {
    	/**
    	 * 2020.08.20 update by tjx 修改dcs机动车统一发票图片查询逻辑   
    	 */
    	SalesVhclCbinRcitVO selectReceiptImageSearchData = salesVhclCbinRcitDAO.selectReceiptImageSearchData(searchVO);
    	//没有图片信息
    	if(null == selectReceiptImageSearchData) {
    		throw processException("sal.lbl.notRcptImage"); //没有发票图片信息
    	}
    	
		//数据库没有图片blob数据,存在图片路径(已删除),从本地获取并显示
		if(null != selectReceiptImageSearchData.getImgPath() || !"".equals(selectReceiptImageSearchData.getImgPath())) {
		
		InputStream inputStream = null;
		byte[] buffer = null;
			try {
	            inputStream = new FileInputStream(selectReceiptImageSearchData.getImgPath());
	            int count = 0;
	            while (count == 0) {
	                count = inputStream.available();
	            }
	            buffer = new byte[count];
	            inputStream.read(buffer);
	            
	    		BASE64Encoder encoder = new BASE64Encoder();
	            String encode = encoder.encode(buffer);  
	            BASE64Decoder decoder = new sun.misc.BASE64Decoder();
	            byte[] decodeBuffer = decoder.decodeBuffer(encode);
	            
	    		selectReceiptImageSearchData.setImgDecoder(decodeBuffer);
	    		
	    		return selectReceiptImageSearchData;
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            if (inputStream != null) {
	                try {
	                    // 关闭inputStream流
	                    inputStream.close();
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
        }
		
    	//数据库存在图片,从数据库中查询发票图片数据
		return selectReceiptImageSearchData;
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
      /**
        Date sCustSaleStDt = null;
        Date sCustSaleEtDt = null;
        Date sReceiptStDt = null;
        Date sReceiptEdDt = null;
        Date sUploadStDt = null;
        Date sUploadEdDt = null;
      **/
        SalesVhclCbinRcitSearchVO searchVO = new SalesVhclCbinRcitSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        /**
        if(params.get("sCustSaleStDt") != null){
            sCustSaleStDt = DateUtil.convertToDate((String)params.get("sCustSaleStDt"), "yyyyMMdd");
        }

        if(params.get("sCustSaleEtDt") != null){
            sCustSaleEtDt = DateUtil.convertToDate((String)params.get("sCustSaleEtDt"), "yyyyMMdd");
        }

        if(params.get("sReceiptStDt") != null){
            sReceiptStDt = DateUtil.convertToDate((String)params.get("sReceiptStDt"), "yyyyMMdd");
        }

        if(params.get("sReceiptEdDt") != null){
            sReceiptEdDt = DateUtil.convertToDate((String)params.get("sReceiptEdDt"), "yyyyMMdd");
        }

        if(params.get("sUploadStDt") != null){
            sUploadStDt = DateUtil.convertToDate((String)params.get("sUploadStDt"), "yyyyMMdd");
        }

        if(params.get("sUploadEdDt") != null){
            sUploadEdDt = DateUtil.convertToDate((String)params.get("sUploadEdDt"), "yyyyMMdd");
        }
        **/
        /**
        if (StringUtils.isNotEmpty((String)params.get("sCustSaleStDt")) && !"NULL".equals(((String)params.get("sCustSaleStDt")).toUpperCase())) {
            searchVO.setsCustSaleStDt(DateUtil.convertToDate((String)params.get("sCustSaleStDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sCustSaleEtDt")) && !"NULL".equals(((String)params.get("sCustSaleEtDt")).toUpperCase())) {
            searchVO.setsCustSaleEdDt(DateUtil.convertToDate((String)params.get("sCustSaleEtDt")));
        }
        
        if (StringUtils.isNotEmpty((String)params.get("sReceiptStDt")) && !"NULL".equals(((String)params.get("sReceiptStDt")).toUpperCase())) {
            searchVO.setsReceiptStDt(DateUtil.convertToDate((String)params.get("sReceiptStDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sReceiptEdDt")) && !"NULL".equals(((String)params.get("sReceiptEdDt")).toUpperCase())) {
            searchVO.setsReceiptEdDt(DateUtil.convertToDate((String)params.get("sReceiptEdDt")));
        }
        
        if (StringUtils.isNotEmpty((String)params.get("sUploadStDt")) && !"NULL".equals(((String)params.get("sUploadStDt")).toUpperCase())) {
            searchVO.setsUploadStDt(DateUtil.convertToDate((String)params.get("sUploadStDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sUploadEdDt")) && !"NULL".equals(((String)params.get("sUploadEdDt")).toUpperCase())) {
            searchVO.setsUploadEdDt(DateUtil.convertToDate((String)params.get("sUploadEdDt")));
        }
        
       **/
        
        if(!StringUtils.isBlank(params.get("sCustSaleStDt").toString())){
            String sCustSaleStDt = params.get("sCustSaleStDt").toString();
            Date dCustSaleStDt = DateUtil.convertToDate(sCustSaleStDt);
            searchVO.setsCustSaleStDt(dCustSaleStDt);
        }
        if(!StringUtils.isBlank(params.get("sCustSaleEdDt").toString())){
            String sCustSaleEdDt = params.get("sCustSaleEdDt").toString();
            Date dCustSaleEdDt = DateUtil.convertToDate(sCustSaleEdDt);
            searchVO.setsCustSaleEdDt(dCustSaleEdDt);
        }
        
        if(!StringUtils.isBlank(params.get("sReceiptStDt").toString())){
            String sReceiptStDt = params.get("sReceiptStDt").toString();
            Date dReceiptStDt = DateUtil.convertToDate(sReceiptStDt);
            searchVO.setsReceiptStDt(dReceiptStDt);
        }
        if(!StringUtils.isBlank(params.get("sReceiptEdDt").toString())){
            String sReceiptEdDt = params.get("sReceiptEdDt").toString();
            Date dReceiptEdDt = DateUtil.convertToDate(sReceiptEdDt);
            searchVO.setsReceiptEdDt(dReceiptEdDt);
        }
        
//        if(!StringUtils.isBlank(params.get("sUploadStDt").toString())){
//            String sUploadStDt = params.get("sUploadStDt").toString();
//            Date dUploadStDt = DateUtil.convertToDate(sUploadStDt);
//            searchVO.setsUploadStDt(dUploadStDt);
//        }
//        if(!StringUtils.isBlank(params.get("sUploadEdDt").toString())){
//            String sUploadEdDt = params.get("sUploadEdDt").toString();
//            Date dUploadEdDt = DateUtil.convertToDate(sUploadEdDt);
//            searchVO.setsUploadEdDt(dUploadEdDt);
//        }
        
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        /**
        searchVO.setsCustSaleStDt(sCustSaleStDt);
        searchVO.setsCustSaleEdDt(sCustSaleEtDt);
        searchVO.setsReceiptStDt(sReceiptStDt);
        searchVO.setsReceiptEdDt(sReceiptEdDt);
        searchVO.setsUploadStDt(sUploadStDt);
        searchVO.setsUploadEdDt(sUploadEdDt);
        **/

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<SalesVhclCbinRcitVO> list = salesVhclCbinRcitDAO.selectSalesVehicleCombineReceiptSearchData(searchVO);

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        // 获取SAF001(发票验证结果)共同编码，翻译导出excel字段值
        List<CommonCodeVO> commonCodes = commonCodeService.selectCommonCodesByCmmGrpCd("SAF001", null, langCd);
        for (SalesVhclCbinRcitVO vo : list) {
            if (vo.getCertFst()!=null && !vo.getCertFst().equals("")) {
                for (int i=0; i<commonCodes.size(); i++) {
                    if (vo.getCertFst().equals(commonCodes.get(i).getCmmCd())) {
                        vo.setCertFstNm(commonCodes.get(i).getCmmCdNm());
                        continue;
                    }
                }
            }
        }
        context.putVar("items", list);
    }

}
