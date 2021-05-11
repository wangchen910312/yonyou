package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmRepairOrderDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmRepairOrderService;
import chn.bhmc.dms.mob.api.crm.service.CrmSystemConfigInfoService;
import chn.bhmc.dms.mob.api.crm.vo.RepairOrderSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.RepairOrderVO;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.vo.RepairOrderIfVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderServiceImpl.java
 * @Description : RO ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("CrmrepairOrderService")
public class CrmRepairOrderServiceImpl extends HService implements CrmRepairOrderService {

    /**
     * 예약접수 DAO
     */
    @Resource(name="CrmrepairOrderDAO")
    CrmRepairOrderDAO CrmrepairOrderDAO;

    /**
     * 고객요구사항 및 고장설명
     */
    @Autowired
    ServiceCommonService serviceCommonService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="CrmsystemConfigInfoService")
    CrmSystemConfigInfoService CrmsystemConfigInfoService;

    /*
     * {@inheritDoc}
     */
    public List<RepairOrderVO> selectRepairOrdersHistory(RepairOrderSearchVO searchVO) throws Exception {

        String dateFormat = CrmsystemConfigInfoService.selectStrValueByKey("dateFormat");
        String pattern = dateFormat + " HH:mm:ss";

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        List<RepairOrderVO> roList = new ArrayList<RepairOrderVO>();
        List<RepairOrderIfVO> roIfList = new ArrayList<RepairOrderIfVO>();

        if(searchVO.getsSearchGubun().equals("MD")){

            roList = CrmrepairOrderDAO.selectRepairOrderHistoryByCondition(searchVO);

        } else if(searchVO.getsSearchGubun().equals("OD")){
            //Carmel InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();

            message.put("VIN_NO", searchVO.getsVinNo());
            message.put("RO_START_DT", DateUtil.getDate(searchVO.getsRoFromDt(),pattern));
            message.put("RO_END_DT", DateUtil.getDate(searchVO.getsRoToDt(),pattern));
            message.put("RO_DOC_NO", searchVO.getsRoDocNo());
            message.put("LBR_NM", searchVO.getsLbrNm());
            message.put("CAR_REG_NO", searchVO.getsCarRegNo());
            message.put("DRIVER_NM", searchVO.getsDriverNm());
            message.put("RO_TP", searchVO.getsRoTp());
            message.put("ITEM_NM", searchVO.getsItemNm());

            Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER055");

            if (receiveData.getFooter().getIfResult().equals("Z")) {
                roIfList = receiveData.readMessages(RepairOrderIfVO.class);
                RepairOrderVO roVO = new RepairOrderVO();

                for(int i = 0 ; i <  roIfList.size() ; i++){
                    roVO = new RepairOrderVO();

                    if(!roIfList.get(i).getDlrCd().equals(LoginUtil.getDlrCd())){
                        roVO.setDlrCd(roIfList.get(i).getDlrCd());
                        roVO.setRoDocNo(roIfList.get(i).getRoDocNo());
                        roVO.setRoTpNm(roIfList.get(i).getRoTpNm());
                        roVO.setVinNo(roIfList.get(i).getVinNo());
                        roVO.setCarRegNo(roIfList.get(i).getCarRegNo());
                        roVO.setCarOwnerId(roIfList.get(i).getCarOwnerId());
                        roVO.setCarOwnerNm(roIfList.get(i).getCarOwnerNm());
                        roVO.setDriverId(roIfList.get(i).getDriverId());
                        roVO.setDriverNm(roIfList.get(i).getDriverNm());
                        roVO.setRunDistVal(Integer.parseInt(StringUtils.defaultIfEmpty(roIfList.get(i).getRunDistVal(), "0")));
                        roVO.setLastRunDistVal(Integer.parseInt(StringUtils.defaultIfEmpty(roIfList.get(i).getLastRunDistVal(), "0")));
                        roVO.setBaseRoNo(roIfList.get(i).getBaseRoNo());
                        roVO.setRoStatCd(roIfList.get(i).getRoStatCd());
                        roVO.setRoStatNm(roIfList.get(i).getRoStatNm());
                        roVO.setRoDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoDt() ,pattern));
                        roVO.setRoGrpNo(roIfList.get(i).getRoGrpNo());
                        roVO.setRoStartDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoStartDt() ,pattern));
                        roVO.setRoEndDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoEndDt() ,pattern));
                        roVO.setCarlineNm(roIfList.get(i).getCarlineNm());
                        roVO.setModelNm(roIfList.get(i).getModelNm());
                        roVO.setRegUsrNm(roIfList.get(i).getRegUsrNm());
                        roVO.setUpdtDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoUpdtDt(),pattern));
                        roVO.setCalcDocNo(roIfList.get(i).getCalcDocNo());
                        roVO.setCalcRegDt(DateUtil.convertToTimestamp(roIfList.get(i).getCalcRegDt()));
                        roVO.setPaymYnNm(roIfList.get(i).getPaymYnNm());
                        roVO.setCalcCompUsrNm(roIfList.get(i).getCalcCompUsrNm());
                        roVO.setRoPrintDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoPrintDt()));
                        roVO.setCalcPrsnNm(roIfList.get(i).getCalcPrsnNm());
                        roVO.setCalcDt(DateUtil.convertToTimestamp(roIfList.get(i).getCalcDt()));
                        roVO.setSearchGubun("OD");

                        roList.add(roVO);
                    }
                }

            } else {
                throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            }
        } else if(searchVO.getsSearchGubun().equals("AD")) {

            Date realRoFromDt = searchVO.getsRoFromDt();
            Date realRoToDt = searchVO.getsRoFromDt();

            Date today = new Date();
            String strDate = DateUtil.convertToDateTimeString(today);
            searchVO.setsRoFromDt(DateUtil.convertToDate(strDate, dateFormat));
            searchVO.setsRoToDt(DateUtil.convertToDate(strDate, dateFormat));

            roList = CrmrepairOrderDAO.selectRepairOrderHistoryByCondition(searchVO);

            //Carmel InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();

            message.put("VIN_NO", searchVO.getsVinNo());
            message.put("RO_START_DT", DateUtil.getDate(realRoFromDt,pattern));
            message.put("RO_END_DT", DateUtil.getDate(realRoToDt,pattern));
            message.put("RO_DOC_NO", searchVO.getsRoDocNo());
            message.put("LBR_NM", searchVO.getsLbrNm());
            message.put("CAR_REG_NO", searchVO.getsCarRegNo());
            message.put("DRIVER_NM", searchVO.getsDriverNm());
            message.put("RO_TP", searchVO.getsRoTp());
            message.put("ITEM_NM", searchVO.getsItemNm());

            Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER055");

            if (receiveData.getFooter().getIfResult().equals("Z")) {
                roIfList = receiveData.readMessages(RepairOrderIfVO.class);
                RepairOrderVO roVO = new RepairOrderVO();

                for(int i = 0 ; i <  roIfList.size() ; i++){
                    roVO = new RepairOrderVO();

                    roVO.setDlrCd(roIfList.get(i).getDlrCd());
                    roVO.setRoDocNo(roIfList.get(i).getRoDocNo());
                    roVO.setRoTpNm(roIfList.get(i).getRoTpNm());
                    roVO.setVinNo(roIfList.get(i).getVinNo());
                    roVO.setCarRegNo(roIfList.get(i).getCarRegNo());
                    roVO.setCarOwnerId(roIfList.get(i).getCarOwnerId());
                    roVO.setCarOwnerNm(roIfList.get(i).getCarOwnerNm());
                    roVO.setDriverId(roIfList.get(i).getDriverId());
                    roVO.setDriverNm(roIfList.get(i).getDriverNm());
                    roVO.setRunDistVal(Integer.parseInt(StringUtils.defaultIfEmpty(roIfList.get(i).getRunDistVal(), "0")));
                    roVO.setLastRunDistVal(Integer.parseInt(StringUtils.defaultIfEmpty(roIfList.get(i).getLastRunDistVal(), "0")));
                    roVO.setBaseRoNo(roIfList.get(i).getBaseRoNo());
                    roVO.setRoStatCd(roIfList.get(i).getRoStatCd());
                    roVO.setRoStatNm(roIfList.get(i).getRoStatNm());
                    roVO.setRoDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoDt(), pattern));
                    roVO.setRoGrpNo(roIfList.get(i).getRoGrpNo());
                    roVO.setRoStartDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoStartDt(), pattern));
                    roVO.setRoEndDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoEndDt(), pattern));
                    roVO.setCarlineNm(roIfList.get(i).getCarlineNm());
                    roVO.setModelNm(roIfList.get(i).getModelNm());
                    roVO.setRegUsrNm(roIfList.get(i).getRegUsrNm());
                    roVO.setUpdtDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoUpdtDt(),pattern));
                    roVO.setCalcDocNo(roIfList.get(i).getCalcDocNo());
                    roVO.setCalcRegDt(DateUtil.convertToTimestamp(roIfList.get(i).getCalcRegDt()));
                    roVO.setPaymYnNm(roIfList.get(i).getPaymYnNm());
                    roVO.setCalcCompUsrNm(roIfList.get(i).getCalcCompUsrNm());
                    roVO.setRoPrintDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoPrintDt()));
                    roVO.setCalcPrsnNm(roIfList.get(i).getCalcPrsnNm());
                    roVO.setCalcDt(DateUtil.convertToTimestamp(roIfList.get(i).getCalcDt()));
                    if(!roIfList.get(i).getDlrCd().equals(LoginUtil.getDlrCd())){
                        roVO.setSearchGubun("OD");
                    }
                    roList.add(roVO);
                }
            } else {
                throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            }

        }

        return roList;
    }
}