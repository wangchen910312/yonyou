package chn.bhmc.dms.bat.crm.cif.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsService;
import chn.bhmc.dms.bat.crm.cif.service.dao.BatAddressInfoDAO;
import chn.bhmc.dms.bat.crm.cif.service.dao.BatCustomerInfoDAO;
import chn.bhmc.dms.bat.crm.cif.service.dao.BatCustomerRelInfoDAO;
import chn.bhmc.dms.bat.crm.cif.vo.BatAddressInfoSearchVO;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoSearchVO;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoVO;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerRelInfoVO;
import chn.bhmc.dms.bat.crm.cmm.vo.BatAddressInfoVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * BatIfCustomerInfoDmsServiceImpl.java
 *
 * @author Kyo Jin LEE
 * @since 2016. 5. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kyo Jin LEE      최초 생성
 * </pre>
 */
@Service("batIfCustomerInfoDmsService")
public class BatIfCustomerInfoDmsServiceImpl extends HService implements BatIfCustomerInfoDmsService {


    /**
     * 고객 정보 관리 DAO
     */
    @Resource(name="batCustomerInfoDAO")
    BatCustomerInfoDAO batCustomerInfoDAO;

    /**
     * 주소 DAO
     */
    @Resource(name="batAddressInfoDAO")
    BatAddressInfoDAO batAddressInfoDAO;

    /**
     * 연계인 DAO
     */
    @Resource(name="batCustomerRelInfoDAO")
    BatCustomerRelInfoDAO batCustomerRelInfoDAO;

    /**
     * Group Management Service
     */
    //@Resource(name="batCustomerGroupService")
    //BatCustomerGroupService batCustomerGroupService;

    /**
     * Customer Member Management
     */
    @Resource(name="custNoIdgenService")
    EgovIdGnrService custNoIdgenService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsDcsService#insertCustomerInfoDmsDcs()
     */
    @Override
    public int selectCustomerInfoDmsDcs() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batCustomerInfoDAO.selectCustomerInfoDmsDcs(map);

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("CRM101");
        camelClient.sendRequest();

        return 0;
    }

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsDcsService#insertCustomerInfoAddrDmsDcs()
     */
    @Override
    public int selectCustomerInfoAddrDmsDcs() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batCustomerInfoDAO.selectCustomerInfoAddrDmsDcs(map);

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("CRM102");
        camelClient.sendRequest();

        return 0;
    }

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsDcsService#insertCustomerInfoRelCustDmsDcs()
     */
    @Override
    public int selectCustomerInfoRelCustDmsDcs() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("regUsrId", "SYSTEM");
        map.put("updtUsrId", "SYSTEM");

        batCustomerInfoDAO.selectCustomerInfoRelCustDmsDcs(map);

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("CRM103");
        camelClient.sendRequest();

        return 0;
    }

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsService#selectCustomerInfoDmsOriginal()
     */
    @Override
    public int selectCustomerInfoDmsOriginal() throws Exception {

        int updateCnt = 0;
        Date UpdtDt;
        int isHaveCnt;

        List<BatCustomerInfoVO> customerInfoVO = new ArrayList<BatCustomerInfoVO>();
        customerInfoVO = batCustomerInfoDAO.selectCustomerInfoDmsOriginalByCondition();

        int listLen = customerInfoVO.size();

        if ( listLen > 0 ) {
            for (int i = 0 ; i < listLen ; i++) {
                BatCustomerInfoVO custInfoVO = new BatCustomerInfoVO();
                custInfoVO = customerInfoVO.get(i);

                UpdtDt = custInfoVO.getUpdtDt();

                // rowId로  고객 정보가 있는지 확인한다.
                //custInfoVO.getSiebelRowId();
                isHaveCnt = selectCustomerRowId(custInfoVO);

                // 신규 or 업데이트
                if (isHaveCnt > 0 ) {
                    // 데이터가 존재하면 Update
                    custInfoVO = updateCustomer(custInfoVO);
                } else {
                    // 데이터가 없으면 Insert
                    custInfoVO = insertCustomer(custInfoVO);
                }

                // 인터페이스 테이블(CR_0101IR) 업데이트 진행
                custInfoVO.setUpdtDt(UpdtDt);
                updateCnt = updateCustomerRowId(custInfoVO);
            }
        }
        return updateCnt;
    }

    public int updateCustomerRowId(BatCustomerInfoVO customerInfoVO)throws Exception {
        try {
            int updateCnt = 0;

            updateCnt = batCustomerInfoDAO.updateCustomerRowId(customerInfoVO);

            return updateCnt;

        } catch(Exception e) {
            int updateCnt = 0;
            return updateCnt;
        }
    }

    public int selectCustomerRowId(BatCustomerInfoVO customerInfoVO) throws Exception {

        return batCustomerInfoDAO.selectCustomerRowId(customerInfoVO);
    }

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.CustomerInfoService#insertCustomer(chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoVO)
     */
    public BatCustomerInfoVO insertCustomer(BatCustomerInfoVO customerInfoVO) throws Exception {

        try {
            int resultCnt = 0;
            String batMesgCont = "";
            Calendar toDayCal = Calendar.getInstance();

            // Required Value check
            boolean reqValueChk = false;
            reqValueChk = customerInfoReqValueChk(customerInfoVO);

            if (reqValueChk == false) {
                batMesgCont = messageSource.getMessage("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.info.requiredField", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                customerInfoVO.setBatMesgCont(batMesgCont);
                customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                customerInfoVO.setBatRsltDt(toDayCal.getTime());

                return customerInfoVO;
            }

            BatCustomerInfoSearchVO searchVO = new BatCustomerInfoSearchVO();

            if (StringUtils.isNotBlank(customerInfoVO.getDlrCd())) { searchVO.setsDlrCd(customerInfoVO.getDlrCd()); }
            if (StringUtils.isNotBlank(customerInfoVO.getCustTp())) { searchVO.setsCustTp(customerInfoVO.getCustTp()); }
            if (StringUtils.isNotBlank(customerInfoVO.getCustNm())) { searchVO.setsCustNm(customerInfoVO.getCustNm()); }
            if (StringUtils.isNotBlank(customerInfoVO.getHpNo())) { searchVO.setsHpNo(customerInfoVO.getHpNo()); }
            if (StringUtils.isNotBlank(customerInfoVO.getOfficeTelNo())) { searchVO.setsOfficeTelNo(customerInfoVO.getOfficeTelNo()); }
            if (StringUtils.isNotBlank(customerInfoVO.getMathDocTp())) { searchVO.setsMathDocTp(customerInfoVO.getMathDocTp()); }
            if (StringUtils.isNotBlank(customerInfoVO.getSsnCrnNo())) { searchVO.setsSsnCrnNo(customerInfoVO.getSsnCrnNo()); }

            // 핸드폰 또는 회사번호
            BatCustomerInfoVO obj = selectCustDupByKey(searchVO);

            if(obj != null) {

                batMesgCont = messageSource.getMessage("global.info.failedMsg", new String[]{messageSource.getMessage("crm.info.custDup", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                customerInfoVO.setBatMesgCont(batMesgCont);
                customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                customerInfoVO.setBatRsltDt(toDayCal.getTime());

                return customerInfoVO;

            }

            // 증거유형 + 증거번호
            if ((StringUtils.isNotBlank(searchVO.getsMathDocTp()) && StringUtils.isEmpty(searchVO.getsSsnCrnNo()))
                || (StringUtils.isEmpty(searchVO.getsMathDocTp()) && StringUtils.isNotBlank(searchVO.getsSsnCrnNo())) ) {

                batMesgCont = messageSource.getMessage("global.err.regFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                customerInfoVO.setBatMesgCont(batMesgCont);
                customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                customerInfoVO.setBatRsltDt(toDayCal.getTime());

                return customerInfoVO;
            }

            if (StringUtils.isNotBlank(searchVO.getsMathDocTp()) && StringUtils.isNotBlank(searchVO.getsSsnCrnNo()) ) {
                obj = selectCustMathDocDupByKey(searchVO);
                if(obj != null) {
                    batMesgCont = messageSource.getMessage("global.info.alreadyCont", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                    customerInfoVO.setBatMesgCont(batMesgCont);
                    customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                    customerInfoVO.setBatRsltDt(toDayCal.getTime());

                    return customerInfoVO;
                }
            }

            // 고객번호 채번한다.
            String custNo = selectNextCustNo();
            if (custNo.equals("F")) {
                batMesgCont = messageSource.getMessage("global.err.updateFailedParam", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                customerInfoVO.setBatMesgCont(batMesgCont);
                customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                customerInfoVO.setBatRsltDt(toDayCal.getTime());

                return customerInfoVO;
            } else {
                customerInfoVO.setCustNo(custNo);
            }

            // Default Value Setting
            customerInfoVO.setDelYn("N");
            customerInfoVO.setDisuseYn("N");
            customerInfoVO.setDmReturnYn("N");
            customerInfoVO.setEmailReceiveYn("N");
            customerInfoVO.setHpNoInvldYn("N");
            customerInfoVO.setHpNoAddImposYn("N");
            customerInfoVO.setMergeYn("N");
            customerInfoVO.setVipYn("N");
            customerInfoVO.setEmailReturnYn("N");
            customerInfoVO.setBhmcYn("N");

            if (StringUtils.isBlank(customerInfoVO.getSmsReceiveYn())) { customerInfoVO.setSmsReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getTelReceiveYn())) { customerInfoVO.setTelReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getDmReceiveYn())) { customerInfoVO.setDmReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getFaxReceiveYn())) { customerInfoVO.setFaxReceiveYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getPerInfoAgreeYn())) { customerInfoVO.setPerInfoAgreeYn("N"); }
            if (StringUtils.isBlank(customerInfoVO.getPerInfoUseYn())) { customerInfoVO.setPerInfoUseYn("N"); }

            // 신규 고객을 생성한다.
            resultCnt = batCustomerInfoDAO.insertCustomer(customerInfoVO);
            if(resultCnt < 1){
                // 신규 등록 실패
                batMesgCont = messageSource.getMessage("global.err.updateFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                customerInfoVO.setBatMesgCont(batMesgCont);
                customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                customerInfoVO.setBatRsltDt(toDayCal.getTime());

                return customerInfoVO;
            }

            customerInfoVO.setBatStatCd("S");
            customerInfoVO.setBatRsltDt(toDayCal.getTime());

            return customerInfoVO;

        }catch(Exception e){
            //BatCustomerInfoVO customerInfoVO = new BatCustomerInfoVO();
            String batMesgCont = messageSource.getMessage("global.err.updateFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
            customerInfoVO.setBatMesgCont(batMesgCont);
            customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
            Calendar toDayCal = Calendar.getInstance();
            customerInfoVO.setBatRsltDt(toDayCal.getTime());
            return customerInfoVO;
        }

    }

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param BatCustomerInfoVO customerInfoVO (증거유형 + 증거번호)
     * @return 조회한 고객 정보
     */
    public BatCustomerInfoVO selectCustMathDocDupByKey(BatCustomerInfoSearchVO searchVO) throws Exception {
        try {

            BatCustomerInfoVO customerInfoVO = new BatCustomerInfoVO();

            // 증거유형 + 증거번호
            customerInfoVO = batCustomerInfoDAO.selectCustMathDocDupByKey(searchVO);

            return customerInfoVO;
        } catch (Exception e) {
            BatCustomerInfoVO customerInfoVO = new BatCustomerInfoVO();
            String batMesgCont = messageSource.getMessage("global.info.failedMsg", new String[]{messageSource.getMessage("crm.info.custDup", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
            customerInfoVO.setBatMesgCont(batMesgCont);
            customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
            Calendar toDayCal = Calendar.getInstance();
            customerInfoVO.setBatRsltDt(toDayCal.getTime());
            return customerInfoVO;

        }

    }

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param BatCustomerInfoVO customerInfoVO (고객명 + 핸드폰)
     * @return 조회한 고객 정보
     */
    public BatCustomerInfoVO selectCustDupByKey(BatCustomerInfoSearchVO searchVO) throws Exception {
        try {
            BatCustomerInfoVO customerInfoVO = new BatCustomerInfoVO();
            // 고객명 + 핸드폰
            customerInfoVO = batCustomerInfoDAO.selectCustDupByKey(searchVO);

            return customerInfoVO;

        } catch (Exception e) {
            BatCustomerInfoVO customerInfoVO = new BatCustomerInfoVO();
            String batMesgCont = messageSource.getMessage("global.info.failedMsg", new String[]{messageSource.getMessage("crm.info.custDup", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
            customerInfoVO.setBatMesgCont(batMesgCont);
            customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
            Calendar toDayCal = Calendar.getInstance();
            customerInfoVO.setBatRsltDt(toDayCal.getTime());
            return customerInfoVO;
            //throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("crm.info.custDup", null, LocaleContextHolder.getLocale())});
        }
    }

    /**
     * 고객필수 값 체크
     * @param BatCustomerInfoVO
     * @return boolean
     */
    public boolean customerInfoReqValueChk(BatCustomerInfoVO customerInfoVO) throws Exception {

        if (StringUtils.isEmpty(customerInfoVO.getCustTp())) {
            return false;
            //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())});
        }

        if (StringUtils.isEmpty(customerInfoVO.getCustNm())) {
            return false;
            //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.custNm", null, LocaleContextHolder.getLocale())});
        }

        if (customerInfoVO.getCustTp().equals("01")) {
            if (StringUtils.isEmpty(customerInfoVO.getHpNo())) {
                return false;
                //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(customerInfoVO.getPrefCommMthCd())) {
                return false;
                //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.prefCommMthCd", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(customerInfoVO.getPrefCommNo())) {
                return false;
                //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.prefCommNo", null, LocaleContextHolder.getLocale())});
            }
        } else if (customerInfoVO.getCustTp().equals("02")) {
            if (StringUtils.isEmpty(customerInfoVO.getOfficeTelNo())) {
                return false;
                //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.officeTelNo", null, LocaleContextHolder.getLocale())});
            }
        }

        if (customerInfoVO.getCustCd().equals("02")) {
            if (StringUtils.isEmpty(customerInfoVO.getMathDocTp())) {
                return false;
                //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.mathDocTp", null, LocaleContextHolder.getLocale())});
            }
            if (StringUtils.isEmpty(customerInfoVO.getSsnCrnNo()) ) {
                return false;
                //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())});
            }
        }

        return true;

    }

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.CustomerInfoService#selectNextCustNo()
     */
    public String selectNextCustNo() throws Exception {
        try {
            //String custNo = customerInfoDAO.selectNextCustNo();
            String custNo = custNoIdgenService.getNextStringId();

            if (StringUtils.isEmpty(custNo)) {
                custNo = "F";
            }

            return custNo;

        } catch (Exception e) {
            return "F";
        }
    }

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatCustomerInfoService#updateCustomer(chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoVO)
     */
    public BatCustomerInfoVO updateCustomer(BatCustomerInfoVO customerInfoVO) throws Exception {
        try {
            int resultCnt       = 0;
            String commandTp    = customerInfoVO.getCommandTp();
            String custNo       = customerInfoVO.getCustNo();

            String batMesgCont = "";
            Calendar toDayCal = Calendar.getInstance();

            // 고객번호 확인
            if (StringUtils.isEmpty(custNo)){

                batMesgCont = messageSource.getMessage("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                customerInfoVO.setBatMesgCont(batMesgCont);
                customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                customerInfoVO.setBatRsltDt(toDayCal.getTime());
                return customerInfoVO;

                //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
            }

            /**
             * CommandTp에 따라 검증 진행
             * null : 고객등록
             * ASSIGN : 고객 배정
             * CONTRACT : 계약
             * BLUEMEMBER : 블루멤버십 업데이트
             */
            if (StringUtils.isEmpty(commandTp)) {
                // Required Value check
                boolean reqValueChk = false;
                reqValueChk = customerInfoReqValueChk(customerInfoVO);

                if (reqValueChk == false) {
                    batMesgCont = messageSource.getMessage("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.info.requiredField", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                    customerInfoVO.setBatMesgCont(batMesgCont);
                    customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                    customerInfoVO.setBatRsltDt(toDayCal.getTime());

                    return customerInfoVO;
                }

                BatCustomerInfoVO obj = null;

                BatCustomerInfoSearchVO searchVO = new BatCustomerInfoSearchVO();

                if (StringUtils.isNotBlank(customerInfoVO.getDlrCd())) { searchVO.setsDlrCd(customerInfoVO.getDlrCd()); }
                if (StringUtils.isNotBlank(customerInfoVO.getCustTp())) { searchVO.setsCustTp(customerInfoVO.getCustTp()); }
                if (StringUtils.isNotBlank(customerInfoVO.getCustNm())) { searchVO.setsCustNm(customerInfoVO.getCustNm()); }
                if (StringUtils.isNotBlank(customerInfoVO.getHpNo())) { searchVO.setsHpNo(customerInfoVO.getHpNo()); }
                if (StringUtils.isNotBlank(customerInfoVO.getOfficeTelNo())) { searchVO.setsOfficeTelNo(customerInfoVO.getOfficeTelNo()); }
                if (StringUtils.isNotBlank(customerInfoVO.getMathDocTp())) { searchVO.setsMathDocTp(customerInfoVO.getMathDocTp()); }
                if (StringUtils.isNotBlank(customerInfoVO.getSsnCrnNo())) { searchVO.setsSsnCrnNo(customerInfoVO.getSsnCrnNo()); }
                if (StringUtils.isNotBlank(customerInfoVO.getCustNo())) { searchVO.setsCustNo(customerInfoVO.getCustNo()); }

                //searchVO.setsOldCustNm(oldCustNm);
                //searchVO.setsOldHpNo(oldHpNo);
                //searchVO.setsOldMathDocTp(oldMathDocTp);
                //searchVO.setsOldSsnCrnNo(oldSsnCrnNo);

//                if ( custTp.equals("01")) {
//                    obj = selectCustDupByKey(searchVO);
//                } else {
//                }
                obj = selectCustDupByKey(searchVO);

                if (obj != null) {

                    batMesgCont = messageSource.getMessage("global.info.failedMsg", new String[]{messageSource.getMessage("crm.info.custDup", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                    customerInfoVO.setBatMesgCont(batMesgCont);
                    customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                    customerInfoVO.setBatRsltDt(toDayCal.getTime());

                    return customerInfoVO;

                }

                // 증거유형 + 증거번호
                obj = selectCustMathDocDupByKey(searchVO);

                if (obj != null) {
                    //throw processException("global.info.already");
                    batMesgCont = messageSource.getMessage("global.info.failedMsg", new String[]{messageSource.getMessage("crm.info.custDup", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                    customerInfoVO.setBatMesgCont(batMesgCont);
                    customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                    customerInfoVO.setBatRsltDt(toDayCal.getTime());

                    return customerInfoVO;
                }
            }

            resultCnt = batCustomerInfoDAO.updateCustomer(customerInfoVO);

            if (resultCnt < 1){
                //throw processException("global.err.updateFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())});
                batMesgCont = messageSource.getMessage("global.err.updateFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                customerInfoVO.setBatMesgCont(batMesgCont);
                customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                customerInfoVO.setBatRsltDt(toDayCal.getTime());

                return customerInfoVO;
            }

            customerInfoVO.setBatStatCd("S");
            customerInfoVO.setBatRsltDt(toDayCal.getTime());

            return customerInfoVO;

        }catch(Exception e){
            //throw new BizException(e.getMessage());

          //BatCustomerInfoVO customerInfoVO = new BatCustomerInfoVO();
            String batMesgCont = messageSource.getMessage("global.err.updateFailedParam", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
            customerInfoVO.setBatMesgCont(batMesgCont);
            customerInfoVO.setBatStatCd("F"); // S : Success , F : Fail
            Calendar toDayCal = Calendar.getInstance();
            customerInfoVO.setBatRsltDt(toDayCal.getTime());
            return customerInfoVO;
        }
    }

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsService#selectCustomerInfoAddrDmsOriginal()
     */
    @Override
    public int selectCustomerInfoAddrDmsOriginal() throws Exception {

        try {
            int isHaveCnt = 0;
            String batMesgCont = "";

            BatAddressInfoSearchVO searchVO = new BatAddressInfoSearchVO();
            BatAddressInfoVO batAddressInfoVO = new BatAddressInfoVO();
            List<BatAddressInfoVO> batAddressInfoVOList = new ArrayList<BatAddressInfoVO>();
            List<BatCustomerInfoVO> batCustomerInfoVO = new ArrayList<BatCustomerInfoVO>();

            isHaveCnt = batAddressInfoDAO.selectAddressInfoIfByConditionCnt(searchVO);

            if (isHaveCnt > 0) {

                batAddressInfoVOList = batAddressInfoDAO.selectAddressInfoIfByCondition(searchVO);

                BatCustomerInfoVO custInfoVO = new BatCustomerInfoVO();
                BatCustomerInfoSearchVO custInfoSearchVO = new BatCustomerInfoSearchVO();

                for (int i = 0 ; i < batAddressInfoVOList.size() ; i++) {

                    custInfoVO = new BatCustomerInfoVO();
                    custInfoVO.setSiebelRowId(batAddressInfoVOList.get(i).getSiebelRowId());
                    isHaveCnt = selectCustomerRowId(custInfoVO);

                    if (isHaveCnt > 0) {  // 고객이 있음.
                        batAddressInfoVO.setDlrCd(batAddressInfoVOList.get(i).getDlrCd());
                        batAddressInfoVO.setAddrTp(batAddressInfoVOList.get(i).getAddrTp());
                        batAddressInfoVO.setZipCd(batAddressInfoVOList.get(i).getZipCd());
                        batAddressInfoVO.setSungCd(batAddressInfoVOList.get(i).getSungCd());
                        batAddressInfoVO.setCityCd(batAddressInfoVOList.get(i).getCityCd());
                        batAddressInfoVO.setDistCd(batAddressInfoVOList.get(i).getDistCd());
                        batAddressInfoVO.setSungNm(batAddressInfoVOList.get(i).getSungNm());
                        batAddressInfoVO.setCityNm(batAddressInfoVOList.get(i).getCityNm());
                        batAddressInfoVO.setDistNm(batAddressInfoVOList.get(i).getDistNm());
                        batAddressInfoVO.setAddrNm(batAddressInfoVOList.get(i).getAddrNm());
                        batAddressInfoVO.setRegUsrId("system");
                        batAddressInfoVO.setUpdtUsrId("system");
                        batAddressInfoVO.setRefTableNm("CR_0101T");
                        custInfoSearchVO = new BatCustomerInfoSearchVO();
                        custInfoSearchVO.setsSiebelRowId(batAddressInfoVOList.get(i).getSiebelRowId());
                        batCustomerInfoVO = batCustomerInfoDAO.selectCustomerInfoByCondition(custInfoSearchVO);
                        batAddressInfoVO.setrefKeyNm(batCustomerInfoVO.get(0).getCustNo());

                        batAddressInfoDAO.insertAddressInfo(batAddressInfoVO);

                        batAddressInfoVO.setBatStatCd("S"); // S : Success , F : Fail
                    } else { // 고객이 없음.
                        batMesgCont = messageSource.getMessage("crm.info.noinfoData", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                        batAddressInfoVO.setBatMesgCont(batMesgCont);
                        batAddressInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                    }
                }
                batAddressInfoDAO.updateAddressInfoIf(batAddressInfoVO);
            }

            return 0;
        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsService#selectCustomerInfoRelDmsOriginal()
     */
    @Override
    public int selectCustomerInfoRelDmsOriginal() throws Exception {

        try {
            int isHaveCnt = 0;
            int isHaveRelCnt = 0;
            String batMesgCont = "";

            BatCustomerRelInfoVO searchVO = new BatCustomerRelInfoVO();
            BatCustomerRelInfoVO batCustomerRelInfoVO = new BatCustomerRelInfoVO();
            List<BatCustomerRelInfoVO> batCustomerRelInfoVOList = new ArrayList<BatCustomerRelInfoVO>();
            List<BatCustomerInfoVO> batCustomerInfoVO = new ArrayList<BatCustomerInfoVO>();

            isHaveCnt = batCustomerRelInfoDAO.selectCustomerRelIfByConditionCnt(searchVO);

            if (isHaveCnt > 0) {

                batCustomerRelInfoVOList = batCustomerRelInfoDAO.selectCustomerRelIfByCondition(searchVO);

                BatCustomerInfoVO custInfoVO = new BatCustomerInfoVO();
                BatCustomerInfoSearchVO custInfoSearchVO = new BatCustomerInfoSearchVO();

                for (int i = 0 ; i < batCustomerRelInfoVOList.size() ; i++) {

                    custInfoVO = new BatCustomerInfoVO();
                    //고객조회
                    custInfoVO.setSiebelRowId(batCustomerRelInfoVOList.get(i).getUpperSiebelRowId());
                    isHaveCnt = selectCustomerRowId(custInfoVO);  // 고객의 유무확인
                    custInfoVO.setSiebelRowId(batCustomerRelInfoVOList.get(i).getPconSiebelRowId());
                    isHaveRelCnt = selectCustomerRowId(custInfoVO); // 연계인의 존재 유무확인

                    if (isHaveCnt > 0 && isHaveRelCnt > 0 ) {  // 고객이 있음.
                        batCustomerRelInfoVO.setDlrCd(batCustomerRelInfoVOList.get(i).getDlrCd());
                        batCustomerRelInfoVO.setPconTp(batCustomerRelInfoVOList.get(i).getPconTp());
                        batCustomerRelInfoVO.setRegUsrId("system");
                        batCustomerRelInfoVO.setUpdtUsrId("system");

                        custInfoSearchVO = new BatCustomerInfoSearchVO();
                        // 고객 custNo search
                        custInfoSearchVO.setsSiebelRowId(batCustomerRelInfoVOList.get(i).getUpperSiebelRowId());
                        batCustomerInfoVO = batCustomerInfoDAO.selectCustomerInfoByCondition(custInfoSearchVO);
                        batCustomerRelInfoVO.setUpperCustNo(batCustomerInfoVO.get(0).getCustNo());

                        // 연계인 custNo search
                        custInfoSearchVO.setsSiebelRowId(batCustomerRelInfoVOList.get(i).getPconSiebelRowId());
                        batCustomerInfoVO = batCustomerInfoDAO.selectCustomerInfoByCondition(custInfoSearchVO);
                        batCustomerRelInfoVO.setPconCustNo(batCustomerInfoVO.get(0).getCustNo());

                        batCustomerRelInfoDAO.insertCustomerRel(batCustomerRelInfoVO);

                        batCustomerRelInfoVO.setBatStatCd("S"); // S : Success , F : Fail

                    } else { // 고객이 없음.
                        if (isHaveCnt <= 0) {
                            batMesgCont = messageSource.getMessage("crm.info.noinfoData", new String[]{messageSource.getMessage("global.info.customer", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                        }

                        if (isHaveRelCnt <= 0) {
                            batMesgCont = messageSource.getMessage("crm.info.noinfoData", new String[]{messageSource.getMessage("global.lbl.relCustInfo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale());
                        }
                        batCustomerRelInfoVO.setBatMesgCont(batMesgCont);
                        batCustomerRelInfoVO.setBatStatCd("F"); // S : Success , F : Fail
                    }
                }
                batCustomerRelInfoDAO.updateCustomerRelInfoIf(batCustomerRelInfoVO);
            }

            return 0;
        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsService#updateCustomerFromSalesOppt(chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoVO)
     */
    @Override
    public int updateCustomerFromSalesOppt(BatCustomerInfoVO batCustomerInfoVO) throws Exception {
        return batCustomerInfoDAO.updateCustomer(batCustomerInfoVO);
    }

    /*
     * @see chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsService#selectCallCamelClient(java.lang.String)
     */
    @Override
    public Data selectCallCamelClient(String camelId) throws Exception {

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId(camelId);

        return camelClient.sendRequest();
    }

}
