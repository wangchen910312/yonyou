package chn.bhmc.dms.sal.rcp.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
import chn.bhmc.dms.sal.com.util.GlobalStatic;
import chn.bhmc.dms.sal.rcp.service.SalesAddTaxRcitService;
import chn.bhmc.dms.sal.rcp.service.dao.SalesAddTaxRcitDAO;
import chn.bhmc.dms.sal.rcp.vo.SalesAddReceiptAndCarBinDingVO;
import chn.bhmc.dms.sal.rcp.vo.SalesAddTaxRcitSaveVO;
import chn.bhmc.dms.sal.rcp.vo.SalesAddTaxRcitSearchVO;
import chn.bhmc.dms.sal.rcp.vo.SalesAddTaxRcitVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;

/**
 * <pre>
 * 영수증관리 > 부가세영수증관리
 * </pre>
 *
 * @ClassName   : SalesAddTaxRcitServiceImpl.java
 * @Description : 영수증관리 > 부가세영수증관리
 * @author chibeom.song
 * @since 2017. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 24.   chibeom.song     최초 생성
 * </pre>
 */
@Service("salesAddTaxRcitService")
public class SalesAddTaxRcitServiceImpl extends HService implements SalesAddTaxRcitService, JxlsSupport {

    /**
     * 영수증관리 > 부가세영수증관리 DAO
     */
    @Resource(name="salesAddTaxRcitDAO")
    SalesAddTaxRcitDAO salesAddTaxRcitDAO;

    @Autowired
    SalesCommonCamelService salesCommonCamelService;
    
    @Autowired
    VehicleMasterService vehicleMasterService;

    /**
     * 조회 조건에 해당하는 영수증관리 > 부가세영수증관리 정보를 조회한다.
     */
    @Override
    public List<SalesAddTaxRcitVO> selectSalesAddTaxReceiptSearchData(SalesAddTaxRcitSearchVO searchVO) throws Exception {
        return salesAddTaxRcitDAO.selectSalesAddTaxReceiptSearchData(searchVO);
    }

    /**
     * 조회 조건에 해당하는 영수증관리 > 부가세영수증관리 총 갯수를 조회한다.
     */
    @Override
    public int selectSalesAddTaxReceiptSearchCnt(SalesAddTaxRcitSearchVO searchVO) throws Exception {
        return salesAddTaxRcitDAO.selectSalesAddTaxReceiptSearchCnt(searchVO);
    }
    
    /**
     * <p>Title:绑定车架号-查询增值税列表数量 </p >
     * @author TangWei 2021年4月15日 下午2:44:52
     * @param SalesAddTaxRcitSearchVO searchVO
     * @return
     */
    @Override
    public int selectAddTaxReceiptListCnt(SalesAddTaxRcitSearchVO searchVO) throws Exception {
        return salesAddTaxRcitDAO.selectAddTaxReceiptListCnt(searchVO);
    }
    
    /**
     * <p>Title:绑定车架号-查询增值税列表数据 </p >
     * @author TangWei 2021年4月15日 下午2:44:52
     * @param SalesAddTaxRcitSearchVO searchVO
     * @return
     */
    @Override
    public List<SalesAddTaxRcitVO> selectAddTaxReceiptListData(SalesAddTaxRcitSearchVO searchVO) throws Exception {
        return salesAddTaxRcitDAO.selectAddTaxReceiptListData(searchVO);
    }
    
    /**
     * <p>Title:更新车辆绑定发票标识以及增票绑定车辆标识 </p >
     * @author TangWei 2021年4月19日 下午2:55:14
     * @param Map<String, Object> dataMap
     * @return
     */
    @SuppressWarnings("unchecked")
    @Override
    public void multiAddTaxReceiptAndCarBinDingInfo(Map<String, Object> dataMap) throws Exception {
        VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();
        List<String> carIdList = (List<String>) dataMap.get("carIdArray");
        List<String> vinNoList = (List<String>) dataMap.get("vinNoArray");
        for (int i=0;i<carIdList.size();i++) {
            // 获取carId
            String carId = String.valueOf(carIdList.get(i));
            // 获取vinNo
            String vinNo = String.valueOf(vinNoList.get(i));
            vehicleMasterVO.setCarId(carId);
            vehicleMasterVO.setBindingReceiptFlag(GlobalStatic.BINDING_RECEIPT_FLAG_3);
            // 更新车辆的绑定发票标识为03：增值税发票
            vehicleMasterService.updateCarAfterVerify(vehicleMasterVO);
            // 插入车辆发票绑定关系表SA_0508T
            SalesAddReceiptAndCarBinDingVO salesAddReceiptAndCarBinDingVO = new SalesAddReceiptAndCarBinDingVO();
            salesAddReceiptAndCarBinDingVO.setCarId(carId);
            salesAddReceiptAndCarBinDingVO.setVinNo(vinNo);
            salesAddReceiptAndCarBinDingVO.setReceiptId(String.valueOf(dataMap.get("receiptId")));
            salesAddReceiptAndCarBinDingVO.setReceiptNo(String.valueOf(dataMap.get("receiptNo")));
            salesAddReceiptAndCarBinDingVO.setReceiptCd(String.valueOf(dataMap.get("receiptCd")));
            salesAddTaxRcitDAO.insertSalesAddReceiptAndCarBinDing(salesAddReceiptAndCarBinDingVO);
            //增票绑定信息给DCS接口 SAL265 接口 jiaMing 2021-4-23 start
            Map<String, Object> message = new HashMap<String, Object>();
            message.put("RECEIPT_ID", String.valueOf(dataMap.get("receiptId")));
            message.put("RECEIPT_NO", String.valueOf(dataMap.get("receiptNo")));
            message.put("RECEIPT_CD", String.valueOf(dataMap.get("receiptCd")));
            message.put("CAR_ID", carId);
            message.put("VIN_NO", vinNo);
            message.put("DLR_CD", LoginUtil.getDlrCd());//上传店代码
            message.put("REG_USR_ID", LoginUtil.getUserId());//操作人
            message.put("REG_DT", DateUtil.convertToDateTimeString(new Date()));//操作时间
            message.put("INCL", "Y");//写入的标识 Y 代表提报 N 代表解绑 
            salesCommonCamelService.executeCamelClent(message,"SAL265");
          //增票绑定信息给DCS接口 SAL265接口 jiaMing 2021-4-23 end
        }
        // 更新增值税发票的绑定车辆标识为Y
        dataMap.put("bindingCarYn", "Y");
        updateAddTaxReceiptBinDingInfo(dataMap);
    }
    
    public int updateAddTaxReceiptBinDingInfo(Map<String, Object> map) throws Exception {
        return salesAddTaxRcitDAO.updateAddTaxReceiptBinDingInfo(map);
    }
    
    /**
     * <p>Title:绑定车架号-解绑 </p >
     * @author TangWei 2021年4月20日 下午2:39:00
     * @param Map<String, Object> map
     * @return
     */
    public void unbundlingAddTaxReceiptAndCar(Map<String, Object> map) throws Exception {
        // 根据receiptId,查询SA_0508T表，查询发票下面对应的车
        List<SalesAddReceiptAndCarBinDingVO> addReceiptAndCarList = selectAddReceiptAndCarList(map);
        if (addReceiptAndCarList != null && addReceiptAndCarList.size() > 0) {
            if (addReceiptAndCarList.size() == 1) {
                // 数量为1，说明发票只绑定了一辆车，所以除了更新车辆绑定发票标识外，还需更新发票绑定车辆标识
                map.put("bindingCarYn", "N");
                updateAddTaxReceiptBinDingInfo(map);
            }
            // 更新车辆绑定发票标识为     01：未绑定
            VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();
            vehicleMasterVO.setCarId(String.valueOf(map.get("carId")));
            vehicleMasterVO.setBindingReceiptFlag(GlobalStatic.BINDING_RECEIPT_FLAG_1);
            vehicleMasterService.updateCarAfterVerify(vehicleMasterVO);
            // 根据receiptId和carId，删除SA_0508T表的数据
            SalesAddReceiptAndCarBinDingVO salesAddReceiptAndCarBinDingVO = new SalesAddReceiptAndCarBinDingVO();
            salesAddReceiptAndCarBinDingVO.setCarId(String.valueOf(map.get("carId")));
            salesAddReceiptAndCarBinDingVO.setReceiptId(String.valueOf(map.get("receiptId")));
            deleteDataByReceiptIdAndCarId(salesAddReceiptAndCarBinDingVO);
            //增票解绑信息给DCS接口 SAL265 接口 jiaMing 2021-4-23 start
            Map<String, Object> message = new HashMap<String, Object>();
            message.put("RECEIPT_ID", String.valueOf(String.valueOf(map.get("receiptId"))));
            message.put("RECEIPT_NO", String.valueOf(String.valueOf(map.get("receiptNo"))));
            message.put("RECEIPT_CD", String.valueOf(String.valueOf(map.get("receiptCd"))));
            message.put("CAR_ID", String.valueOf(map.get("carId")));
            message.put("VIN_NO", String.valueOf(map.get("vinNo")));
            message.put("DLR_CD", LoginUtil.getDlrCd());//上传店代码
            message.put("REG_USR_ID", LoginUtil.getUserId());//操作人
            message.put("REG_DT", DateUtil.convertToDateTimeString(new Date()));//操作时间
            message.put("INCL", "N");//写入的标识 Y 代表提报 N 代表解绑 
            salesCommonCamelService.executeCamelClent(message,"SAL265");
          //增票解定信息给DCS接口 SAL265接口 jiaMing 2021-4-23 end
        }
    }
    
    public List<SalesAddReceiptAndCarBinDingVO> selectAddReceiptAndCarList(Map<String, Object> map) throws Exception {
        return salesAddTaxRcitDAO.selectAddReceiptAndCarList(map);
    }
    
    public void deleteDataByReceiptIdAndCarId(SalesAddReceiptAndCarBinDingVO salesAddReceiptAndCarBinDingVO) throws Exception {
        salesAddTaxRcitDAO.deleteDataByReceiptIdAndCarId(salesAddReceiptAndCarBinDingVO);
    }
    
    /**
     * <p>Title:更改赠票的是否显示状态 </p >
     * @author TangWei 2021年4月20日 下午20:23:03
     * @param Map<String,Map<String,Object>> map
     * @return
     */
    public void updateAddTaxReceiptShowYn(Map<String, Object> map) throws Exception {
    	salesAddTaxRcitDAO.updateAddTaxReceiptShowYn(map);
    }
    
    /**
     * 부가세영수증업로드 > 부가세영수증 정보등록
     */
    @Override
    public boolean insertSalesAddTaxReceiptSave(SalesAddTaxRcitSaveVO saveVO) throws Exception{
        String userId = LoginUtil.getUserId();
        SalesAddTaxRcitVO scanInfo = saveVO.getSalesAddTaxRcitVO();

        // 중복 영수증체크로직
        SalesAddTaxRcitSearchVO searchVO = new SalesAddTaxRcitSearchVO();
        searchVO.setsReceiptNo(scanInfo.getScanReceiptNo());
        int receiptNoCnt = salesAddTaxRcitDAO.selectAddTaxReceiptCnt(searchVO);
        if(receiptNoCnt > 0){
            throw processException("global.err.duplicate");
        }

        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);



        BaseSaveVO<SalesAddTaxRcitVO> addTaxRcitList = saveVO.getAddTaxRcitList();
        for(SalesAddTaxRcitVO salesAddTaxRcitVO : addTaxRcitList.getInsertList()){

            /*// 중복 VIN 체크로직
            searchVO.setsReceiptNo("");
            searchVO.setsVinNo(salesAddTaxRcitVO.getVinNo());
            int vinNoCnt = salesAddTaxRcitDAO.selectSalesAddTaxReceiptSearchCnt(searchVO);
            if(vinNoCnt > 0){
                throw processException("global.err.duplicate");
            }*/

            salesAddTaxRcitVO.setRegUsrId(userId);
            salesAddTaxRcitVO.setUpdtUsrId(userId);

            salesAddTaxRcitVO.setSecDlrCd(scanInfo.getSecDlrCd());
            salesAddTaxRcitVO.setTaxpayerIdCd(scanInfo.getScanTaxPayerId());
            salesAddTaxRcitVO.setReceiptNo(scanInfo.getScanReceiptNo());
            salesAddTaxRcitVO.setReceiptCd(scanInfo.getScanReceiptCd());
            salesAddTaxRcitVO.setBuyNm(scanInfo.getScanBuyNm());
            salesAddTaxRcitVO.setReceiptIssDt(DateUtil.convertToDate(scanInfo.getScanReceiptIssDate()));
            salesAddTaxRcitVO.setScanSumAmt(scanInfo.getScanIncTotAmt());
            salesAddTaxRcitVO.setReceiptImg(scanInfo.getScanBlob());

            salesAddTaxRcitVO.setRegDt(toDate);
            salesAddTaxRcitVO.setUpdtDt(toDate);

            // 본테이블에 저장
            salesAddTaxRcitDAO.insertSalesAddTaxReceiptSave(salesAddTaxRcitVO);

            //이미지 저장
            salesAddTaxRcitDAO.updateSalesAddTaxReceiptImg(salesAddTaxRcitVO);

            // 히스토리테이블에 저장
            //salesAddTaxRcitDAO.insertSalesAddTaxReceiptHistSave(salesAddTaxRcitVO);

            // IS 테이블에 저장
            //salesAddTaxRcitDAO.insertSalesAddTaxReceiptSaveIs(salesAddTaxRcitVO);
            // IS 테이블에 이미지 저장
            //salesAddTaxRcitDAO.updateSalesAddTaxReceiptImgIs(salesAddTaxRcitVO);

            //TODO [권기현] EAI 연동 테스트 2017-07-18

            try{
                 //Camel InterFace Header Info
                 Map<String, Object> message = new HashMap<String, Object>();

                 message.put("CAR_ID", salesAddTaxRcitVO.getCarId());
                 message.put("SEQ", salesAddTaxRcitVO.getSeq());
                 message.put("VIN_NO", salesAddTaxRcitVO.getVinNo());
                 message.put("VIN_NO1",salesAddTaxRcitVO.getVinNo().substring(0, 11));
                 message.put("VIN_NO2",salesAddTaxRcitVO.getVinNo().substring(11, 17));
                 message.put("DLR_CD", salesAddTaxRcitVO.getDlrCd());
                 message.put("TAXPAYER_ID_CD", salesAddTaxRcitVO.getTaxpayerIdCd());
                 message.put("RECEIPT_NO", salesAddTaxRcitVO.getReceiptNo());
                 message.put("RECEIPT_CD", salesAddTaxRcitVO.getReceiptCd());
                 message.put("BUY_NM", salesAddTaxRcitVO.getBuyNm());
                 message.put("RECEIPT_ISS_DT", DateUtil.convertToDateTimeString(salesAddTaxRcitVO.getReceiptIssDt()));
                 message.put("SCAN_SUM_AMT", salesAddTaxRcitVO.getScanSumAmt());
                 message.put("CARLINE_CD", salesAddTaxRcitVO.getCarlineCd());
                 message.put("MODEL_CD", salesAddTaxRcitVO.getModelCd());
                 message.put("JEONGPAN_NO", salesAddTaxRcitVO.getJeongpanNo());
                 message.put("EXT_COLOR_CD", salesAddTaxRcitVO.getExtColorCd());
                 message.put("WS_PRC", salesAddTaxRcitVO.getWsPrc());
                 message.put("PLT_GI_DT", DateUtil.convertToDateTimeString(salesAddTaxRcitVO.getPltGiDt()));
                 message.put("SUM_AMT", salesAddTaxRcitVO.getSumAmt());
                 message.put("TAX_AMT", salesAddTaxRcitVO.getTaxAmt());
                 message.put("FILE_NO", salesAddTaxRcitVO.getFileNo());
                 message.put("FILE_SEQ",  salesAddTaxRcitVO.getFileSeq());
                 message.put("FILE_SIZE_VAL",  salesAddTaxRcitVO.getFileSizeVal());
                 message.put("RECEIPT_IMG",  new String(salesAddTaxRcitVO.getReceiptImg(),"UTF-8"));
                 message.put("TMR_CD",  salesAddTaxRcitVO.getTmrCd());
                 message.put("EVAL_RSLT_CD",  salesAddTaxRcitVO.getEvalRsltCd());
                 message.put("ERR_UP_CD",  salesAddTaxRcitVO.getErrUpCd());
                 message.put("REG_USR_ID",  salesAddTaxRcitVO.getRegUsrId());
                 message.put("REG_DT",  DateUtil.convertToDateTimeString(salesAddTaxRcitVO.getRegDt()));
                 message.put("UPDT_USR_ID", LoginUtil.getUserId());
                 message.put("UPDT_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
                 message.put("IF_REG_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss") );
                 message.put("SDLR_CD",  salesAddTaxRcitVO.getSdlrCd());
                 message.put("TEMP_C01",  salesAddTaxRcitVO.getTempCd01());
                 message.put("TEMP_C02",  salesAddTaxRcitVO.getTempCd02());
                 message.put("TEMP_C03",  salesAddTaxRcitVO.getTempCd03());
                 message.put("TEMP_C04",  salesAddTaxRcitVO.getTempCd04());
                 message.put("TEMP_C05",  salesAddTaxRcitVO.getTempCd05());
                 message.put("TEMP_N01",  salesAddTaxRcitVO.getTempN01());
                 message.put("TEMP_N02",  salesAddTaxRcitVO.getTempN02());
                 message.put("TEMP_N03",  salesAddTaxRcitVO.getTempN03());
                 message.put("TEMP_N04",  salesAddTaxRcitVO.getTempN04());
                 message.put("TEMP_N05",  salesAddTaxRcitVO.getTempN05());
                 message.put("SDLR_TP",  salesAddTaxRcitVO.getSdlrTp());
                 message.put("SDLR_NM",  salesAddTaxRcitVO.getSdlrNm());


                 salesCommonCamelService.executeCamelClent(message,"SAL172");

            }catch(Exception e){
                log.error(e.getMessage(),e);
                throw e;
            }


        }
        return true;
    }

    /**
     * 조회 조건에 해당하는 영수증관리 > 부가세영수증관리 정보를 조회한다.
     */
    @Override
    public SalesAddTaxRcitVO selectAddTaxReceiptImageSearch(SalesAddTaxRcitSearchVO searchVO) throws Exception {
        return salesAddTaxRcitDAO.selectAddTaxReceiptImageSearch(searchVO);
    }

    /**
     * 엑셀 다운로드
     * @param list
     * @throws Exception
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        Date sReceiptStDt = null;
        Date sReceiptEdDt = null;
        Date sUploadStDt = null;
        Date sUploadEdDt = null;

        SalesAddTaxRcitSearchVO searchVO = new SalesAddTaxRcitSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드


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

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        searchVO.setsReceiptStDt(sReceiptStDt);
        searchVO.setsReceiptEdDt(sReceiptEdDt);
        searchVO.setsUploadStDt(sUploadStDt);
        searchVO.setsUploadEdDt(sUploadEdDt);

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<SalesAddTaxRcitVO> list = salesAddTaxRcitDAO.selectSalesAddTaxReceiptSearchData(searchVO);

        context.putVar("items", list);
    }

}
