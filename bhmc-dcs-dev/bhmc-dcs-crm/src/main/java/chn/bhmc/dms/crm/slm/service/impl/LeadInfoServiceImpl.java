package chn.bhmc.dms.crm.slm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cmm.service.CallInfoService;
import chn.bhmc.dms.crm.cmm.service.CarLineInfoService;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSaveVO;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.crm.slm.service.dao.LeadInfoDAO;
import chn.bhmc.dms.crm.slm.vo.LeadInfoSaveVO;
import chn.bhmc.dms.crm.slm.vo.LeadInfoSearchVO;
import chn.bhmc.dms.crm.slm.vo.LeadInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LeadInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 2. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 25.     Kyo Jin Lee     최초 생성
 * </pre>
 */
@Service("leadInfoService")
public class LeadInfoServiceImpl extends HService implements LeadInfoService {

    /**
     * 리드 관리 DAO
     */
    @Resource(name="leadInfoDAO")
    LeadInfoDAO leadInfoDAO;

    /**
     * 고객관리 Service
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 콜정보 Service
     */
    @Resource(name="callInfoService")
    CallInfoService callInfoService;

    /**
     * 판매기회 Service salesOpptMgmtService
     */
    @Resource(name="salesOpptMgmtService")
    SalesOpptMgmtService salesOpptMgmtService;

    /**
     * 관신차종 Management Service
     */
    @Resource(name="carLineInfoService")
    CarLineInfoService carLineInfoService;

    /**
     * 시스템 설정 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#selectLeadInfoByConditionCnt(chn.bhmc.dms.crm.slm.vo.LeadInfoSearchVO)
     */
    @Override
    public int selectLeadInfoByConditionCnt(LeadInfoSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        //if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return leadInfoDAO.selectLeadInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#selectLeadInfoByCondition(chn.bhmc.dms.crm.slm.vo.LeadInfoSearchVO)
     */
    @Override
    public List<LeadInfoVO> selectLeadInfoByCondition(LeadInfoSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        //if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return leadInfoDAO.selectLeadInfoByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#insertLead(chn.bhmc.dms.crm.slm.vo.LeadInfoVO)
     */
    @Override
    public String insertLead(LeadInfoVO leadInfoVO) throws Exception {


        String leadNo = selectNextLeadNo();
        leadInfoVO.setLeadNo(leadNo);

        // Required Value check
        boolean reqValueChk = false;
        reqValueChk = leadInfoReqValueChk(leadInfoVO);

        leadInfoVO.setRegUsrId(LoginUtil.getUserId());
        leadInfoVO.setDlrCd(LoginUtil.getDlrCd());
        //leadInfoVO.setPltCd(LoginUtil.getPltCd());

        leadInfoDAO.insertLead(leadInfoVO);

        return leadNo;
    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#updateLead(chn.bhmc.dms.crm.slm.vo.LeadInfoVO)
     */
    @Override
    public boolean leadInfoReqValueChk(LeadInfoVO leadInfoVO) throws Exception {
        String[] lblList = new String[1];



        if (leadInfoVO.getLeadNo() == "" || leadInfoVO.getLeadNo() == null){
            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.lead", null, LocaleContextHolder.getLocale())});
        }

        if (StringUtils.isEmpty(leadInfoVO.getCustNo())) {
            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.customer", null, LocaleContextHolder.getLocale())});
        }

        if (StringUtils.isEmpty(leadInfoVO.getLeadSrcCd())) {
            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.leadSrc", null, LocaleContextHolder.getLocale())});
        }

        return true;
    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#updateLead(chn.bhmc.dms.crm.slm.vo.LeadInfoVO)
     */
    @Override
    public int updateLead(LeadInfoVO leadInfoVO) throws Exception {

        try {
            String updateTp = leadInfoVO.getUpdateTp();
            int rtnCnt = 0;

            // Required Value check
            boolean reqValueChk = false;
            reqValueChk = leadInfoReqValueChk(leadInfoVO);

            leadInfoVO.setUpdtUsrId(LoginUtil.getUserId());
            leadInfoVO.setDlrCd(LoginUtil.getDlrCd());
            //leadInfoVO.setPltCd(LoginUtil.getPltCd());

            if ("Normal".equals(updateTp)){
                rtnCnt = leadInfoDAO.updateLead(leadInfoVO);
            }

            return rtnCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#updateLeadStat(chn.bhmc.dms.crm.slm.vo.LeadInfoVO)
     */
    @Override
    public int updateLeadStat(LeadInfoVO leadInfoVO) throws Exception {

        try {
            int rtnCnt = 0;

            // Required Value check kjlee

            if (StringUtils.isBlank(leadInfoVO.getLeadNo())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.lead", null, LocaleContextHolder.getLocale())});
            }

            if (StringUtils.isBlank(leadInfoVO.getStatCd())) {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.statNm", null, LocaleContextHolder.getLocale())});
            }

            leadInfoVO.setUpdtUsrId(LoginUtil.getUserId());
            leadInfoVO.setDlrCd(LoginUtil.getDlrCd());

            rtnCnt = leadInfoDAO.updateLead(leadInfoVO);

            return rtnCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#selectLeadDupByKey(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public String selectLeadDupByKey(String custNo, String leadTp) throws Exception {

        try {
            String dlrCd = LoginUtil.getDlrCd();
            int dupCnt = 0;

            String returnRtl = "01";

            // 리드 체크
            dupCnt = selectLeadDupOutSideByKey(dlrCd, custNo, leadTp);
            if (dupCnt > 0 ) {
                returnRtl = "06";  //리드중복종료
            } else {
                // 판매기회 체크
                dupCnt = salesOpptMgmtService.selectSalesOpptDupCnt(dlrCd, custNo);

                if (dupCnt > 0 ) {
                    returnRtl = "06";  //기회중북종료
                }
            }
            return returnRtl;

        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#selectLeadDupOutSideByKey(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public int selectLeadDupOutSideByKey(String dlrCd, String custNo, String leadTp) throws Exception {
        try {
            if (StringUtils.isEmpty(dlrCd)) { dlrCd = LoginUtil.getDlrCd(); }
            int dupCnt = 0;
            String leadDupConfigDay = systemConfigInfoService.selectStrValueByKey("termOfLeadDupCheck");

            dupCnt = leadInfoDAO.selectLeadDupByKey(dlrCd, custNo, leadTp, leadDupConfigDay);

            return dupCnt;

        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#selectLeadDupByKey(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public LeadInfoVO selectLeadByKey(String dlrCd, String pltCd, String hpNo, String telNo) throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#selectNextLeadNo()
     */
    @Override
    public String selectNextLeadNo() throws Exception {
        try{
            return leadInfoDAO.selectNextLeadNo();
        } catch (Exception e){
            throw processException("global.err.updateFailedParam", new String[]{messageSource.getMessage("global.lbl.lead", null, LocaleContextHolder.getLocale())});
        }
    }

    public String insertNewCustomer(LeadInfoSaveVO saveVO) throws Exception {
        try {
            String custNo = "";
            CustomerInfoVO customerInfoVO = new CustomerInfoVO();

            customerInfoVO.setDlrCd(LoginUtil.getDlrCd());
            customerInfoVO.setCustTp(saveVO.getLeadInfoVO().getCustTp());
            customerInfoVO.setCustNm(saveVO.getLeadInfoVO().getCustNm());
            customerInfoVO.setHpNo(saveVO.getLeadInfoVO().getHpNo());
            customerInfoVO.setPrefCommMthCd("01");
            customerInfoVO.setPrefCommNo(saveVO.getLeadInfoVO().getHpNo());
            customerInfoVO.setOfficeTelNo(saveVO.getLeadInfoVO().getOfficeTelNo());

            // 기본 셋팅 사항
            customerInfoVO.setCustCd("01");  // 가망고객
            customerInfoVO.setMathDocTp(""); // 증거유형
            customerInfoVO.setSsnCrnNo("");  // 증거번호

            customerInfoVO = customerInfoService.insertCustomer(customerInfoVO);

            if (customerInfoVO != null) {
                if (StringUtils.isNotBlank(customerInfoVO.getCustNo())) {
                    custNo = customerInfoVO.getCustNo();
                }
            }
            return custNo;
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#multiLeads(chn.bhmc.dms.crm.slm.vo.LeadInfoSaveVO)
     */
    @Override
    public String multiLeads(LeadInfoSaveVO saveVO) throws Exception {

        try {

            String leadNo = saveVO.getLeadInfoVO().getLeadNo();

            // 고객번호가 없는 경우 신규고객을 등록한다.
            if (StringUtils.isEmpty(saveVO.getLeadInfoVO().getCustNo())) {

                String custNo = insertNewCustomer(saveVO);

                if (StringUtils.isNotBlank(custNo)) {
                    saveVO.getLeadInfoVO().setCustNo(custNo);
                } else {
                    throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
                }
            }

            // 리드정보 처리
            if (StringUtils.isNotEmpty(leadNo)) {
                updateLead(saveVO.getLeadInfoVO());
            } else {
                // Dup Check 고객번호 + 기간(30일)
                String returnRtl = selectLeadDupByKey(saveVO.getLeadInfoVO().getCustNo(),saveVO.getLeadInfoVO().getLeadTp());

                saveVO.getLeadInfoVO().setStatCd(returnRtl); //신규 셋팅

                leadNo = insertLead(saveVO.getLeadInfoVO());
            }

            // 관심차종 저장
            int carLineInsertCnt = saveVO.getCarLineInfoVO().getInsertList().size();

            if (carLineInsertCnt > 0) {
                for (int i=0; carLineInsertCnt > i; i++) {
                    saveVO.getCarLineInfoVO().getInsertList().get(i).setRefKeyNm(leadNo);
                }
            }
            carLineInfoService.multiCarLine(saveVO.getCarLineInfoVO());

            return leadNo;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }



    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#multiIDCCLeads(chn.bhmc.dms.crm.slm.vo.LeadInfoSaveVO)
     */
    @Override
    public String multiIDCCLeads(LeadInfoSaveVO saveVO) throws Exception {

        try {
            String leadNo = saveVO.getLeadInfoVO().getLeadNo();

            // 고객번호가 없는 경우 신규고객을 등록한다.
            if (StringUtils.isEmpty(saveVO.getLeadInfoVO().getCustNo())) {
                String custNo = insertNewCustomer(saveVO);

                if (StringUtils.isNotBlank(custNo)) {
                    saveVO.getLeadInfoVO().setCustNo(custNo);
                } else {
                    throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
                }
            }

            // 리드정보 처리
            if (StringUtils.isNotEmpty(leadNo)) {
                updateLead(saveVO.getLeadInfoVO());
            } else {
                // Dup Check
                String returnRtl = selectLeadDupByKey(saveVO.getLeadInfoVO().getCustNo(),saveVO.getLeadInfoVO().getLeadTp());

                saveVO.getLeadInfoVO().setStatCd(returnRtl); //신규 셋팅

                leadNo = insertLead(saveVO.getLeadInfoVO());
            }

            // CALL 정보 처리
            /*
            if (saveVO.getCallInfoVO().getStatCd() != null && !"".equals(saveVO.getCallInfoVO().getStatCd())){
                callInfoService.insertCallInfo(saveVO.getCallInfoVO());
            }
            */

            // 관심차종 저장
            int carLineInsertCnt = saveVO.getCarLineInfoVO().getInsertList().size();

            if (carLineInsertCnt > 0) {
                for (int i=0; carLineInsertCnt > i; i++) {
                    saveVO.getCarLineInfoVO().getInsertList().get(i).setRefKeyNm(leadNo);
                }
            }
            carLineInfoService.multiCarLine(saveVO.getCarLineInfoVO());

            return leadNo;
        } catch(Exception e) {
            throw new BizException (e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#insertLeadToSalesOppt(chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSaveVO)
     */
    @Override
    public String insertLeadToSalesOppt(SalesOpptMgmtSaveVO saveVO) throws Exception {

        saveVO.getSalesOpptMgmtVO().setRegUsrId(LoginUtil.getUserId());
        saveVO.getSalesOpptMgmtVO().setUpdtUsrId(LoginUtil.getUserId());
        saveVO.getSalesOpptMgmtVO().setDlrCd(LoginUtil.getDlrCd());
        saveVO.getSalesOpptMgmtVO().setBhmcYn("N");

        for(CarLineInfoVO carLineInfoVO : saveVO.getInsertList()){
            carLineInfoVO.setRefTableNm("CR_0201T");
        }

        String saleOpptNo;
        saleOpptNo = salesOpptMgmtService.multiSalesOpptMgmts(saveVO);

        if (saleOpptNo == null) {
            throw processException("global.err.updateFailedParam", new String[]{messageSource.getMessage("global.lbl.saleOpty", null, LocaleContextHolder.getLocale())});
        }

        return saleOpptNo;
    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#selectLeadDupCheck(java.util.List)
     * Excel Upload Check
     */
    @SuppressWarnings("unused")
    @Override
    public List<LeadInfoVO> selectLeadDupCheck(List<LeadInfoVO> list) throws Exception {
        try {
            LeadInfoVO leadInfoVO = new LeadInfoVO();
            List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
            List<LeadInfoVO> resultList = new ArrayList<LeadInfoVO>();
            int totErrCnt = 0;
            String msg;
            String custDupChk;
            //String dlrCd = LoginUtil.getDlrCd();

            // Duplication Customer Check
            for(int i = 0, listLen = list.size(); i < listLen ; i++){
                leadInfoVO = new LeadInfoVO();
                errors         = new ArrayList<ExcelUploadError>();

                if (list.get(i).getErrorCount() > 0 ) {
                    totErrCnt = totErrCnt + 1;
                    resultList.add(list.get(i));
                } else {
                    list.get(i).setDlrCd(LoginUtil.getDlrCd());
                    CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();

                    searchVO.setsDlrCd(LoginUtil.getDlrCd());
                    searchVO.setsCustNm(list.get(i).getCustNm());
                    searchVO.setsHpNo(list.get(i).getHpNo());
                    searchVO.setsOfficeTelNo(list.get(i).getOfficeTelNo());
                    searchVO.setsCustTp(list.get(i).getCustTp());
                    searchVO.setsMathDocTp("");
                    searchVO.setsSsnCrnNo("");

                    CustomerInfoVO obj = customerInfoService.selectCustDupByKey(searchVO);

                    if (obj != null) {
                        msg = messageSource.getMessage(
                                "global.lbl.customer"
                                , new String[]{
                                        messageSource.getMessage("global.info.alreadyCont", null, LocaleContextHolder.getLocale())
                                }
                                , LocaleContextHolder.getLocale()
                            );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getCustNo(), msg));

                        list.get(i).setErrors(errors);
                        list.get(i).setErrorCount(1);

                        totErrCnt = totErrCnt + 1;
                        resultList.add(list.get(i));

                        continue;
                    } else {
                        resultList.add(list.get(i));
                    }

                }
            }

            return resultList;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#multiLeadUploadFileSave(chn.bhmc.dms.core.datatype.BaseSaveVO)
     * Excel Upload
     */
    @Override
    public void multiLeadUploadFileSave(BaseSaveVO<LeadInfoVO> obj) throws Exception {
        try {

            String userId = LoginUtil.getUserId();
            //String custNo;
            String leadTp;
            String custNm;
            String custTp;
            String hpNo;
            String officeTelNo;

            for(LeadInfoVO leadInfoVO : obj.getInsertList()){
                leadInfoVO.setRegUsrId(userId);

                //custNo = leadInfoVO.getCustNo();
                leadTp = leadInfoVO.getLeadTp();
                custNm = leadInfoVO.getCustNm();
                custTp = leadInfoVO.getCustTp();
                hpNo   = leadInfoVO.getHpNo();
                officeTelNo = leadInfoVO.getOfficeTelNo();

                // 고객번호가 없는 경우 신규고객을 등록한다.
                //if (StringUtils.isEmpty(saveVO.getLeadInfoVO().getCustNo())) {
                LeadInfoSaveVO saveVO = new LeadInfoSaveVO();
                saveVO.setLeadInfoVO(leadInfoVO);

                String custNo = insertNewCustomer(saveVO);

                if (StringUtils.isNotBlank(custNo)) {
                    saveVO.getLeadInfoVO().setCustNo(custNo);
                } else {
                    throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
                }
                //}

                String returnRtl = selectLeadDupByKey(custNo, leadTp);

                leadInfoVO.setStatCd(returnRtl);   // 중복으로 종료로 셋팅하여 저장

                /*
                 * dlrCd, pltCd 체크해서 기본 셋팅 시작
                 */
                if (StringUtils.isEmpty(leadInfoVO.getDlrCd())) { leadInfoVO.setDlrCd(LoginUtil.getDlrCd()); }

                insertLead(leadInfoVO);

            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

}
