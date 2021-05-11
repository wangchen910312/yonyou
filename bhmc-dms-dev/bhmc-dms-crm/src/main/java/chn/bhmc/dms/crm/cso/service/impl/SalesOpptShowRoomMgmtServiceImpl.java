package chn.bhmc.dms.crm.cso.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoAppendUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.service.RegularExpressionService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtFinishService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptHoldTypeMgmtDAO;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptProcessMgmtDAO;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptShowRoomMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtVO;


/**
 * 전시장 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         in moon lee            최초 생성
 * </pre>
 */

@Service("salesOpptShowRoomMgmtService")
public class SalesOpptShowRoomMgmtServiceImpl extends HService implements SalesOpptShowRoomMgmtService, JxlsSupport {

    /**
     * Customer Management
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * Customer Management
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * Address Management
     */
    @Resource(name="addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * Address Management
     */
    @Resource(name="salesOpptProcessMgmtService")
    SalesOpptProcessMgmtService salesOpptProcessMgmtService;

    /**
     * SalesOpptProcessMgmtOutBoundService Management
     */
    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;

    /**
     * 전시장프로세스 관리 DAO
     */
    @Resource(name="salesOpptShowRoomMgmtDAO")
    SalesOpptShowRoomMgmtDAO salesOpptShowRoomMgmtDAO;

    /**
     * RegularExpressionService
     */
    @Resource(name="regularExpressionService")
    RegularExpressionService regularExpressionService;

    /**
     * 판매기회진행이력 관리
     */
    @Resource(name="salesOpptProcessMgmtFinishService")
    SalesOpptProcessMgmtFinishService salesOpptProcessMgmtFinishService;

    /**
     * 판매기회프로세스 관리 DAO
     */
    @Resource(name="salesOpptProcessMgmtDAO")
    SalesOpptProcessMgmtDAO salesOpptProcessMgmtDAO;
    
    /*
     * TodoInfoService  update by sunzhiqiang 2018-02-06
     */
    @Resource(name="todoInfoService")
    TodoInfoService	todoInfoService;

    @Resource(name="salesOpptHoldTypeMgmtDAO")
    SalesOpptHoldTypeMgmtDAO salesOpptHoldTypeMgmtDAO;
    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService#selectSalesOpptShowRoomMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSearchVO)
     */
    @Override
    public int selectSalesOpptShowRoomMgmtsByConditionCnt(SalesOpptShowRoomMgmtSearchVO searchVO) throws Exception {
        /*
         * dlrCd, 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptShowRoomMgmtDAO.selectSalesOpptShowRoomMgmtsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService#selectSalesOpptShowRoomMgmtsByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSearchVO)
     */
    @Override
    public List<SalesOpptShowRoomMgmtVO> selectSalesOpptShowRoomMgmtsByCondition(SalesOpptShowRoomMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptShowRoomMgmtDAO.selectSalesOpptShowRoomMgmtsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService#insertSalesOpptShowRoomMgmt(chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtVO)
     */
    @Override
    public int insertSalesOpptShowRoomMgmt(SalesOpptShowRoomMgmtVO salesOpptShowRoomMgmtVO) throws Exception {
        if (StringUtils.isEmpty(salesOpptShowRoomMgmtVO.getDlrCd())){salesOpptShowRoomMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOpptShowRoomMgmtVO.getRegUsrId())) {salesOpptShowRoomMgmtVO.setRegUsrId(LoginUtil.getUserId());}

        // 필수체크
        if (StringUtils.isEmpty(salesOpptShowRoomMgmtVO.getLeadStatCd())){salesOpptShowRoomMgmtVO.setLeadStatCd("01");}

        //정규식 체크 (hpNo)
        String regExpRlt = "";
        if (StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getHpNo()) ) {
            regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(salesOpptShowRoomMgmtVO.getHpNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpHpNo"); // 이동전화 번호가 규칙에 맞지 않습니다.
            }
        }

        /*
         * ==============================================
         *  정규식 체크 - 시작
         * ==============================================
         */

        // emailNm
        if (StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getEmailNm())) {
            regExpRlt = regularExpressionService.selectRegularExpressionByEmail(salesOpptShowRoomMgmtVO.getEmailNm());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpEmail"); // 이메일이 규칙에 맞지 않습니다.
            }
        }

        // telNo
        if (StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getTelNo())) {
            regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(salesOpptShowRoomMgmtVO.getTelNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
            }
        }

        // officeTelNo
        if (StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getOfficeTelNo())) {
            regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(salesOpptShowRoomMgmtVO.getOfficeTelNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
            }
        }
        // ssnCrnNo
        if (StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getSsnCrnNo())) {
            if("01".equals(salesOpptShowRoomMgmtVO.getMathDocTp())) {
                if (salesOpptShowRoomMgmtVO.getSsnCrnNo().length() == 15) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo15Digit(salesOpptShowRoomMgmtVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                        throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                    }

                } else if (salesOpptShowRoomMgmtVO.getSsnCrnNo().length() == 18) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo18Digit(salesOpptShowRoomMgmtVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                        throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                    }
                } else {
                    //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                    throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                }
            } else if("08".equals(salesOpptShowRoomMgmtVO.getMathDocTp())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByCorpNo(salesOpptShowRoomMgmtVO.getSsnCrnNo());
                if ("FALSE".equals(regExpRlt)){
                    //throw processException("crm.info.regExpCorpNo"); // 법인번호가 규칙에 맞지 않습니다.
                    throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                }
            }
        }

        /*
         * ==============================================
         *  정규식 체크 - 끝
         * ==============================================
         */

        // 기본값 셋팅
        if (StringUtils.isEmpty(salesOpptShowRoomMgmtVO.getBhmcYn())) {salesOpptShowRoomMgmtVO.setBhmcYn("Y");}
        if (StringUtils.isEmpty(salesOpptShowRoomMgmtVO.getDelYn())) {salesOpptShowRoomMgmtVO.setDelYn("N");}
        //if (StringUtils.isEmpty(salesOpptShowRoomMgmtVO.getRvsitYn())) {salesOpptShowRoomMgmtVO.setRvsitYn("N");}

        // 중복확인
        SalesOpptShowRoomMgmtSearchVO salesOpptShowRoomMgmtSearchVO = new SalesOpptShowRoomMgmtSearchVO();
        salesOpptShowRoomMgmtSearchVO.setsCustNo(salesOpptShowRoomMgmtVO.getCustNo());

        if (salesOpptShowRoomMgmtVO.getVsitPrsnCnt() != null) {
            if (salesOpptShowRoomMgmtVO.getVsitPrsnCnt() == 0){
                salesOpptShowRoomMgmtVO.setVsitPrsnCnt(1);
            }
        }

        //int salesOpptProcCount = selectSalesOpptShowRoomMgmtsByConditionCnt(salesOpptShowRoomMgmtSearchVO);

        //if (salesOpptProcCount >= 1) {
        //    throw processException("global.info.already");  // throw processException("global.lbl.no");
        //}

        return salesOpptShowRoomMgmtDAO.insertSalesOpptShowRoomMgmt(salesOpptShowRoomMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService#updateSalesOpptShowRoomMgmt(chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtVO)
     */
    @Override
    public int updateSalesOpptShowRoomMgmt(SalesOpptShowRoomMgmtVO salesOpptShowRoomMgmtVO) throws Exception {

        if (StringUtils.isEmpty(salesOpptShowRoomMgmtVO.getDlrCd())){salesOpptShowRoomMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOpptShowRoomMgmtVO.getUpdtUsrId())) {salesOpptShowRoomMgmtVO.setUpdtUsrId(LoginUtil.getUserId());}

        // 필수체크
        if (StringUtils.isEmpty(salesOpptShowRoomMgmtVO.getLeadStatCd())) {
            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("crm.lbl.step", null, LocaleContextHolder.getLocale())});
        }

        //정규식 체크 (hpNo)
        String regExpRlt = "";
        if (StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getHpNo()) ) {
            regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(salesOpptShowRoomMgmtVO.getHpNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpHpNo"); // 이동전화 번호가 규칙에 맞지 않습니다.
            }
        }

        /*
         * ==============================================
         *  정규식 체크 - 시작
         * ==============================================
         */

        // emailNm
        if (StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getEmailNm())) {
            regExpRlt = regularExpressionService.selectRegularExpressionByEmail(salesOpptShowRoomMgmtVO.getEmailNm());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpEmail"); // 이메일이 규칙에 맞지 않습니다.
            }
        }

        // telNo
        if (StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getTelNo())) {
            regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(salesOpptShowRoomMgmtVO.getTelNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
            }
        }

        // officeTelNo
        if (StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getOfficeTelNo())) {
            regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(salesOpptShowRoomMgmtVO.getOfficeTelNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
            }
        }
        // ssnCrnNo
        if (StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getSsnCrnNo())) {
            if("01".equals(salesOpptShowRoomMgmtVO.getMathDocTp())) {
                if (salesOpptShowRoomMgmtVO.getSsnCrnNo().length() == 15) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo15Digit(salesOpptShowRoomMgmtVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                        throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                    }

                } else if (salesOpptShowRoomMgmtVO.getSsnCrnNo().length() == 18) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo18Digit(salesOpptShowRoomMgmtVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                        throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                    }
                } else {
                    //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                    throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                }
            } else if("08".equals(salesOpptShowRoomMgmtVO.getMathDocTp())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByCorpNo(salesOpptShowRoomMgmtVO.getSsnCrnNo());
                if ("FALSE".equals(regExpRlt)){
                    //throw processException("crm.info.regExpCorpNo"); // 법인번호가 규칙에 맞지 않습니다.
                    throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                }
            }
        }

        /*
         * ==============================================
         *  정규식 체크 - 끝
         * ==============================================
         */

        if (salesOpptShowRoomMgmtVO.getVsitPrsnCnt() != null) {
            if (salesOpptShowRoomMgmtVO.getVsitPrsnCnt() == 0){
                salesOpptShowRoomMgmtVO.setVsitPrsnCnt(1);
            }
        }

        return salesOpptShowRoomMgmtDAO.updateSalesOpptShowRoomMgmt(salesOpptShowRoomMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService#multiSalesOpptShowRoomMgmts(chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtVO)
     */
    @Override
    public String multiSalesOpptShowRoomMgmts(SalesOpptShowRoomMgmtSaveVO saveVO) throws Exception {

        try {
            if (StringUtils.isEmpty(saveVO.getSalesOpptShowRoomMgmtVO().getDlrCd())){saveVO.getSalesOpptShowRoomMgmtVO().setDlrCd(LoginUtil.getDlrCd());}

            String custHoldTp = "";
            // 고객 신규 등록 확인
            String custNo = saveVO.getSalesOpptShowRoomMgmtVO().getCustNo();
            String salesOpptShowRoomNo = saveVO.getSalesOpptShowRoomMgmtVO().getSeq();
            String leadStatCd = saveVO.getSalesOpptShowRoomMgmtVO().getLeadStatCd();
            String saleOpptSeq = saveVO.getSalesOpptShowRoomMgmtVO().getSaleOpptSeq();
            String mngScId = saveVO.getSalesOpptShowRoomMgmtVO().getMngScId();

            //전시장 신규 / 업데이트 처리
            SalesOpptShowRoomMgmtVO salesOpptShowRoomMgmtVO = new SalesOpptShowRoomMgmtVO();
            salesOpptShowRoomMgmtVO = saveVO.getSalesOpptShowRoomMgmtVO();

            int i=0;

            if (StringUtils.isEmpty(salesOpptShowRoomNo)) {
                // 전시장 신규
                insertSalesOpptShowRoomMgmt(salesOpptShowRoomMgmtVO);
                salesOpptShowRoomNo = salesOpptShowRoomMgmtVO.getSeq();

                // 전시장 주소 등록
                for (i=0; saveVO.addressInfoVOList.getInsertList().size() > i ; i++){
                    saveVO.addressInfoVOList.getInsertList().get(i).setRefTableNm("CR_0214T");
                    saveVO.addressInfoVOList.getInsertList().get(i).setrefKeyNm(salesOpptShowRoomNo);
                }
                addressInfoService.multiAddressInfo(saveVO.addressInfoVOList);

            } else {
                // 전시장 업데이트
                updateSalesOpptShowRoomMgmt(salesOpptShowRoomMgmtVO);

                // 전시장 주소 수정
                addressInfoService.multiAddressInfo(saveVO.addressInfoVOList);
            }

            SalesOpptProcessMgmtVO salesOpptProcessMgmtVO = new SalesOpptProcessMgmtVO();
            if ("04".equals(leadStatCd) || StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getSaleOpptSeq()) ) {

                /*
                 * 전시장에서 '추적|추진'으로 넘기는 경우 고객 신규 생성한다.
                 * 고객의 기준 custNo 로 판단.
                 */

                if (StringUtils.isEmpty(custNo)) {
                    CustomerInfoVO customerInfoVO = new CustomerInfoVO();
                    customerInfoVO.setDlrCd(saveVO.getSalesOpptShowRoomMgmtVO().getDlrCd());
                    customerInfoVO.setCustNm(saveVO.getSalesOpptShowRoomMgmtVO().getCustNm());
                    customerInfoVO.setCustTp(saveVO.getSalesOpptShowRoomMgmtVO().getCustTp());
                    customerInfoVO.setCustCd("01"); // 신규 고객의 경우 '잠재고객'으로 한다.
                    customerInfoVO.setHpNo(saveVO.getSalesOpptShowRoomMgmtVO().getHpNo());
                    customerInfoVO.setOfficeTelNo(saveVO.getSalesOpptShowRoomMgmtVO().getOfficeTelNo());
                    customerInfoVO.setPrefCommMthCd("01");
                    customerInfoVO.setPrefCommNo(saveVO.getSalesOpptShowRoomMgmtVO().getHpNo());
                    customerInfoVO.setOfficeTelNo(saveVO.getSalesOpptShowRoomMgmtVO().getOfficeTelNo());
                    customerInfoVO.setTelNo(saveVO.getSalesOpptShowRoomMgmtVO().getTelNo());
                    customerInfoVO.setWechatId(saveVO.getSalesOpptShowRoomMgmtVO().getWechatId());
                    customerInfoVO.setEmailNm(saveVO.getSalesOpptShowRoomMgmtVO().getEmailNm());
                    customerInfoVO.setSexCd(saveVO.getSalesOpptShowRoomMgmtVO().getSexCd());
                    customerInfoVO.setMathDocTp(saveVO.getSalesOpptShowRoomMgmtVO().getMathDocTp());
                    customerInfoVO.setSsnCrnNo(saveVO.getSalesOpptShowRoomMgmtVO().getSsnCrnNo());
                    customerInfoVO.setBizcondCd(saveVO.getSalesOpptShowRoomMgmtVO().getBizcondCd());
                    customerInfoVO.setSexCd(saveVO.getSalesOpptShowRoomMgmtVO().getSexCd());
                    customerInfoVO.setBirthDt(saveVO.getSalesOpptShowRoomMgmtVO().getBirthDt());
                    customerInfoVO.setDeptNm(saveVO.getSalesOpptShowRoomMgmtVO().getDeptNm());
                    customerInfoVO.setOfficeNm(saveVO.getSalesOpptShowRoomMgmtVO().getOfficeNm());
                    customerInfoVO.setPurcMngNm(saveVO.getSalesOpptShowRoomMgmtVO().getPurcMngNm());
                    customerInfoVO.setPerInfoAgreeYn("Y");
                    customerInfoVO.setMngScId(saveVO.getSalesOpptShowRoomMgmtVO().getMngScId());

                    CommonCodeVO commonCodeVO = new CommonCodeVO();
                    commonCodeVO = commonCodeService.selectCommonCodeByKey("CRM008", saveVO.getSalesOpptShowRoomMgmtVO().getHoldTp());
                    custHoldTp = commonCodeVO.getRemark1();
                    customerInfoVO.setCustHoldTp(custHoldTp);
                    customerInfoVO.setCustCollSrcCd("01"); //  CRM042   01:판매 02:정비

                    customerInfoVO = customerInfoService.insertCustomer(customerInfoVO);
                    custNo = customerInfoVO.getCustNo();

                    // 전시장에 등록된 주소 조회 후  고객주소로 등록 ( 20170907 - 이인문 수정 )
                    AddressInfoSearchVO searchVO = new AddressInfoSearchVO();
                    if (addressInfoService.selectAddressInfoByConditionCnt(searchVO) > 0) {

                        List<AddressInfoVO> addressInfoVOList = new ArrayList<AddressInfoVO>();
                        searchVO.setsRefTableNm("CR_0214T");
                        searchVO.setsRefKeyNm(salesOpptShowRoomNo);
                        addressInfoVOList = addressInfoService.selectAddressInfoByCondition(searchVO);

                        // 전시장 주소 등록
                        for (i=0; addressInfoVOList.size() > i ; i++){
                            addressInfoVOList.get(i).setRefTableNm("CR_0101T");
                            addressInfoVOList.get(i).setrefKeyNm(custNo);
                        }

                        BaseSaveVO<AddressInfoVO> addressInfoVO = new BaseSaveVO<AddressInfoVO>();
                        addressInfoVO.setInsertList(addressInfoVOList);
                        addressInfoService.multiAddressInfo(addressInfoVO);

                    }

                }

                // 2. 중복 '판매기회'를 확인 (고객번호로 확인)
                SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
                salesOpptProcessMgmtSearchVO.setsCustNo(custNo);

                int salesOpptProcCount = salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByConditionCnt(salesOpptProcessMgmtSearchVO);

                if ( StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getSaleOpptSeq()) ) {
                    salesOpptProcessMgmtVO.setCustNo(custNo);
                    salesOpptProcessMgmtVO.setExhvFlakSeq(salesOpptShowRoomNo);
                    salesOpptProcessMgmtVO.setVsitEndDt(saveVO.getSalesOpptShowRoomMgmtVO().getVsitEndDt());
                } else {
                    salesOpptProcessMgmtVO.setValidGradeCd("02"); // 유효성판단 - 유효함
                    salesOpptProcessMgmtVO.setLeadStatCd("04"); // 추적단계로 업데이트
                    salesOpptProcessMgmtVO.setBefLeadStatCd("03"); //  이전 단계는 임의로 03 단계로 한다.
                    salesOpptProcessMgmtVO.setCustNo(custNo);
                    salesOpptProcessMgmtVO.setDlrCd(saveVO.getSalesOpptShowRoomMgmtVO().getDlrCd());
                    salesOpptProcessMgmtVO.setMngScId(saveVO.getSalesOpptShowRoomMgmtVO().getMngScId());
                    salesOpptProcessMgmtVO.setRvsitYn(saveVO.getSalesOpptShowRoomMgmtVO().getRvsitYn());
                    salesOpptProcessMgmtVO.setExhvFlakSeq(salesOpptShowRoomNo);
                    salesOpptProcessMgmtVO.setHpNo(saveVO.getSalesOpptShowRoomMgmtVO().getHpNo());
                    salesOpptProcessMgmtVO.setHoldTp(saveVO.getSalesOpptShowRoomMgmtVO().getHoldTp());
                    salesOpptProcessMgmtVO.setHoldDetlTpSeq(saveVO.getSalesOpptShowRoomMgmtVO().getHoldDetlTpSeq());
                    salesOpptProcessMgmtVO.setVsitDt(saveVO.getSalesOpptShowRoomMgmtVO().getVsitDt());
                    salesOpptProcessMgmtVO.setVsitPrsnCnt(saveVO.getSalesOpptShowRoomMgmtVO().getVsitPrsnCnt());
                    salesOpptProcessMgmtVO.setVsitEndDt(saveVO.getSalesOpptShowRoomMgmtVO().getVsitEndDt());
                    salesOpptProcessMgmtVO.setInfoTp(saveVO.getSalesOpptShowRoomMgmtVO().getInfoTp());
                    salesOpptProcessMgmtVO.setPayTp(saveVO.getSalesOpptShowRoomMgmtVO().getPayTp());
                    salesOpptProcessMgmtVO.setExpcPurcHmCd(saveVO.getSalesOpptShowRoomMgmtVO().getExpcPurcHmCd());
                    salesOpptProcessMgmtVO.setLocalCarRegNoYn(saveVO.getSalesOpptShowRoomMgmtVO().getLocalCarRegNoYn());
                    salesOpptProcessMgmtVO.setIntrCarlineCd(saveVO.getSalesOpptShowRoomMgmtVO().getIntrCarlineCd());
                    salesOpptProcessMgmtVO.setIntrModelCd(saveVO.getSalesOpptShowRoomMgmtVO().getIntrModelCd());
                    salesOpptProcessMgmtVO.setIntrColorCd(saveVO.getSalesOpptShowRoomMgmtVO().getIntrColorCd());
                    salesOpptProcessMgmtVO.setEstimateCont(saveVO.getSalesOpptShowRoomMgmtVO().getEstimateCont());
                    salesOpptProcessMgmtVO.setSalesCont(saveVO.getSalesOpptShowRoomMgmtVO().getSalesCont());
                    salesOpptProcessMgmtVO.setRemark(saveVO.getSalesOpptShowRoomMgmtVO().getRemark());
                    salesOpptProcessMgmtVO.setMathDocTp(saveVO.getSalesOpptShowRoomMgmtVO().getMathDocTp());
                    salesOpptProcessMgmtVO.setSsnCrnNo(saveVO.getSalesOpptShowRoomMgmtVO().getSsnCrnNo());
                    salesOpptProcessMgmtVO.setBizcondCd(saveVO.getSalesOpptShowRoomMgmtVO().getBizcondCd());
                    salesOpptProcessMgmtVO.setOfficeTelNo(saveVO.getSalesOpptShowRoomMgmtVO().getOfficeTelNo());
                    salesOpptProcessMgmtVO.setPurcMngNm(saveVO.getSalesOpptShowRoomMgmtVO().getPurcMngNm());
                    salesOpptProcessMgmtVO.setIntrFscpModtpCd(saveVO.getSalesOpptShowRoomMgmtVO().getIntrFscpModtpCd());

                    salesOpptProcessMgmtVO.setLeadStartDt(saveVO.getSalesOpptShowRoomMgmtVO().getLeadStartDt());

                }

                if (salesOpptProcCount >= 1) { // 판매기회가 있음.
                    List<SalesOpptProcessMgmtVO> salesOpptProcess = salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByCondition(salesOpptProcessMgmtSearchVO);
                    saleOpptSeq = salesOpptProcess.get(0).getSeq();
                    //salesOpptProcessMgmtVO.setBefLeadStatCd(salesOpptProcess.get(0).getLeadStatCd());
                    salesOpptProcessMgmtVO.setBefLeadStatCd(salesOpptProcess.get(0).getBefLeadStatCd());
                    
                    
                    //----liuxueying add 跟踪促成，并且属于蓝斌试驾的线索，增加向FMS传输转介绍接口信息  start-----------
                    Integer holdDetlTpSeq = salesOpptProcess.get(0).getHoldDetlTpSeq();
                    if ("04".equals(leadStatCd) && !StringUtils.equals(salesOpptProcessMgmtVO.getBefLeadStatCd(),"04") 
                    		 && null != holdDetlTpSeq){
                    	List<SalesOpptHoldTypeMgmtVO > list = salesOpptHoldTypeMgmtDAO.selectSalesOpptForBM(holdDetlTpSeq);
                    	int count = salesOpptProcessMgmtDAO.selectSucByConditionCnt(salesOpptShowRoomMgmtVO.getSaleOpptSeq());
                    	if(count <= 0){//第一次跟踪促成
                    		SalesOpptProcessMgmtVO vo = new SalesOpptProcessMgmtVO();
                    		vo.setHpNo(salesOpptProcess.get(0).getHpNo());
                    		vo.setDlrCd(salesOpptProcess.get(0).getDlrCd());
                    		vo.setSeq(salesOpptProcess.get(0).getSeq());
                    		if(list != null && list.size() > 0){
                    			vo.setRemark("BM推荐购车");
                    			salesOpptProcessMgmtDAO.insertCustomerSuccessNoticeToFms(vo);
                    		}else{
                    			List<SalesOpptHoldTypeMgmtVO > tdlist = salesOpptHoldTypeMgmtDAO.selectSalesOpptForBMTD(holdDetlTpSeq);
                    			if(tdlist != null && tdlist.size() > 0){
                    				vo.setRemark("bluemembers网站试驾");
        	            			salesOpptProcessMgmtDAO.insertCustomerSuccessNoticeToFms(vo);
        	            		}
                    		}
                    	}
                    }
                    //----liuxueying add  跟踪促成，并且属于蓝斌试驾的线索，增加向FMS传输转介绍接口信息  end--------------
                    
                    
                    if ( StringUtils.isNotEmpty(salesOpptShowRoomMgmtVO.getSaleOpptSeq()) ) {
                        salesOpptProcessMgmtVO.setLeadStatCd(salesOpptProcess.get(0).getLeadStatCd());
                    }

                    // 책임자 셋팅 (화면에서 전달 받음 책임자 아이디)
                    salesOpptProcessMgmtVO.setMngScId(mngScId);

                    // 현재 라이브가 아닌 상태 이면 리셋하면서 살린다.
                    if ( !"06".equals(salesOpptProcess.get(0).getLeadStatCd())
                            && !"08".equals(salesOpptProcess.get(0).getLeadStatCd())
                            && !"09".equals(salesOpptProcess.get(0).getLeadStatCd())
                            ) {
                        salesOpptProcessMgmtVO.setLeadStartDt(null);
                    }

                    salesOpptProcessMgmtVO.setSeq(saleOpptSeq);

                    /* leadStatCd = 99 전시장에서 '저장' 클릭시
                     * 해당 판매기회줄 전시장 키에 일치하는것만 업데이트 하도록 한다.
                     * SHOWROOM으로 검색조건에 전시장 SEQ 추가 하도록 한다.
                     */
                    if( "99".equals(leadStatCd) ) {
                        salesOpptProcessMgmtVO.setDataTable("SHOWROOM");
                    }
                    salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

// 주소정보 고객쪽에 업데이트????????
// 전시장 주소 등록
//                    for (i=0; saveVO.addressInfoVOList.getInsertList().size() > i ; i++){
//                        saveVO.addressInfoVOList.getInsertList().get(i).setRefTableNm("CR_0101T");
//                        saveVO.addressInfoVOList.getInsertList().get(i).setrefKeyNm(custNo);
//                    }
//
//                    for (i=0; saveVO.addressInfoVOList.getUpdateList().size() > i ; i++){
//                        saveVO.addressInfoVOList.getUpdateList().get(i).setRefTableNm("CR_0101T");
//                        saveVO.addressInfoVOList.getUpdateList().get(i).setrefKeyNm(custNo);
//                    }
//
//                    for (i=0; saveVO.addressInfoVOList.getDeleteList().size() > i ; i++){
//                        saveVO.addressInfoVOList.getDeleteList().get(i).setRefTableNm("CR_0101T");
//                        saveVO.addressInfoVOList.getDeleteList().get(i).setrefKeyNm(custNo);
//                    }
//
//                    addressInfoService.multiAddressInfo(saveVO.addressInfoVOList);

                } else {
                    // 판매기회가 없음.
                    salesOpptProcessMgmtVO.setDelYn("N");
                    salesOpptProcessMgmtVO.setBhmcYn("N");
                    salesOpptProcessMgmtVO.setExhvFlakSeq(salesOpptShowRoomNo);
                    salesOpptProcessMgmtService.insertSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
                    saleOpptSeq = salesOpptProcessMgmtVO.getSeq();
                }

                // 단계로 가고 판매기회 시퀀스가 있으면 고객쪽 업데이트
                if ( "04".equals(salesOpptProcessMgmtVO.getLeadStatCd())
                        && StringUtils.isNotBlank(saleOpptSeq)
                        ) {

                    CustomerInfoVO customerInfoVO = new CustomerInfoVO();

                    customerInfoVO.setCustNo(custNo);
                    customerInfoVO.setDlrCd(saveVO.getSalesOpptShowRoomMgmtVO().getDlrCd());
                    customerInfoVO.setHpNo(saveVO.getSalesOpptShowRoomMgmtVO().getHpNo());
                    customerInfoVO.setOfficeTelNo(saveVO.getSalesOpptShowRoomMgmtVO().getOfficeTelNo());
                    customerInfoVO.setCustNm(saveVO.getSalesOpptShowRoomMgmtVO().getCustNm());
                    customerInfoVO.setCustTp(saveVO.getSalesOpptShowRoomMgmtVO().getCustTp());
                    customerInfoVO.setSexCd(saveVO.getSalesOpptShowRoomMgmtVO().getSexCd());
                    customerInfoVO.setTelNo(saveVO.getSalesOpptShowRoomMgmtVO().getTelNo());
                    customerInfoVO.setWechatId(saveVO.getSalesOpptShowRoomMgmtVO().getWechatId());
                    customerInfoVO.setEmailNm(saveVO.getSalesOpptShowRoomMgmtVO().getEmailNm());
                    customerInfoVO.setMngScId(saveVO.getSalesOpptShowRoomMgmtVO().getMngScId());
                    customerInfoVO.setMathDocTp(saveVO.getSalesOpptShowRoomMgmtVO().getMathDocTp());
                    customerInfoVO.setSsnCrnNo(saveVO.getSalesOpptShowRoomMgmtVO().getSsnCrnNo());
                    customerInfoVO.setBizcondCd(saveVO.getSalesOpptShowRoomMgmtVO().getBizcondCd());
                    //customerInfoVO.setCustHoldTp(saveVO.getSalesOpptProcessMgmtVO().getCustHoldTp());
                    //customerInfoVO.setCustHoldTpDtl(saveVO.getSalesOpptProcessMgmtVO().getCustHoldTpDtl());
                    customerInfoVO.setCommandTp("LEADOPPTPROC");
                    customerInfoVO.setPurcMngNm(saveVO.getSalesOpptShowRoomMgmtVO().getRelCustNm());

                    if ("02".equals(saveVO.getSalesOpptShowRoomMgmtVO().getCustTp())) { // 법인인 경우
                        customerInfoVO.setHpNo(saveVO.getSalesOpptShowRoomMgmtVO().getRelCustHpNo());
                    }
                    customerInfoVO.setUpdtUsrId(LoginUtil.getUserId());
                    customerInfoVO.setMngScIdIsNull("U");
                    customerInfoVO = customerInfoService.updateCustomer(customerInfoVO);
                }

                // 전시장 업데이트 고객번호 업데이트
                salesOpptShowRoomMgmtVO.setCustNo(custNo);
                salesOpptShowRoomMgmtVO.setSaleOpptSeq(saleOpptSeq);
                updateSalesOpptShowRoomMgmt(salesOpptShowRoomMgmtVO);

              //update by yonyou-sunzhiqiang 2018-02-06 展厅客流，展厅接待录入线索并提交至跟踪促成（分配线索负责人（销售顾问）） start;
    			//判断线索状态是否为“线索导入”并且未分配负责人;
    				try {

    					String todoMsg = "";
    				
    					TodoInfoVO todoInfoVO = new TodoInfoVO();
    					todoMsg = messageSource.getMessage("crm.info.passengerflowToMediated" , new String[]{salesOpptShowRoomMgmtVO.getCustNm()} , Locale.CHINA );
    				
    					todoInfoVO.setTodoPolicyId("TD-P-20004");
    					todoInfoVO.setTodoDesc(todoMsg);
    					todoInfoVO.setActionParams("custNo="+custNo+"&leadStatCd="+leadStatCd);
    					todoInfoVO.setRegUsrId("SYSTEM");
    					//展厅客流至促成，需要通知该线索负责人。无法在系统中配置职位或固定某人。以额外通知人方式添加；
    					todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(salesOpptShowRoomMgmtVO.getMngScId()));
    					todoInfoService.insertTodoInfo(todoInfoVO);
    				} catch(Exception e){
    					throw new BizException(e.getMessage());
    				}
    			//update by yonyou-sunzhiqiang 2018-02-06 展厅客流，展厅接待录入线索并提交至跟踪促成（分配线索负责人（销售顾问）） end;
            }

            return salesOpptShowRoomNo;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        SalesOpptShowRoomMgmtSearchVO searchVO = new SalesOpptShowRoomMgmtSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();
        int year;
        int month;
        int day;

        if (StringUtils.isNotEmpty((String)params.get("sVsitDtFrom"))) {
            searchVO.setsVsitDtFrom(DateUtil.convertToDate((String)params.get("sVsitDtFrom")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sVsitDtTo"))) {
            searchVO.setsVsitDtTo(DateUtil.convertToDate((String)params.get("sVsitDtTo")));
        }

        if(searchVO.getsVsitDtFrom() != null || searchVO.getsVsitDtTo() != null ){

            if(searchVO.getsVsitDtFrom() == searchVO.getsVsitDtTo()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsVsitDtFrom());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsVsitDtFrom(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsVsitDtTo() != null){
                // 종료일이 있는경우
                endCal.setTime(searchVO.getsVsitDtTo());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsVsitDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }

        List<SalesOpptShowRoomMgmtVO> list = selectSalesOpptShowRoomMgmtsByCondition(searchVO);
        if ( list.size() > 0 ) {
            context.putVar("items", list);
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService#selectSalesOpptShowRoomSummaryCntByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSearchVO)
     */
    @Override
    public SalesOpptShowRoomMgmtVO selectSalesOpptShowRoomSummaryCntByCondition(SalesOpptShowRoomMgmtSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptShowRoomMgmtDAO.selectSalesOpptShowRoomSummaryCntByCondition(searchVO);
    }

}
