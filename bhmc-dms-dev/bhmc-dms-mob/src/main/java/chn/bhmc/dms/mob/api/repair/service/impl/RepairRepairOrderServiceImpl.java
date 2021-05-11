package chn.bhmc.dms.mob.api.repair.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.repair.dao.RepairRepairOrderDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairRepairOrderService;
import chn.bhmc.dms.mob.api.repair.service.RepairServiceCommonService;
import chn.bhmc.dms.mob.api.repair.service.RepairSystemConfigInfoService;
import chn.bhmc.dms.mob.api.repair.vo.RepairOrderIfVO;
import chn.bhmc.dms.mob.api.repair.vo.RepairOrderSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.RepairOrderVO;



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

@Service("RepairRepairOrderService")
public class RepairRepairOrderServiceImpl extends HService implements RepairRepairOrderService, JxlsSupport {

    @Resource(name="RepairRepairOrderDAO")
    RepairRepairOrderDAO RepairRepairOrderDAO;

    @Autowired
    RepairServiceCommonService RepairServiceCommonService;

    @Resource(name="RepairSystemConfigInfoService")
    RepairSystemConfigInfoService RepairSystemConfigInfoService;

    @Override
    public int selectRepairOrderByConditionCnt(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return RepairRepairOrderDAO.selectRepairOrderByConditionCnt(searchVO);
    }

    @Override
    public List<RepairOrderVO> selectRepairOrderByCondition(RepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        List<RepairOrderVO> resvList = RepairRepairOrderDAO.selectRepairOrderByCondition(searchVO);


        return resvList;
    }
    
    public List<RepairOrderVO> selectRepairOrderHistoryByCondition(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairRepairOrderDAO.selectRepairOrderHistoryByCondition(searchVO);
    }
    
    public List<RepairOrderVO> selectRepairOrderListByCondition(RepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<RepairOrderVO> resvList = RepairRepairOrderDAO.selectRepairOrderListByCondition(searchVO);


        return resvList;
    }
    
    public List<RepairOrderVO> selectLbrHistListByCondition(RepairOrderSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairRepairOrderDAO.selectLbrHistListByCondition(searchVO);
    }
    
    public List<RepairOrderVO> selectCustDmndHistListByCondition(RepairOrderSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairRepairOrderDAO.selectCustDmndHistListByCondition(searchVO);
    }
    
    public List<RepairOrderVO> selectEtcHistListByCondition(RepairOrderSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairRepairOrderDAO.selectEtcHistListByCondition(searchVO);
    }
    
    public List<RepairOrderVO> selectRepairOrderInfoListByCondition(RepairOrderSearchVO searchVO) throws Exception{


        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<RepairOrderVO> resvList = RepairRepairOrderDAO.selectRepairOrderInfoListByCondition(searchVO);


        return resvList;

    }
    
    public int selectCarWashListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairRepairOrderDAO.selectCarWashListByConditionCnt(searchVO);
    }
    
    public List<RepairOrderVO> selectCarWashListByCondition(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairRepairOrderDAO.selectCarWashListByCondition(searchVO);
    }
    
    @Override
    public int selectRepairOrderListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return RepairRepairOrderDAO.selectRepairOrderListByConditionCnt(searchVO);
    }
    
    public int selectRepairOrderInfoListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception{


        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return RepairRepairOrderDAO.selectRepairOrderInfoListByConditionCnt(searchVO);
    }

    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        RepairOrderSearchVO searchVO = new RepairOrderSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<RepairOrderVO> list = null;
        String sListType = (String)params.get("sListType");

        if(StringUtil.nullConvert(sListType).equals("RS")){
            if(!StringUtils.isBlank(params.get("sExpcDlToDt").toString())){
                String sExpcDlToDt = params.get("sExpcDlToDt").toString();
                Date dExpcDlToDt = DateUtil.convertToDate(sExpcDlToDt);
                searchVO.setsExpcDlToDt(dExpcDlToDt);
            }
            if(!StringUtils.isBlank(params.get("sExpcDlFromDt").toString())){
                String sExpcDlFromDt = params.get("sExpcDlFromDt").toString();
                Date dExpcDlFromDt = DateUtil.convertToDate(sExpcDlFromDt);
                searchVO.setsExpcDlFromDt(dExpcDlFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            if(!StringUtils.isBlank(params.get("sRoTpList").toString())){
                String[] result = params.get("sRoTpList").toString().split(",");
                List<String> sRoTpList = new ArrayList<String>();
                for(int i=0;i<result.length;i++){
                    sRoTpList.add(i, result[i]);
                }
                searchVO.setsRoTpList(sRoTpList);
            }
            if(!StringUtils.isBlank(params.get("sCustSaleFromDt").toString())){
                String sCustSaleFromDt = params.get("sCustSaleFromDt").toString();
                Date dCustSaleFromDt = DateUtil.convertToDate(sCustSaleFromDt);
                searchVO.setsCustSaleFromDt(dCustSaleFromDt);
            }
            if(!StringUtils.isBlank(params.get("sCustSaleToDt").toString())){
                String sCustSaleToDt = params.get("sCustSaleToDt").toString();
                Date dCustSaleToDt = DateUtil.convertToDate(sCustSaleToDt);
                searchVO.setsCustSaleToDt(dCustSaleToDt);
            }
            if(!StringUtils.isBlank(params.get("sPayEndFromDt").toString())){
                String sPayEndFromDt = params.get("sPayEndFromDt").toString();
                Date dPayEndFromDt = DateUtil.convertToDate(sPayEndFromDt);
                searchVO.setsPayEndFromDt(dPayEndFromDt);
            }
            if(!StringUtils.isBlank(params.get("sPayEndToDt").toString())){
                String sPayEndToDt = params.get("sPayEndToDt").toString();
                Date dPayEndToDt = DateUtil.convertToDate(sPayEndToDt);
                searchVO.setsPayEndToDt(dPayEndToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectRepairOrderListByCondition(searchVO);

        }else if(StringUtil.nullConvert(sListType).equals("LH")){

            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            if(!StringUtils.isBlank(params.get("sCalcFromDt").toString())){
                String sCalcFromDt = params.get("sCalcFromDt").toString();
                Date dCalcFromDt = DateUtil.convertToDate(sCalcFromDt);
                searchVO.setsCalcFromDt(dCalcFromDt);
            }
            if(!StringUtils.isBlank(params.get("sCalcToDt").toString())){
                String sCalcToDt = params.get("sCalcToDt").toString();
                Date dCalcToDt = DateUtil.convertToDate(sCalcToDt);
                searchVO.setsCalcToDt(dCalcToDt);
            }
            if(!StringUtils.isBlank(params.get("sPayFromDt").toString())){
                String sPayFromDt = params.get("sPayFromDt").toString();
                Date dPayFromDt = DateUtil.convertToDate(sPayFromDt);
                searchVO.setsPayFromDt(dPayFromDt);
            }
            if(!StringUtils.isBlank(params.get("sPayToDt").toString())){
                String sPayToDt = params.get("sPayToDt").toString();
                Date dPayToDt = DateUtil.convertToDate(sPayToDt);
                searchVO.setsPayToDt(dPayToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectLbrHistListByCondition(searchVO);

        }else if(StringUtil.nullConvert(sListType).equals("CH")){

            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectCustDmndHistListByCondition(searchVO);

        }else if(StringUtil.nullConvert(sListType).equals("EH")){

            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectEtcHistListByCondition(searchVO);

        }else if(StringUtil.nullConvert(sListType).equals("RH")){

            String dateFormat = RepairSystemConfigInfoService.selectStrValueByKey("dateFormat");
            String pattern = dateFormat + " HH:mm:ss";

            List<RepairOrderIfVO> roIfList = new ArrayList<RepairOrderIfVO>();

            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectRepairOrderHistoryByCondition(searchVO);

            if(searchVO.getsSearchGubun().equals("MD")){

                list = RepairRepairOrderDAO.selectRepairOrderHistoryByCondition(searchVO);

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

                Data receiveData = RepairServiceCommonService.executeCamelClentSearchResult(message,"SER055");

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

                            list.add(roVO);
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

                list = RepairRepairOrderDAO.selectRepairOrderHistoryByCondition(searchVO);

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

                Data receiveData = RepairServiceCommonService.executeCamelClentSearchResult(message,"SER055");

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
                        list.add(roVO);
                    }
                } else {
                    throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
                }
            }
        } else if (StringUtil.nullConvert(sListType).equals("AL") ||    // 배정
                   StringUtil.nullConvert(sListType).equals("QT") ||    // 품질검사
                   StringUtil.nullConvert(sListType).equals("WRK")){    // 정비진도
            if(!StringUtils.isBlank(params.get("sExpcDlToDt").toString())){
                String sExpcDlToDt = params.get("sExpcDlToDt").toString();
                Date dExpcDlToDt = DateUtil.convertToDate(sExpcDlToDt);
                searchVO.setsExpcDlToDt(dExpcDlToDt);
            }
            if(!StringUtils.isBlank(params.get("sExpcDlFromDt").toString())){
                String sExpcDlFromDt = params.get("sExpcDlFromDt").toString();
                Date dExpcDlFromDt = DateUtil.convertToDate(sExpcDlFromDt);
                searchVO.setsExpcDlFromDt(dExpcDlFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
            list = selectRepairOrderByCondition(searchVO);
        } else if (StringUtil.nullConvert(sListType).equals("WP")){         // 정비진도현황
             if(!StringUtils.isBlank(params.get("sExpcDlToDt").toString())){
                 String sExpcDlToDt = params.get("sExpcDlToDt").toString();
                 Date dExpcDlToDt = DateUtil.convertToDate(sExpcDlToDt);
                 searchVO.setsExpcDlToDt(dExpcDlToDt);
             }
             if(!StringUtils.isBlank(params.get("sExpcDlFromDt").toString())){
                 String sExpcDlFromDt = params.get("sExpcDlFromDt").toString();
                 Date dExpcDlFromDt = DateUtil.convertToDate(sExpcDlFromDt);
                 searchVO.setsExpcDlFromDt(dExpcDlFromDt);
             }
             if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                 String sRoFromDt = params.get("sRoFromDt").toString();
                 Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                 searchVO.setsRoFromDt(dRoFromDt);
             }
             if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                 String sRoToDt = params.get("sRoToDt").toString();
                 Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                 searchVO.setsRoToDt(dRoToDt);
             }

             if(!StringUtils.isBlank(params.get("sAssignFromDt").toString())){
                 String sAssignFromDt = params.get("sAssignFromDt").toString();
                 Date dAssignFromDt = DateUtil.convertToDate(sAssignFromDt);
                 searchVO.setsAssignFromDt(dAssignFromDt);
             }
             if(!StringUtils.isBlank(params.get("sAssignToDt").toString())){
                 String sAssignToDt = params.get("sAssignToDt").toString();
                 Date dAssignToDt = DateUtil.convertToDate(sAssignToDt);
                 searchVO.setsAssignToDt(dAssignToDt);
             }

             if(!StringUtils.isBlank(params.get("sWorkFromDt").toString())){
                 String sWorkFromDt = params.get("sWorkFromDt").toString();
                 Date dWorkFromDt = DateUtil.convertToDate(sWorkFromDt);
                 searchVO.setsWorkFromDt(dWorkFromDt);
             }
             if(!StringUtils.isBlank(params.get("sWorkToDt").toString())){
                 String sWorkToDt = params.get("sWorkToDt").toString();
                 Date dWorkToDt = DateUtil.convertToDate(sWorkToDt);
                 searchVO.setsWorkToDt(dWorkToDt);
             }

             if(!StringUtils.isBlank(params.get("sQtTestFromDt").toString())){
                 String sQtTestFromDt = params.get("sQtTestFromDt").toString();
                 Date dQtTestFromDt = DateUtil.convertToDate(sQtTestFromDt);
                 searchVO.setsQtTestFromDt(dQtTestFromDt);
             }
             if(!StringUtils.isBlank(params.get("sQtTestToDt").toString())){
                 String sQtTestToDt = params.get("sQtTestToDt").toString();
                 Date dQtTestToDt = DateUtil.convertToDate(sQtTestToDt);
                 searchVO.setsQtTestToDt(dQtTestToDt);
             }

             if(!StringUtils.isBlank(params.get("sDlChkFromDt").toString())){
                 String sDlChkFromDt = params.get("sDlChkFromDt").toString();
                 Date dDlChkFromDt = DateUtil.convertToDate(sDlChkFromDt);
                 searchVO.setsDlChkFromDt(dDlChkFromDt);
             }
             if(!StringUtils.isBlank(params.get("sDlChkToDt").toString())){
                 String sDlChkToDt = params.get("sDlChkToDt").toString();
                 Date dDlChkToDt = DateUtil.convertToDate(sDlChkToDt);
                 searchVO.setsDlChkToDt(dDlChkToDt);
             }
             searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
             searchVO.setsDlrCd(LoginUtil.getDlrCd());
             ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
             list = selectRepairOrderInfoListByCondition(searchVO);
         } else {
            if(!StringUtils.isBlank(params.get("sPreChkFromDt").toString())){
                String sPreChkFromDt = params.get("sPreChkFromDt").toString();
                Date dPreChkFromDt = DateUtil.convertToDate(sPreChkFromDt);
                searchVO.setsPreChkFromDt(dPreChkFromDt);
            }
            if(!StringUtils.isBlank(params.get("sPreChkToDt").toString())){
                String sPreChkToDt = params.get("sPreChkToDt").toString();
                Date dPreChkToDt = DateUtil.convertToDate(sPreChkToDt);
                searchVO.setsPreChkToDt(dPreChkToDt);
            }
            if(!StringUtils.isBlank(params.get("sCarWashStartFromDt").toString())){
                String sCarWashStartFromDt = params.get("sCarWashStartFromDt").toString();
                Date dCarWashStartFromDt = DateUtil.convertToDate(sCarWashStartFromDt);
                searchVO.setsCarWashStartFromDt(dCarWashStartFromDt);
            }
            if(!StringUtils.isBlank(params.get("sCarWashStartToDt").toString())){
                String sCarWashStartToDt = params.get("sCarWashStartToDt").toString();
                Date dCarWashStartToDt = DateUtil.convertToDate(sCarWashStartToDt);
                searchVO.setsCarWashStartToDt(dCarWashStartToDt);
            }
            if(!StringUtils.isBlank(params.get("sCarWashEndFromDt").toString())){
                String sCarWashEndFromDt = params.get("sCarWashEndFromDt").toString();
                Date dCarWashEndFromDt = DateUtil.convertToDate(sCarWashEndFromDt);
                searchVO.setsCarWashEndFromDt(dCarWashEndFromDt);
            }
            if(!StringUtils.isBlank(params.get("sCarWashEndToDt").toString())){
                String sCarWashEndToDt = params.get("sCarWashEndToDt").toString();
                Date dCarWashEndToDt = DateUtil.convertToDate(sCarWashEndToDt);
                searchVO.setsCarWashEndToDt(dCarWashEndToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());

            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectCarWashListByCondition(searchVO);
        }
        context.putVar("items", list);
    }

}