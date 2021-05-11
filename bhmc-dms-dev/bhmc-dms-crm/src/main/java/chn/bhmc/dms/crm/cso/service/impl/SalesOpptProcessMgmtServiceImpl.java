package chn.bhmc.dms.crm.cso.service.impl;

import java.util.ArrayList;
import java.util.Date;
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

import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;

import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoAppendUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.ass.vo.SalesOpptProcessSaveVO;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.service.CustomerRelInfoService;
import chn.bhmc.dms.crm.cif.service.dao.CustomerInfoDAO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.cmm.service.RegularExpressionService;
import chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtFinishService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptProcessMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtVO;
import chn.bhmc.dms.sal.acu.service.ContBeforeMngOutBoundService;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngOutBoundVO;
import chn.bhmc.dms.sal.cnt.service.ContractReOutBoundService;
import chn.bhmc.dms.sal.cnt.vo.ContractReSupportVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptHoldTypeMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO;
/**
 * 판매기회 관리 서비스 구현 클래스
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

@Service("salesOpptProcessMgmtService")
public class SalesOpptProcessMgmtServiceImpl extends HService implements SalesOpptProcessMgmtService, JxlsSupport{

    /**
     * commonCode Management
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * Customer Management
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * Customer Management
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * Address Management
     */
    @Resource(name="addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * 판매기회프로세스 관리 DAO
     */
    @Resource(name="salesOpptProcessMgmtDAO")
    SalesOpptProcessMgmtDAO salesOpptProcessMgmtDAO;

    /**
     * 전시장방문관리 Service
     */
    @Resource(name="salesOpptShowRoomMgmtService")
    SalesOpptShowRoomMgmtService salesOpptShowRoomMgmtService;

    /**
     * 당직관리 Service
     */
    @Resource(name="salesOnDutyMgmtService")
    SalesOnDutyMgmtService salesOnDutyMgmtService;

    /**
     * ContractReOutBoundService Service
     */
    @Resource(name="contractReOutBoundService")
    ContractReOutBoundService contractReOutBoundService;

    /**
     * ContractReOutBoundService Service
     */
    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;

    /**
     * notificationMessageService
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    /**
     * RegularExpressionService
     */
    @Resource(name="regularExpressionService")
    RegularExpressionService regularExpressionService;

    /**
     * customerRelInfoService
     */
    @Resource(name="customerRelInfoService")
    CustomerRelInfoService customerRelInfoService;

    /**
     * SalesOpptHoldTypeMgmtService
     */
    @Resource(name="salesOpptHoldTypeMgmtService")
    SalesOpptHoldTypeMgmtService salesOpptHoldTypeMgmtService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * TO-DO 관리 서비스
     */
    @Resource(name="todoInfoService")
    TodoInfoService todoInfoService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 고객정보조회 DAO
     */
    @Resource(name="customerInfoDAO")
    CustomerInfoDAO customerInfoDAO;

    /**
     * 예약판매관리
     */
    @Resource(name="contBeforeMngOutBoundService")
    ContBeforeMngOutBoundService contBeforeMngOutBoundService;

    /**
     * 시스템 컨피그 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 판매기회진행이력 관리
     */
    @Resource(name="salesOpptProcessMgmtFinishService")
    SalesOpptProcessMgmtFinishService salesOpptProcessMgmtFinishService;

    /**
     * Crm 공통 Service
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;

    @Resource(name="salesOpptHoldTypeMgmtDAO")
    SalesOpptHoldTypeMgmtDAO salesOpptHoldTypeMgmtDAO;
    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public int selectSalesOpptProcessUnionMgmtsByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        /*
         * dlrCd, 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptProcessMgmtDAO.selectSalesOpptProcessUnionMgmtsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessUnionMgmtsByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptProcessMgmtDAO.selectSalesOpptProcessUnionMgmtsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsIngByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public SalesOpptProcessMgmtVO selectSalesOpptProcessMgmtsIngByKey(SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsIngByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsIngByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessMgmtsIngByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsIngByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public int selectSalesOpptProcessMgmtsIngByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception {

        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsIngByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public int selectSalesOpptProcessMgmtsByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        /*
         * dlrCd, 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}

        return salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessMgmtsByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsByKey(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public SalesOpptProcessMgmtVO selectSalesOpptProcessMgmtsByKey(SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#insertSalesOpptProcessMgmt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO)
     */
    @Override
    public int insertSalesOpptProcessMgmt(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception {
        if (StringUtils.isBlank(salesOpptProcessMgmtVO.getDlrCd())){salesOpptProcessMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(salesOpptProcessMgmtVO.getRegUsrId())) {salesOpptProcessMgmtVO.setRegUsrId(LoginUtil.getUserId());}

        // 필수체크
        if (StringUtils.isBlank(salesOpptProcessMgmtVO.getLeadStatCd())){salesOpptProcessMgmtVO.setLeadStatCd("01");}

        // 기본값 셋팅
        if (StringUtils.isBlank(salesOpptProcessMgmtVO.getBhmcYn())) {salesOpptProcessMgmtVO.setBhmcYn("Y");}
        if (StringUtils.isBlank(salesOpptProcessMgmtVO.getDelYn())) {salesOpptProcessMgmtVO.setDelYn("N");}
        //if (StringUtils.isBlank(salesOpptProcessMgmtVO.getRvsitYn())) {salesOpptProcessMgmtVO.setRvsitYn("N");}

        String regExpRlt = "";

        //핸드폰 번호 제한 걸기 11자리 안 되면 리턴
        if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getHpNo())) {
            if (salesOpptProcessMgmtVO.getHpNo().length() <= 10) {
                throw processException("crm.info.hpno11DigitRequired");
            }

            //정규식 체크 (hpNo)
            regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(salesOpptProcessMgmtVO.getHpNo());
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
        if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getEmailNm())) {
            regExpRlt = regularExpressionService.selectRegularExpressionByEmail(salesOpptProcessMgmtVO.getEmailNm());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpEmail"); // 이메일이 규칙에 맞지 않습니다.
            }
        }

        // telNo
        if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getTelNo())) {
            regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(salesOpptProcessMgmtVO.getTelNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
            }
        }

        // officeTelNo
        if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getOfficeTelNo())) {
            regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(salesOpptProcessMgmtVO.getOfficeTelNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
            }
        }
        // ssnCrnNo
        if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getSsnCrnNo())) {
            if("01".equals(salesOpptProcessMgmtVO.getMathDocTp())) {
                if (salesOpptProcessMgmtVO.getSsnCrnNo().length() == 15) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo15Digit(salesOpptProcessMgmtVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                        throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                    }

                } else if (salesOpptProcessMgmtVO.getSsnCrnNo().length() == 18) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo18Digit(salesOpptProcessMgmtVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                        throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                    }
                } else {
                    //throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                    throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                }
            } else if("08".equals(salesOpptProcessMgmtVO.getMathDocTp())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByCorpNo(salesOpptProcessMgmtVO.getSsnCrnNo());
                if ("FALSE".equals(regExpRlt)){
                    //throw processException("crm.info.regExpCorpNo"); // 법인번호가 규칙에 맞지 않습니다.
                    throw processException("crm.info.regExpSsnCrnNo"); // 증거번호가 규칙에 맞지 않습니다.
                }
            }
        }

        if ( salesOpptProcessMgmtVO.getHoldTp() != null && "03".equals(salesOpptProcessMgmtVO.getHoldTp()) ) {
            if ( salesOpptProcessMgmtVO.getHoldDetlTpSeq() == null ) {
                // 리드출처상세는 필수 입니다.
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.approchLocationDtl", null, LocaleContextHolder.getLocale())});
            }
        }

        /*
         * ==============================================
         *  정규식 체크 - 끝
         * ==============================================
         */


        if (salesOpptProcessMgmtVO.getVsitPrsnCnt() != null) {
            if (salesOpptProcessMgmtVO.getVsitPrsnCnt() == 0){
                salesOpptProcessMgmtVO.setVsitPrsnCnt(1);
            }
        }

        // 중복확인
        SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
        salesOpptProcessMgmtSearchVO.setsCustNo(salesOpptProcessMgmtVO.getCustNo());

        int salesOpptProcCount = selectSalesOpptProcessMgmtsByConditionCnt(salesOpptProcessMgmtSearchVO);

        if (salesOpptProcCount >= 1) {
            throw processException("global.info.already");  // throw processException("global.lbl.no");
        }

        salesOpptProcessMgmtDAO.insertSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

        // 판매기회이력관리 추가.
        SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO = new SalesOpptProcessMgmtFinishVO();
        salesOpptProcessMgmtFinishVO.setSeq(salesOpptProcessMgmtVO.getSeq());
        salesOpptProcessMgmtFinishService.insertSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);
        salesOpptProcessMgmtVO.setcSeq(salesOpptProcessMgmtFinishVO.getcSeq());

        return salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#updateSalesOpptProcessMgmt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO)
     * support로 이동 (salesOpptProcessMgmtOutBoundService)
     */
/*
    @Override
    public int updateSalesOpptProcessMgmt(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception {

        if (StringUtils.isBlank(salesOpptProcessMgmtVO.getDlrCd())){salesOpptProcessMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(salesOpptProcessMgmtVO.getUpdtUsrId())) {salesOpptProcessMgmtVO.setUpdtUsrId(LoginUtil.getUserId());}

        // 필수체크
        if (StringUtils.isBlank(salesOpptProcessMgmtVO.getLeadStatCd())) {
            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("crm.lbl.step", null, LocaleContextHolder.getLocale())});
        }

        return salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
    }
*/

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#multiSalesOpptProcMgmts(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO)
     */
    @Override
    public String multiSalesOpptProcMgmts(SalesOpptProcessMgmtSaveVO saveVO) throws Exception {

        try {

            /**
             * 1. 고객 관리
             * 2. 판매기회관리
             * 3. 전시장방문관리
             * 4. 알림서비스처리
             */
            // 고객 신규 등록 확인
            String dlrCd = LoginUtil.getDlrCd();
            String custNo = saveVO.getSalesOpptProcessMgmtVO().getCustNo();
            String salesOpptProcNo = saveVO.getSalesOpptProcessMgmtVO().getSeq();
            String showRoomSeq = saveVO.getSalesOpptProcessMgmtVO().getSeq();  // 추적(04) 단계에서 전시장데이터 수정 했을때 사용
            String leadStatCd = saveVO.getSalesOpptProcessMgmtVO().getLeadStatCd();
            String mngScId = saveVO.getSalesOpptProcessMgmtVO().getMngScId();
            String hpNo = saveVO.getSalesOpptProcessMgmtVO().getHpNo();
            //String officeTelNo = saveVO.getSalesOpptProcessMgmtVO().getOfficeTelNo();
            String custTp = saveVO.getSalesOpptProcessMgmtVO().getCustTp();
            String showRoomNo = saveVO.getSalesOpptProcessMgmtVO().getExhvFlakSeq();
            String dataTable = saveVO.getSalesOpptProcessMgmtVO().getDataTable();
            Date vsitResvDt = saveVO.getSalesOpptProcessMgmtVO().getVsitResvDt();
            String beforeLeadStatCd = "";
            String onDutyYn = saveVO.getSalesOpptProcessMgmtVO().getOnDutyYn();
            String custHoldTp = "";
            String custCd = saveVO.getSalesOpptProcessMgmtVO().getCustCd();
            String validGradeCd = "";

            if (StringUtils.isBlank(saveVO.getSalesOpptProcessMgmtVO().getDlrCd())){saveVO.getSalesOpptProcessMgmtVO().setDlrCd(dlrCd);}

            String regExpRlt = "";

            // 핸드폰 번호 제한 걸기 11자리 안 되면 리턴
            if (StringUtils.isNotBlank(hpNo)) {
                if (hpNo.length() <= 10) {
                    throw processException("crm.info.hpno11DigitRequired");
                }

                //정규식 체크 (hpNo)
                regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(hpNo);
                if ("FALSE".equals(regExpRlt)){
                    throw processException("crm.info.regExpHpNo"); // 이동전화 번호가 규칙에 맞지 않습니다.
                }

            }

            CustomerInfoVO customerInfoVO = new CustomerInfoVO();

            //boolean custRegChk = true;

            // 1. 고객 관리
            if (StringUtils.isNotBlank(custNo)){
                // 고객 정보 업데이트
//                if (custTp.equals("01")) {
//                    customerInfoVO.setHpNo(saveVO.getSalesOpptProcessMgmtVO().getHpNo());
//                }else{
//                    customerInfoVO.setOfficeTelNo(saveVO.getSalesOpptProcessMgmtVO().getOfficeTelNo());
//                }
                customerInfoVO.setHpNo(saveVO.getSalesOpptProcessMgmtVO().getHpNo());
                customerInfoVO.setOfficeTelNo(saveVO.getSalesOpptProcessMgmtVO().getOfficeTelNo());

                customerInfoVO.setCustNm(saveVO.getSalesOpptProcessMgmtVO().getCustNm());
                customerInfoVO.setCustTp(custTp);
                customerInfoVO.setCustNo(custNo);
                customerInfoVO.setCustCd(custCd);
                customerInfoVO.setDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
                customerInfoVO.setSexCd(saveVO.getSalesOpptProcessMgmtVO().getSexCd());
                customerInfoVO.setTelNo(saveVO.getSalesOpptProcessMgmtVO().getTelNo());
                customerInfoVO.setWechatId(saveVO.getSalesOpptProcessMgmtVO().getWechatId());
                customerInfoVO.setEmailNm(saveVO.getSalesOpptProcessMgmtVO().getEmailNm());
                //customerInfoVO.setMngScId(saveVO.getSalesOpptProcessMgmtVO().getMngScId());
                customerInfoVO.setMathDocTp(saveVO.getSalesOpptProcessMgmtVO().getMathDocTp());
                customerInfoVO.setSsnCrnNo(saveVO.getSalesOpptProcessMgmtVO().getSsnCrnNo());
                customerInfoVO.setBizcondCd(saveVO.getSalesOpptProcessMgmtVO().getBizcondCd());
                //customerInfoVO.setCustHoldTp(saveVO.getSalesOpptProcessMgmtVO().getCustHoldTp());
                //customerInfoVO.setCustHoldTpDtl(saveVO.getSalesOpptProcessMgmtVO().getCustHoldTpDtl());
                customerInfoVO.setCommandTp("LEADOPPTPROC");

                customerInfoVO.setPurcMngNm(saveVO.getSalesOpptProcessMgmtVO().getRelCustNm());
                if ("02".equals(custTp)) { // 법인인 경우
                    customerInfoVO.setHpNo(saveVO.getSalesOpptProcessMgmtVO().getRelCustHpNo());
                }
                customerInfoVO = customerInfoService.updateCustomer(customerInfoVO);
                if ( saveVO.addressInfoVOList != null ) {

                  // 판매기회에 주소등록
                    if ( saveVO.addressInfoVOList.getUpdateList().size() > 0 || saveVO.addressInfoVOList.getDeleteList().size() > 0 || saveVO.addressInfoVOList.getInsertList().size() > 0 ) {

                        if(saveVO.addressInfoVOList.getInsertList().size() > 0){
                            for (int i=0; saveVO.addressInfoVOList.getInsertList().size() > i ; i++){
                                if (StringUtils.isBlank(saveVO.addressInfoVOList.getInsertList().get(i).getAddrDetlCont())){
                                    throw processException("crm.lbl.noAddrDetlCont");
                                }
                            }
                        }

                        if ( saveVO.addressInfoVOList.getUpdateList().size() > 0 ) {
                            for (int i=0; saveVO.addressInfoVOList.getUpdateList().size() > i ; i++){
                                saveVO.addressInfoVOList.getUpdateList().get(i).setRefTableNm("CR_0101T");
                                saveVO.addressInfoVOList.getUpdateList().get(i).setrefKeyNm(custNo);
                            }
                        }

                        if (saveVO.addressInfoVOList.getDeleteList().size() > 0 ) {
                            for (int i=0; saveVO.addressInfoVOList.getDeleteList().size() > i ; i++){
                                saveVO.addressInfoVOList.getDeleteList().get(i).setRefTableNm("CR_0101T");
                                saveVO.addressInfoVOList.getDeleteList().get(i).setrefKeyNm(custNo);
                            }
                        }

                    }

                    addressInfoService.multiAddressInfo(saveVO.addressInfoVOList);
                }

            } else {

                // 고객신규등록
                customerInfoVO.setDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
                //customerInfoVO.setMngScId(saveVO.getSalesOpptProcessMgmtVO().getMngScId());
                customerInfoVO.setCustNm(saveVO.getSalesOpptProcessMgmtVO().getCustNm());
                customerInfoVO.setHpNo(saveVO.getSalesOpptProcessMgmtVO().getHpNo());
                customerInfoVO.setTelNo(saveVO.getSalesOpptProcessMgmtVO().getTelNo());
                customerInfoVO.setWechatId(saveVO.getSalesOpptProcessMgmtVO().getWechatId());
                customerInfoVO.setEmailNm(saveVO.getSalesOpptProcessMgmtVO().getEmailNm());
                customerInfoVO.setOfficeTelNo(saveVO.getSalesOpptProcessMgmtVO().getOfficeTelNo());
                customerInfoVO.setCustTp(saveVO.getSalesOpptProcessMgmtVO().getCustTp());
                customerInfoVO.setSexCd(saveVO.getSalesOpptProcessMgmtVO().getSexCd());
                customerInfoVO.setMathDocTp(saveVO.getSalesOpptProcessMgmtVO().getMathDocTp());
                customerInfoVO.setSsnCrnNo(saveVO.getSalesOpptProcessMgmtVO().getSsnCrnNo());
                customerInfoVO.setBizcondCd(saveVO.getSalesOpptProcessMgmtVO().getBizcondCd());
                customerInfoVO.setPrefCommMthCd("01"); // Default : HpNo (01)
                customerInfoVO.setPrefCommNo(saveVO.getSalesOpptProcessMgmtVO().getHpNo()); // Default : HpNo
                customerInfoVO.setCustCd("01"); // 가망고객(01) 으로 셋팅
                customerInfoVO.setPerInfoAgreeYn("Y"); // 개인정보확인서 사인 여부
                //customerInfoVO.setCustHoldTp(saveVO.getSalesOpptProcessMgmtVO().getHoldTp());
                //customerInfoVO.setCustHoldTpDtl(String.valueOf(saveVO.getSalesOpptProcessMgmtVO().getHoldDetlTpSeq()));
                CommonCodeVO commonCodeVO = new CommonCodeVO();
                commonCodeVO = commonCodeService.selectCommonCodeByKey("CRM008", saveVO.getSalesOpptProcessMgmtVO().getHoldTp());
                custHoldTp = commonCodeVO.getRemark1();
                customerInfoVO.setCustHoldTp(custHoldTp);
                customerInfoVO.setCustCollSrcCd("01"); //  CRM042   01:판매 02:정비

                customerInfoVO.setPurcMngNm(saveVO.getSalesOpptProcessMgmtVO().getRelCustNm());
                if ("02".equals(saveVO.getSalesOpptProcessMgmtVO().getCustTp())) { // 법인인 경우
                    customerInfoVO.setHpNo(saveVO.getSalesOpptProcessMgmtVO().getRelCustHpNo());
                }

                customerInfoVO.setMngScIdIsNull("N");
                customerInfoVO = customerInfoService.insertCustomer(customerInfoVO);

                custNo = customerInfoVO.getCustNo();

                // 고객에 주소등록

                if (saveVO.addressInfoCurrList != null) {
                    if (saveVO.addressInfoCurrList.size() > 0) {
                        saveVO.addressInfoVOList.setInsertList(saveVO.addressInfoCurrList);
                    }
                }

                for (int i=0; saveVO.addressInfoVOList.getInsertList().size() > i ; i++){
                    saveVO.addressInfoVOList.getInsertList().get(i).setrefKeyNm(custNo);
                    saveVO.addressInfoVOList.getInsertList().get(i).setRefTableNm("CR_0101T");
                }

                addressInfoService.multiAddressInfo(saveVO.addressInfoVOList);

            }

            // 법인인 경우 연계인 생성 한다. 생성 유무는 유무는 relCustNo 판단한다.
            // 법인의 구매담당자를 연계인으로 등록하는 로직 - 시작
//            if (custTp.equals("02")) {
                //CustomerRelInfoVO customerRelInfoVO = new CustomerRelInfoVO();
//                if (StringUtils.isBlank(relSeq)) {
//
//                    if (StringUtils.isBlank(relCustNo)) {
//                        // 연계인 신규 생성 ( 잠재고객으로 등록을 한다.)
//                        customerInfoVO = new CustomerInfoVO();
//                        customerInfoVO.setDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
//                        customerInfoVO.setMngScId(saveVO.getSalesOpptProcessMgmtVO().getMngScId());
//                        customerInfoVO.setCustNm(relCustNm);
//                        customerInfoVO.setHpNo(relCustHpNo);
//                        customerInfoVO.setTelNo("");
//                        customerInfoVO.setCustTp("01");
//                        customerInfoVO.setPrefCommMthCd("01"); // Default : HpNo (01)
//                        customerInfoVO.setPrefCommNo(relCustHpNo); // Default : HpNo
//                        customerInfoVO.setCustCd("01"); // 가망고객(01) 으로 셋팅
//                        customerInfoVO = customerInfoService.insertCustomer(customerInfoVO);
//
//                        relCustNo = customerInfoVO.getCustNo();
//                    }
//
//                    customerRelInfoVO.setPconTp("08");  //법인구매 담당자.
//                    customerRelInfoVO.setUpperCustNo(custNo);
//                    customerRelInfoVO.setPconCustNo(relCustNo);
//                    customerRelInfoService.insertCustomerRelInfo(customerRelInfoVO);
//
//                } else {
//                    if (!relBefCustNo.equals(relCustNo)) {
//                        customerRelInfoVO.setPconTp("08");  //법인구매 담당자.
//                        customerRelInfoVO.setUpperCustNo(custNo);
//                        customerRelInfoVO.setPconCustNo(relCustNo);
//                        customerRelInfoService.updateCustomerRelInfo(customerRelInfoVO);
//                    }
//                }
                // 법인의 구매담당자를 연계인으로 등록하는 로직 - 끝
//            }

            // 2. 판매기회관리
            SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
            salesOpptProcessMgmtSearchVO.setsCustNo(custNo);
            int salesOpptProcCount = selectSalesOpptProcessMgmtsByConditionCnt(salesOpptProcessMgmtSearchVO);

            SalesOpptProcessMgmtVO salesOpptProcessMgmtVO = new SalesOpptProcessMgmtVO();
            salesOpptProcessMgmtVO = saveVO.getSalesOpptProcessMgmtVO();

            if (salesOpptProcCount <= 0) {
                // 판매기회등록 ( insertSalesOpptProcessMgmt )
                salesOpptProcessMgmtVO.setCustNo(custNo);

                if ("SHOWROOM".equals(dataTable)){
                    salesOpptProcessMgmtVO.setExhvFlakSeq(saveVO.getSalesOpptProcessMgmtVO().getSeq());
                }

                insertSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
                salesOpptProcNo = salesOpptProcessMgmtVO.getSeq();

                // 판매기회에 주소등록
                for (int i=0; saveVO.addressInfoVOList.getInsertList().size() > i ; i++){
                    saveVO.addressInfoVOList.getInsertList().get(i).setRefTableNm("CR_0101T");
                    saveVO.addressInfoVOList.getInsertList().get(i).setrefKeyNm(salesOpptProcNo);
                }
                addressInfoService.multiAddressInfo(saveVO.addressInfoVOList);
            } else {

                List<SalesOpptProcessMgmtVO> salesOpptProcessMgmtBeforeVO = selectSalesOpptProcessMgmtsByCondition(salesOpptProcessMgmtSearchVO);

                // 유효성 판단
                validGradeCd = salesOpptProcessMgmtBeforeVO.get(0).getValidGradeCd();

                beforeLeadStatCd = salesOpptProcessMgmtBeforeVO.get(0).getLeadStatCd();
                if ("08".equals(leadStatCd) || "09".equals(leadStatCd) ) {  // 08 전출,  09 실패
                    if (!("02".equals(beforeLeadStatCd)) && !("04".equals(beforeLeadStatCd)) ) {
                        beforeLeadStatCd = salesOpptProcessMgmtBeforeVO.get(0).getBefLeadStatCd();
                    }

                    if (("08".equals(leadStatCd)) && ("03".equals(beforeLeadStatCd))
                            ) {
                        beforeLeadStatCd = "04";
                    }
                    if (("09".equals(leadStatCd)) && ("03".equals(beforeLeadStatCd))) {
                        beforeLeadStatCd = "04";
                    }
                    if (("09".equals(leadStatCd)) && ("01".equals(beforeLeadStatCd))) {
                        beforeLeadStatCd = "02";
                    }
                }
//                String beforeMngScId = salesOpptProcessMgmtBeforeVO.get(0).getMngScId();

                //if (salesOpptProcessMgmtVO.getVsitPrsnCnt())

                salesOpptProcessMgmtVO.setBefLeadStatCd(beforeLeadStatCd);

                // 03에서 02 단계로 가는 경우 이전 담당자를 조회하여 강제 셋팅하도록 한다.
                if ( "03".equals(beforeLeadStatCd) ) {

                    if ( "02".equals(salesOpptProcessMgmtVO.getLeadStatCd()) ) {
                        SalesOpptProcessMgmtHistSearchVO salesOpptProcessMgmtHistSearchVO = new SalesOpptProcessMgmtHistSearchVO();

                        if (StringUtils.isBlank(salesOpptProcessMgmtHistSearchVO.getsDlrCd())) {
                            salesOpptProcessMgmtHistSearchVO.setsDlrCd(dlrCd);
                        };

                        salesOpptProcessMgmtHistSearchVO.setsCustNo(custNo);
                        List<SalesOpptProcessMgmtHistVO> salesOpptProcessMgmtHistVO = salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsHistLatestByCondition(salesOpptProcessMgmtHistSearchVO);

                        if (StringUtils.isNotBlank(salesOpptProcessMgmtHistVO.get(0).getBefMngScId())) {
                            salesOpptProcessMgmtVO.setMngScId(salesOpptProcessMgmtHistVO.get(0).getBefMngScId());
                        }
                    }

                    if ( "04".equals(salesOpptProcessMgmtVO.getLeadStatCd()) ) {
                        // 고객의 판매고문이 없는 경우 없데이트 한다.
                        // mngScIdIsNull
                        customerInfoVO = new CustomerInfoVO();
                        customerInfoVO.setCustNo(custNo);
                        customerInfoVO.setDlrCd(dlrCd);
                        customerInfoVO.setMngScIdIsNull("U");
                        customerInfoVO.setMngScId(mngScId);
                        customerInfoVO.setUpdtUsrId(LoginUtil.getUserId());
                        customerInfoDAO.updateCustomer(customerInfoVO);

                    }
                }

                // 계약 단계인 경우 계약번호를 가져와서 셋팅한다.
                // '05' 오더로 전출 시 판매 데이터 insert 04에서 05로 넘어갈때만 오더 생성한다.
                // nextContractTp = '01' 예약판매 , '02' 계약
                if (("04".equals(beforeLeadStatCd) && "05".equals(leadStatCd))) {
                    int addressCnt = 0;
                    List<CustomerInfoVO> custResult = new ArrayList<CustomerInfoVO>();
                    List<AddressInfoVO> custAddrResult = new ArrayList<AddressInfoVO>();
                    AddressInfoSearchVO addressInfoSearchVO = new AddressInfoSearchVO();
                    addressInfoSearchVO.setsDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
                    addressInfoSearchVO.setsRefKeyNm(custNo);
                    addressInfoSearchVO.setsAddrTp("02"); //영수증 주소

                    // 고객정보
                    CustomerInfoSearchVO customerInfoSearchVO = new CustomerInfoSearchVO();
                    customerInfoSearchVO.setsDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
                    customerInfoSearchVO.setsCustNo(custNo);
                    custResult = customerInfoOutBoundService.selectCustomerInfoByCondition(customerInfoSearchVO);

                    // 주소정보 (영수증 주소)
                    addressCnt = addressInfoService.selectAddressInfoByConditionCnt(addressInfoSearchVO);
                    if (addressCnt != 0) {
                        custAddrResult = addressInfoService.selectAddressInfoByCondition(addressInfoSearchVO);
                    }

                    if ("01".equals(saveVO.getSalesOpptProcessMgmtVO().getNextContractTp()) ) {
                        ContBeforeMngOutBoundVO contBeforeMngOutBoundVO = new ContBeforeMngOutBoundVO();
                        contBeforeMngOutBoundVO.setSaleOpptNo(salesOpptProcNo);
                        contBeforeMngOutBoundVO.setDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
                        contBeforeMngOutBoundVO.setSaleEmpNo(saveVO.getSalesOpptProcessMgmtVO().getMngScId());
                        contBeforeMngOutBoundVO.setCarlineCd(saveVO.getSalesOpptProcessMgmtVO().getPurcSelCarlineCd());
                        //contBeforeMngOutBoundVO.setModelCd(saveVO.getSalesOpptProcessMgmtVO().getPurcSelModelCd());
                        contBeforeMngOutBoundVO.setBeforeContractDt(saveVO.getSalesOpptProcessMgmtVO().getExpcPurcDt());
                        contBeforeMngOutBoundVO.setFscCd(saveVO.getSalesOpptProcessMgmtVO().getPurcFscpModtpCd());
                        contBeforeMngOutBoundVO.setSaleOpptSeq(saveVO.getSalesOpptProcessMgmtVO().getcSeq());

//                        Date toDay = DateUtil.convertToDate(DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));
//                        contBeforeMngOutBoundVO.setBeforeDt(toDay);

                        contBeforeMngOutBoundVO.setCustTp(custResult.get(0).getCustTp());
                        contBeforeMngOutBoundVO.setCustNm(custResult.get(0).getCustNm());
                        contBeforeMngOutBoundVO.setSsnCrnNo(custResult.get(0).getSsnCrnNo());
                        contBeforeMngOutBoundVO.setSsnCrnTp(custResult.get(0).getMathDocTp());
                        contBeforeMngOutBoundVO.setEmailNm(custResult.get(0).getEmailNm());
                        contBeforeMngOutBoundVO.setCustNo(custResult.get(0).getCustNo());
                        contBeforeMngOutBoundVO.setPurcMngNm(custResult.get(0).getPurcMngNm());
                        contBeforeMngOutBoundVO.setTaxpayerNo(custResult.get(0).getTaxpayerNo());

                        if (addressCnt != 0) {
                            contBeforeMngOutBoundVO.setZipCd(custAddrResult.get(0).getZipCd());
                            contBeforeMngOutBoundVO.setSungCd(custAddrResult.get(0).getSungCd());
                            contBeforeMngOutBoundVO.setCityCd(custAddrResult.get(0).getCityCd());
                            contBeforeMngOutBoundVO.setDistCd(custAddrResult.get(0).getDistCd());
                            contBeforeMngOutBoundVO.setSungNm(custAddrResult.get(0).getSungNm());
                            contBeforeMngOutBoundVO.setCityNm(custAddrResult.get(0).getCityNm());
                            contBeforeMngOutBoundVO.setDistNm(custAddrResult.get(0).getDistNm());
                            contBeforeMngOutBoundVO.setAddrDetlCont(custAddrResult.get(0).getAddrDetlCont());
                            contBeforeMngOutBoundVO.setAddrTp(custAddrResult.get(0).getAddrTp());
                        }

                        if ("01".equals(custResult.get(0).getCustTp())) {
                            contBeforeMngOutBoundVO.setTelNo1(custResult.get(0).getHpNo());
                        } else {
                            contBeforeMngOutBoundVO.setTelNo1(custResult.get(0).getHpNo());
                            //contBeforeMngOutBoundVO.setTelNo1(custResult.get(0).getOfficeTelNo());
                        }

                        String beforeNo = contBeforeMngOutBoundService.saveOpptContBefore(contBeforeMngOutBoundVO);

                        salesOpptProcessMgmtVO.setBeforeNo(beforeNo);


                    } else if ("02".equals(saveVO.getSalesOpptProcessMgmtVO().getNextContractTp()) ) {
                        ContractReSupportVO contractReSupportVO = new ContractReSupportVO();
                        contractReSupportVO.setSaleOpptNo(salesOpptProcNo);
                        contractReSupportVO.setDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
                        contractReSupportVO.setDlReqDt(saveVO.getSalesOpptProcessMgmtVO().getExpcPurcDt());
                        contractReSupportVO.setSaleEmpNo(saveVO.getSalesOpptProcessMgmtVO().getMngScId());
                        contractReSupportVO.setCarlineCd(saveVO.getSalesOpptProcessMgmtVO().getPurcSelCarlineCd());
                        //contractReSupportVO.setModelCd(saveVO.getSalesOpptProcessMgmtVO().getPurcSelModelCd());
                        contractReSupportVO.setFscCd(saveVO.getSalesOpptProcessMgmtVO().getPurcFscpModtpCd());
                        contractReSupportVO.setSaleOpptSeq(saveVO.getSalesOpptProcessMgmtVO().getcSeq());

                        //contractReSupportVO.setCustCd(custResult.get(0).getCustCd()); // 계약으로 넘어갈께 CUST_NO를  CUST_CD로 셋팅한다.
                        contractReSupportVO.setCustTp(custResult.get(0).getCustTp());
                        contractReSupportVO.setCustNm(custResult.get(0).getCustNm());
                        contractReSupportVO.setSsnCrnNo(custResult.get(0).getSsnCrnNo());
                        contractReSupportVO.setSsnCrnTp(custResult.get(0).getMathDocTp());
                        contractReSupportVO.setEmailNm(custResult.get(0).getEmailNm());
                        contractReSupportVO.setPurcMngNm(custResult.get(0).getPurcMngNm());
                        contractReSupportVO.setTaxPayNo(custResult.get(0).getTaxpayerNo());
                        //contractReSupportVO.setContractCustNo(custResult.get(0).getCustNo());
                        contractReSupportVO.setCustNo(custResult.get(0).getCustNo());

                        if (addressCnt != 0) {
                            contractReSupportVO.setZipCd(custAddrResult.get(0).getZipCd());
                            contractReSupportVO.setSungCd(custAddrResult.get(0).getSungCd());
                            contractReSupportVO.setCityCd(custAddrResult.get(0).getCityCd());
                            contractReSupportVO.setDistCd(custAddrResult.get(0).getDistCd());
                            contractReSupportVO.setSungNm(custAddrResult.get(0).getSungNm());
                            contractReSupportVO.setCityNm(custAddrResult.get(0).getCityNm());
                            contractReSupportVO.setDistNm(custAddrResult.get(0).getDistNm());
                            contractReSupportVO.setAddrDetlCont(custAddrResult.get(0).getAddrDetlCont());
                            contractReSupportVO.setAddrTp(custAddrResult.get(0).getAddrTp());
                        }

                        if ("01".equals(custResult.get(0).getCustTp())) {
                            contractReSupportVO.setTelNo1(custResult.get(0).getHpNo());
                        } else {
                            contractReSupportVO.setTelNo1(custResult.get(0).getHpNo());
                            //contractReSupportVO.setTelNo1(custResult.get(0).getOfficeTelNo());
                        }
                        String contractNo = contractReOutBoundService.saveOpptContracts(contractReSupportVO);

                        salesOpptProcessMgmtVO.setContractNo(contractNo);
                    }

                }

                    //Date leadStartDt = DateUtil.convertToDate(DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));
//                    Date leadStartDt = DateUtil.convertToDate(DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")+" "+systemConfigInfoService.selectStrValueByKey("timeFormat")));
//                    salesOpptProcessMgmtVO.setLeadStartDt(leadStartDt);
                // 판매기회업데이트
                salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

            }

            // 3. 전시장방문관리  // 04로 업데이트 하는 경우 전시장방문에 추가.
            SalesOpptShowRoomMgmtVO salesOpptShowRoomMgmtVO = new SalesOpptShowRoomMgmtVO();
            salesOpptShowRoomMgmtVO.setDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
            salesOpptShowRoomMgmtVO.setLeadStatCd("04");
            salesOpptShowRoomMgmtVO.setCustNm(saveVO.getSalesOpptProcessMgmtVO().getCustNm());
            salesOpptShowRoomMgmtVO.setCustTp(saveVO.getSalesOpptProcessMgmtVO().getCustTp());
            salesOpptShowRoomMgmtVO.setCustNo(saveVO.getSalesOpptProcessMgmtVO().getCustNo());
            salesOpptShowRoomMgmtVO.setVsitDt(saveVO.getSalesOpptProcessMgmtVO().getVsitDt());
            salesOpptShowRoomMgmtVO.setVsitEndDt(saveVO.getSalesOpptProcessMgmtVO().getVsitEndDt());
            salesOpptShowRoomMgmtVO.setMngScId(saveVO.getSalesOpptProcessMgmtVO().getMngScId());
            salesOpptShowRoomMgmtVO.setRvsitYn(saveVO.getSalesOpptProcessMgmtVO().getRvsitYn());

            salesOpptShowRoomMgmtVO.setHpNo(saveVO.getSalesOpptProcessMgmtVO().getHpNo());
            salesOpptShowRoomMgmtVO.setTelNo(saveVO.getSalesOpptProcessMgmtVO().getTelNo());
            salesOpptShowRoomMgmtVO.setOfficeTelNo(saveVO.getSalesOpptProcessMgmtVO().getOfficeTelNo());
            salesOpptShowRoomMgmtVO.setWechatId(saveVO.getSalesOpptProcessMgmtVO().getWechatId());
            salesOpptShowRoomMgmtVO.setEmailNm(saveVO.getSalesOpptProcessMgmtVO().getEmailNm());
            salesOpptShowRoomMgmtVO.setInfoTp(saveVO.getSalesOpptProcessMgmtVO().getInfoTp());
            salesOpptShowRoomMgmtVO.setHoldTp(saveVO.getSalesOpptProcessMgmtVO().getHoldTp());
            salesOpptShowRoomMgmtVO.setPayTp(saveVO.getSalesOpptProcessMgmtVO().getPayTp());
            salesOpptShowRoomMgmtVO.setExpcPurcHmCd(saveVO.getSalesOpptProcessMgmtVO().getExpcPurcHmCd());
            salesOpptShowRoomMgmtVO.setIntrCarlineCd(saveVO.getSalesOpptProcessMgmtVO().getIntrCarlineCd());
            //salesOpptShowRoomMgmtVO.setIntrModelCd(saveVO.getSalesOpptProcessMgmtVO().getIntrModelCd());
            salesOpptShowRoomMgmtVO.setIntrFscpModtpCd(saveVO.getSalesOpptProcessMgmtVO().getIntrFscpModtpCd());
            salesOpptShowRoomMgmtVO.setIntrColorCd(saveVO.getSalesOpptProcessMgmtVO().getIntrColorCd());
            salesOpptShowRoomMgmtVO.setLocalCarRegNoYn(saveVO.getSalesOpptProcessMgmtVO().getLocalCarRegNoYn());
            salesOpptShowRoomMgmtVO.setEstimateCont(saveVO.getSalesOpptProcessMgmtVO().getEstimateCont());
            salesOpptShowRoomMgmtVO.setSalesCont(saveVO.getSalesOpptProcessMgmtVO().getSalesCont());
            salesOpptShowRoomMgmtVO.setRemark(saveVO.getSalesOpptProcessMgmtVO().getRemark());
            salesOpptShowRoomMgmtVO.setSexCd(saveVO.getSalesOpptProcessMgmtVO().getSexCd());
            salesOpptShowRoomMgmtVO.setBhmcYn(saveVO.getSalesOpptProcessMgmtVO().getBhmcYn());
            salesOpptShowRoomMgmtVO.setSaleOpptSeq(salesOpptProcNo);

            // 화면에서 넘기지 않은 값을 전시장 정보로 넣기 위한 조회
            SalesOpptProcessMgmtSearchVO salesSaveAfter = new SalesOpptProcessMgmtSearchVO();
            salesSaveAfter.setsSeq(salesOpptProcNo);
            salesSaveAfter.setsDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
            List<SalesOpptProcessMgmtVO> salesSaveAfterList = salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByCondition(salesSaveAfter);
            if (StringUtils.isNotBlank(salesSaveAfterList.get(0).getValidGradeCd())) {
                salesOpptShowRoomMgmtVO.setValidGradeCd(salesSaveAfterList.get(0).getValidGradeCd());
            }
            if (salesSaveAfterList.get(0).getVsitResvDt() != null) {
                salesOpptShowRoomMgmtVO.setVsitResvDt(salesSaveAfterList.get(0).getVsitResvDt());
            }
            if (StringUtils.isNotBlank(salesSaveAfterList.get(0).getTraceGradeCd())) {
                salesOpptShowRoomMgmtVO.setTraceGradeCd(salesSaveAfterList.get(0).getTraceGradeCd());
            }
            if (StringUtils.isNotBlank(salesSaveAfterList.get(0).getInvalidCauCd())) {
                salesOpptShowRoomMgmtVO.setInvalidCauCd(salesSaveAfterList.get(0).getInvalidCauCd());
            }
            if (StringUtils.isNotBlank(salesSaveAfterList.get(0).getFailCauCd())) {
                salesOpptShowRoomMgmtVO.setFailCauCd(salesSaveAfterList.get(0).getFailCauCd());
            }
            if (StringUtils.isNotBlank(salesSaveAfterList.get(0).getFailCauReasonCont())) {
                salesOpptShowRoomMgmtVO.setFailCauReasonCont(salesSaveAfterList.get(0).getFailCauReasonCont());
            }
            if (StringUtils.isNotBlank(salesSaveAfterList.get(0).getPurcSelCarlineCd())) {
                salesOpptShowRoomMgmtVO.setPurcSelCarlineCd(salesSaveAfterList.get(0).getPurcSelCarlineCd());
            }
            if (StringUtils.isNotBlank(salesSaveAfterList.get(0).getPurcSelModelCd())) {
                salesOpptShowRoomMgmtVO.setPurcSelModelCd(salesSaveAfterList.get(0).getPurcSelModelCd());
            }
            if ( StringUtils.isNotBlank(salesSaveAfterList.get(0).getPurcFscpModtpCd()) ) {
                salesOpptShowRoomMgmtVO.setPurcFscpModtpCd(salesSaveAfterList.get(0).getPurcFscpModtpCd());
            }
            if (salesSaveAfterList.get(0).getExpcPurcDt() != null) {
                salesOpptShowRoomMgmtVO.setExpcPurcDt(salesSaveAfterList.get(0).getExpcPurcDt());
            }
            if (salesSaveAfterList.get(0).getExpcDealPrc() != null) {
                salesOpptShowRoomMgmtVO.setExpcDealPrc(salesSaveAfterList.get(0).getExpcDealPrc());
            }

            if (saveVO.getSalesOpptProcessMgmtVO().getHoldDetlTpSeq() != null) {
                salesOpptShowRoomMgmtVO.setHoldDetlTpSeq(saveVO.getSalesOpptProcessMgmtVO().getHoldDetlTpSeq());
            }

            if (saveVO.getSalesOpptProcessMgmtVO().getVsitPrsnCnt() != null ) {
                salesOpptShowRoomMgmtVO.setVsitPrsnCnt(saveVO.getSalesOpptProcessMgmtVO().getVsitPrsnCnt());
            }

            if (("03".equals(beforeLeadStatCd) && "04".equals(leadStatCd)) || ("SHOWROOM".equals(dataTable)) ) {

                if ("SHOWROOM".equals(dataTable)){
                    salesOpptShowRoomMgmtVO.setSeq(showRoomSeq);
                    salesOpptShowRoomMgmtVO.setCustNo(custNo);
                    salesOpptShowRoomMgmtService.updateSalesOpptShowRoomMgmt(salesOpptShowRoomMgmtVO);
                } else {
                    salesOpptShowRoomMgmtService.insertSalesOpptShowRoomMgmt(salesOpptShowRoomMgmtVO);
                    showRoomSeq = salesOpptShowRoomMgmtVO.getSeq();
                    salesOpptProcessMgmtVO.setExhvFlakSeq(showRoomSeq);
                    //salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

                    if ( salesOpptProcessMgmtVO.getHoldTp() != null && "03".equals(salesOpptProcessMgmtVO.getHoldTp()) ) {
                        if ( salesOpptProcessMgmtVO.getHoldDetlTpSeq() == null ) {
                            // 리드출처상세는 필수 입니다.
                            throw processException("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.approchLocationDtl", null, LocaleContextHolder.getLocale())});
                        }
                    }

                    salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
                    SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO = new SalesOpptProcessMgmtFinishVO();
                    salesOpptProcessMgmtFinishVO.setSeq(salesOpptProcessMgmtVO.getSeq());
                    salesOpptProcessMgmtFinishService.mergeSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);

                }
            }

            if (StringUtils.isNotBlank(showRoomNo)) {
                // 떠난 시간에 따라 업데이트 판단
                SalesOpptShowRoomMgmtSearchVO salesOpptShowRoomMgmtSearchVO = new SalesOpptShowRoomMgmtSearchVO();
                salesOpptShowRoomMgmtSearchVO.setsSeq(showRoomNo);

                int salesOpptShowRoomCount = salesOpptShowRoomMgmtService.selectSalesOpptShowRoomMgmtsByConditionCnt(salesOpptShowRoomMgmtSearchVO);

                if (salesOpptShowRoomCount > 0) {
                    List<SalesOpptShowRoomMgmtVO> resultList = new ArrayList<SalesOpptShowRoomMgmtVO>();
                    resultList = salesOpptShowRoomMgmtService.selectSalesOpptShowRoomMgmtsByCondition(salesOpptShowRoomMgmtSearchVO);
                    Date vsitEndDt = resultList.get(0).getVsitEndDt();

                    if (vsitEndDt == null){
                        salesOpptShowRoomMgmtVO.setSeq(showRoomNo);
                        salesOpptShowRoomMgmtService.updateSalesOpptShowRoomMgmt(salesOpptShowRoomMgmtVO);
                    }
                }
            }

            /*
             *  STEP02인 경우 처리 할 내용
             *  (주의) selectStep02NextSalesOpptProcessPopup.jsp 에서만 명시적으로 전달함.
             *  당직업무 사용하는 딜러의 경우 해당 당직자에게 자동으로 배정 업데이트
             */
            SalesOnDutyMgmtSearchVO salesOnDutyMgmtSearchVO = new SalesOnDutyMgmtSearchVO();
            salesOnDutyMgmtSearchVO.setsDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
            salesOnDutyMgmtSearchVO.setsOndutyUsrId(mngScId);
            salesOnDutyMgmtSearchVO.setsVsitResvDt(vsitResvDt);
            salesOnDutyMgmtSearchVO.setsVsitResvDtFrom(vsitResvDt);
            salesOnDutyMgmtSearchVO.setsVsitResvDtTo(vsitResvDt);

            SalesOnDutyMgmtVO salesOnDutyMgmtVO = new SalesOnDutyMgmtVO();
            salesOnDutyMgmtVO.setDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
            salesOnDutyMgmtVO.setVsitResvDt(vsitResvDt);
            salesOnDutyMgmtVO.setOndutyUsrId(mngScId);

            if (StringUtils.isNotBlank(onDutyYn)){

                /******************************************
                 *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
                 ******************************************/
                Calendar startCal = Calendar.getInstance();

                if(salesOnDutyMgmtSearchVO.getsVsitResvDt() != null){
                    int year;
                    int month;
                    int day;

                    startCal.setTime(salesOnDutyMgmtSearchVO.getsVsitResvDt());
                    year = startCal.get(Calendar.YEAR);
                    month = startCal.get(Calendar.MONTH);
                    day = startCal.get(Calendar.DATE);
                    startCal.set(year, month, day, 00, 00, 00);
                    salesOnDutyMgmtSearchVO.setsVsitResvDtFrom(startCal.getTime());

                    startCal.set(year, month, day+1, 00, 00, 00);
                    salesOnDutyMgmtSearchVO.setsVsitResvDtTo(startCal.getTime());

                }

                /******************************************
                 *** 날짜 검색 조건 종료 ***********************
                 ******************************************/

                // 담당자 자동 배정 (당직자 기준)
                /*
                if ("Y".equals(onDutyYn)) {

                    salesOnDutyMgmtSearchVO.setsOndutyTp("01");
                    scCheck = salesOnDutyMgmtService.selectSalesOnDutyMgmtByConditionCnt(salesOnDutyMgmtSearchVO);

                    List<SalesOnDutyMgmtVO>  salesOnDutyResult = new ArrayList<SalesOnDutyMgmtVO>();
                    if (scCheck > 0){
                        salesOnDutyResult = salesOnDutyMgmtService.selectSalesOnDutyMgmtByCondition(salesOnDutyMgmtSearchVO);
                        salesOnDutyMgmtVO.setSeq(salesOnDutyResult.get(0).getSeq());
                        salesOnDutyMgmtVO.setOndutyTp("01");

                        salesOnDutyMgmtService.updateSalesOnDutyCountMgmt(salesOnDutyMgmtVO);
                    } else {

                        salesOnDutyMgmtVO.setOndutyTp("01");
                        salesOnDutyMgmtVO.setCnt(1);
                        salesOnDutyMgmtService.insertSalesOpptScAssignMgmt(salesOnDutyMgmtVO);
                    }

                } else {
                    salesOnDutyMgmtSearchVO.setsOndutyTp("02");

                    scCheck = salesOnDutyMgmtService.selectSalesOnDutyMgmtByConditionCnt(salesOnDutyMgmtSearchVO);

                    if (scCheck > 0 ) {
                        salesOnDutyMgmtVO.setOndutyTp("02");
                        salesOnDutyMgmtService.updateSalesOnDutyCountMgmt(salesOnDutyMgmtVO);
                    } else {
                        salesOnDutyMgmtVO.setOndutyTp("02");
                        salesOnDutyMgmtVO.setCnt(1);
                        salesOnDutyMgmtService.insertSalesOpptScAssignMgmt(salesOnDutyMgmtVO);
                    }
                }
                */
            }

            // 5. 알람서비스 처리
            // . 방문 예약을 하면 담당자에게 알림을 한다.
            if (("02".equals(beforeLeadStatCd) && "03".equals(leadStatCd))) {
                // 2단계에서 3단계로 갈때 유효성 확인 한다.
                if ( StringUtils.isBlank(validGradeCd) ) {
                    throw processException("crm.info.validCheckRequired");
                }
                pushSignAlarms(saveVO.getSalesOpptProcessMgmtVO().getCustNm(), mngScId, "", saveVO.getSalesOpptProcessMgmtVO().getVsitResvDt());
                
                //update by yonyou-sunzhiqiang 2018-01-30 线索邀约，提交至预约清单待办提醒start;
				try {

					String todoMsg = "";
				
					TodoInfoVO todoInfoVO = new TodoInfoVO();
					todoMsg = messageSource.getMessage("crm.info.invitationListTodo" , new String[]{saveVO.getSalesOpptProcessMgmtVO().getCustNm()} , Locale.CHINA );
				
					todoInfoVO.setTodoPolicyId("TD-P-20003");
					todoInfoVO.setTodoDesc(todoMsg);
					todoInfoVO.setActionParams("custNo="+custNo+"&leadStatCd="+leadStatCd);
					todoInfoVO.setRegUsrId("SYSTEM");
//    					todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(repairOrderVO.getSaId()));
					todoInfoService.insertTodoInfo(todoInfoVO);
				} catch(Exception e){
					throw new BizException(e.getMessage());
				}
    			//update by yonyou-sunzhiqiang 2018-01-30 线索邀约，提交至预约清单待办提醒 end;
            }
          //update by yonyou-sunzhiqiang 2018-01-30 线索导入，未分配线索待办提醒（没有分配负责人）start;
			//判断线索状态是否为“线索导入”并且未分配负责人;
			if ("01".equals(leadStatCd) && (StringUtils.isBlank(mngScId)) ) {
				try {

					String todoMsg = "";
				
					TodoInfoVO todoInfoVO = new TodoInfoVO();
					todoMsg = messageSource.getMessage("crm.info.opptToBeAssignTodo" , new String[]{saveVO.getSalesOpptProcessMgmtVO().getCustNm()} , Locale.CHINA );
				
					todoInfoVO.setTodoPolicyId("TD-P-20001");
					todoInfoVO.setTodoDesc(todoMsg);
					todoInfoVO.setActionParams("custNo="+custNo+"&leadStatCd="+leadStatCd);
					todoInfoVO.setRegUsrId("SYSTEM");
//					todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(repairOrderVO.getSaId()));
					todoInfoService.insertTodoInfo(todoInfoVO);
				} catch(Exception e){
					throw new BizException(e.getMessage());
				}
            }
			//update by yonyou-sunzhiqiang 2018-01-30 线索导入，未分配线索待办提醒（没有分配负责人）end;

            // 추적추진(04)에서 전출(08) 일때 todo에 추가. (전출 의미 : '책임자'를 바꿔라)
            if (("08".equals(leadStatCd)) && ("04".equals(beforeLeadStatCd))) {
                insertSalesOpptProcessFailTodo(saveVO.getSalesOpptProcessMgmtVO().getCustNm(),saveVO.getSalesOpptProcessMgmtVO().getCustNo(),saveVO.getSalesOpptProcessMgmtVO().getLeadStatCd());
            }

            if (("09".equals(leadStatCd)) && ("02".equals(beforeLeadStatCd) || "04".equals(beforeLeadStatCd) )) {
                insertSalesOpptProcessFailTodo(saveVO.getSalesOpptProcessMgmtVO().getCustNm(),saveVO.getSalesOpptProcessMgmtVO().getCustNo(),saveVO.getSalesOpptProcessMgmtVO().getLeadStatCd());
            }
            
            //liuxueying add 战败，并且属于蓝斌下发/预约试驾活动的线索，增加向FMS传输转介绍接口信息   start
            if ("09".equals(leadStatCd) && !"09".equals(beforeLeadStatCd) && null != saveVO.getSalesOpptProcessMgmtVO().getHoldDetlTpSeq()){
            	List<SalesOpptHoldTypeMgmtVO > list = salesOpptHoldTypeMgmtDAO.selectSalesOpptForBM(saveVO.getSalesOpptProcessMgmtVO().getHoldDetlTpSeq());
            	SalesOpptProcessMgmtVO tempvo = new SalesOpptProcessMgmtVO();
            	tempvo.setDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
            	tempvo.setHpNo(saveVO.getSalesOpptProcessMgmtVO().getHpNo());
            	tempvo.setSeq(saveVO.getSalesOpptProcessMgmtVO().getSeq());
            	if(list != null && list.size() > 0){
            		tempvo.setRemark("BM推荐购车");
            		salesOpptProcessMgmtDAO.insertCustomerFailNoticeToFms(tempvo);
            	}else{
            		List<SalesOpptHoldTypeMgmtVO > tdlist = salesOpptHoldTypeMgmtDAO.selectSalesOpptForBMTD(saveVO.getSalesOpptProcessMgmtVO().getHoldDetlTpSeq());
            		if(tdlist != null && tdlist.size() > 0){
            			tempvo.setRemark("bluemembers网站试驾");
            			salesOpptProcessMgmtDAO.insertCustomerFailNoticeToFms(tempvo);
            		}
            	}
            }
            //liuxueying add 战败，并且属于蓝斌下发/预约试驾活动的线索，增加向FMS传输转介绍接口信息   end
            
            //liuxueying add 其他状态到跟踪促成，并且属于蓝斌试驾的线索，增加向FMS传输转介绍接口信息  start
            if ("04".equals(leadStatCd) && !"04".equals(beforeLeadStatCd) && null != saveVO.getSalesOpptProcessMgmtVO().getHoldDetlTpSeq()){
            	List<SalesOpptHoldTypeMgmtVO > list = salesOpptHoldTypeMgmtDAO.selectSalesOpptForBM(saveVO.getSalesOpptProcessMgmtVO().getHoldDetlTpSeq());
            	int count = salesOpptProcessMgmtDAO.selectSucByConditionCnt(salesOpptProcNo);
            	
            	if(count <= 0){//第一次跟踪促成
            		SalesOpptProcessMgmtVO tempvo = new SalesOpptProcessMgmtVO();
            		tempvo.setDlrCd(saveVO.getSalesOpptProcessMgmtVO().getDlrCd());
            		tempvo.setHpNo(saveVO.getSalesOpptProcessMgmtVO().getHpNo());
            		tempvo.setSeq(saveVO.getSalesOpptProcessMgmtVO().getSeq());
	            	if(list != null && list.size() > 0){
	            		tempvo.setRemark("BM推荐购车");
	            		salesOpptProcessMgmtDAO.insertCustomerSuccessNoticeToFms(tempvo);
	            	}else{
	            		List<SalesOpptHoldTypeMgmtVO > tdlist = salesOpptHoldTypeMgmtDAO.selectSalesOpptForBMTD(saveVO.getSalesOpptProcessMgmtVO().getHoldDetlTpSeq());
	            		if(tdlist != null && tdlist.size() > 0){
	            			tempvo.setRemark("bluemembers网站试驾");
	            			salesOpptProcessMgmtDAO.insertCustomerSuccessNoticeToFms(tempvo);
	            		}
	            	}
            	}
            }
            //liuxueying add 跟踪促成，并且属于蓝斌试驾的线索，增加向FMS传输转介绍接口信息   end
            

            return salesOpptProcNo;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /**
     * TODO를 등록한다.
     */
    public void insertSalesOpptProcessFailTodo(String custNm, String custNo, String leadStatCd) throws Exception {
        try {

                CustomerInfoSearchVO  searchVO = new CustomerInfoSearchVO ();
                if (StringUtils.isBlank(custNm) && StringUtils.isNotBlank(custNo)) {
                    searchVO.setsCustNo(custNo);
                    CustomerInfoVO customerInfoVO = customerInfoService.selectCustomerInfoByKey(searchVO);
                    custNm = customerInfoVO.getCustNm();
                }
                List<UserVO> lists = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10141", null, Constants.PERMISSION_SEARCHALL, null);
                if (lists !=null && lists.size() > 0) {

                    String todoMsg = messageSource.getMessage("crm.info.failSubmitTodo" , new String[]{custNm} , Locale.CHINA );
                    TodoInfoVO todoInfoVO = new TodoInfoVO();

                    if ( "08".equals(leadStatCd) ) {
                        todoInfoVO.setTodoPolicyId("TD-P-00004");   // 판매기회 전출 시 TO-DO
                    } else if ( "09".equals(leadStatCd) ) {
                        todoMsg = messageSource.getMessage("crm.info.fail09SubmitTodo" , new String[]{custNm} , Locale.CHINA );
                        todoInfoVO.setTodoPolicyId("TD-P-01014");   // 판매기회 전패 시 TO-DO
                    }

                    todoInfoVO.setTodoDesc(todoMsg);
                    todoInfoVO.setActionParams("custNo="+custNo+"&leadStatCd="+leadStatCd);
                    todoInfoVO.setRegUsrId(LoginUtil.getUserId());

                    for (int i=0; i <lists.size() ; i++) {
                        todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(lists.get(i).getUsrId()));
                    }

                    todoInfoService.insertTodoInfo(todoInfoVO);
                }

        } catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /**
     * 알람을 보낸다.
     */
    public void pushSignAlarms(String custNm, String mngScId, String mngScNm, Date vsitResvDt) throws Exception {

        try {
            List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
            NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
            targetVO.setUsrId(mngScId);
            targetVO.setUsrNm(mngScNm);
            targetUsers.add(targetVO);
            targetVO.setMesgTmplTpList("W,P");//여러개일 경우 구분자를 , 로 입력.

            String sysCd = Constants.SYS_CD_DLR;
            String alrtPolicyGrpId = "CRM-02-001";
            String dlrCd = LoginUtil.getDlrCd();
            NotificationMessageContext context = new NotificationMessageContext();
            context.getVelocityContext().put("custNm", custNm);
            context.getVelocityContext().put("visitResvDt", DateUtil.convertToString(vsitResvDt, systemConfigInfoService.selectStrValueByKey("dateFormat")+" "+"HH:mm"));

            notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
        } catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsHistByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistSearchVO)
     */
    @Override
    public int selectSalesOpptProcessMgmtsHistByConditionCnt(SalesOpptProcessMgmtHistSearchVO searchVO)
            throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsHistByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsHistByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistSearchVO)
     */
    @Override
    public List<SalesOpptProcessMgmtHistVO> selectSalesOpptProcessMgmtsHistByCondition(
            SalesOpptProcessMgmtHistSearchVO searchVO) throws Exception {
        try {
            if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}

            List<SalesOpptProcessMgmtHistVO> salesOpptProcessMgmtHistList = salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsHistByCondition(searchVO);

            String sysMesgCont = "";
            String leadStatCont = "";

            for (SalesOpptProcessMgmtHistVO salesOpptProcessMgmtHistVO : salesOpptProcessMgmtHistList) {
                sysMesgCont = messageSource.getMessage("crm.info.yyyymmdd" , new String[]{ DateUtil.convertToString(salesOpptProcessMgmtHistVO.getRegDt(), "yyyy"), DateUtil.convertToString(salesOpptProcessMgmtHistVO.getRegDt(), "MM"), DateUtil.convertToString(salesOpptProcessMgmtHistVO.getRegDt(), "dd") } , Locale.CHINA );

                if ( StringUtils.isNotBlank(salesOpptProcessMgmtHistVO.getLeadStatCd()) && salesOpptProcessMgmtHistVO.getLeadStatCd().equals(salesOpptProcessMgmtHistVO.getBefLeadStatCd()) ) {
                    leadStatCont = salesOpptProcessMgmtHistVO.getLeadStatNm();

                } else {
                    leadStatCont = salesOpptProcessMgmtHistVO.getBefLeadStatNm();
                    leadStatCont += " -> ";
                    leadStatCont += salesOpptProcessMgmtHistVO.getLeadStatNm();
                    sysMesgCont += ", ";
                    sysMesgCont += messageSource.getMessage("crm.info.fromChange" , new String[]{ salesOpptProcessMgmtHistVO.getBefLeadStatNm() } , Locale.CHINA );  // {0}에서 전출

                }

                if ("SYSTEM".equals(salesOpptProcessMgmtHistVO.getRegUsrId()) ) {
                    sysMesgCont += ", ";
                    sysMesgCont += messageSource.getMessage("crm.info.systemCompulsion", null, Locale.CHINA); // 시스템에서 강제적용
                } else {
                    String mngScId = "";
                    String befMngScId = "";
                    if (StringUtils.isNotBlank(salesOpptProcessMgmtHistVO.getMngScId())) {
                        mngScId = salesOpptProcessMgmtHistVO.getMngScId();
                    }

                    if (StringUtils.isNotBlank(salesOpptProcessMgmtHistVO.getBefMngScId())) {
                        befMngScId = salesOpptProcessMgmtHistVO.getBefMngScId();
                    }
                    if (!(mngScId.equals(befMngScId))){
                        sysMesgCont += ", ";
                        sysMesgCont += messageSource.getMessage("crm.info.idAssign", null, Locale.CHINA);   // 담당자변경
                    }
                }

                if (StringUtils.isNotBlank(salesOpptProcessMgmtHistVO.getFailCauCd())) {
                    sysMesgCont += "<br>";
                    sysMesgCont += messageSource.getMessage("crm.lbl.failedReason", null, Locale.CHINA) + " : " +salesOpptProcessMgmtHistVO.getFailCauCdNm();
                }
                if (StringUtils.isNotBlank(salesOpptProcessMgmtHistVO.getOtherBrandCdNm())) {
                    sysMesgCont += "<br>";
                    sysMesgCont += messageSource.getMessage("crm.lbl.otherBrand", null, Locale.CHINA) + " : " +salesOpptProcessMgmtHistVO.getOtherBrandCdNm();
                }
                if (StringUtils.isNotBlank(salesOpptProcessMgmtHistVO.getFailCauReasonCont())) {
                    sysMesgCont += "<br>";
                    sysMesgCont += messageSource.getMessage("crm.lbl.failReasonAly", null, Locale.CHINA) + " : " +salesOpptProcessMgmtHistVO.getFailCauReasonCont();

                }

                salesOpptProcessMgmtHistVO.setLeadStatCont(leadStatCont);
                salesOpptProcessMgmtHistVO.setSysMesgCont(sysMesgCont);

            }

            return salesOpptProcessMgmtHistList;

//            return salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsHistByCondition(searchVO);

        } catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#insertSalesOpptProcessMgmtHist(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistVO)
     */
    @Override
    public int insertSalesOpptProcessMgmtHist(SalesOpptProcessMgmtHistVO salesOpptProcessMgmtHistVO) throws Exception {

        try {

            if (StringUtils.isBlank(salesOpptProcessMgmtHistVO.getDlrCd())){salesOpptProcessMgmtHistVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isBlank(salesOpptProcessMgmtHistVO.getRegUsrId())) {salesOpptProcessMgmtHistVO.setRegUsrId(LoginUtil.getUserId());}

            // 기본값 셋팅
            if (StringUtils.isBlank(salesOpptProcessMgmtHistVO.getSaleOpptSeq())) {

            }

            return salesOpptProcessMgmtDAO.insertSalesOpptProcessMgmtHist(salesOpptProcessMgmtHistVO);

        } catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    // 회전기록 이력 추가.
    public int insertPreSalesOpptProcessMgmtHist(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO, String beforeLeadStatCd, String beforeMngScId) throws Exception {
        try {

            int rltCnt = 0;
            /*
             *  판매기회 이력 등록
             *  상태 또는 담당자가 변경 되었을때만 이력을 남긴다.
             */
            if ( !(beforeLeadStatCd.equals(salesOpptProcessMgmtVO.getLeadStatCd()))
                    || !(salesOpptProcessMgmtVO.getMngScId().equals(beforeMngScId)) ) {
                // || !(beforeMngScId.equals(salesOpptProcessMgmtVO.getMngScId())) ) {

                SalesOpptProcessMgmtHistVO salesOpptProcessMgmtHistVO = new SalesOpptProcessMgmtHistVO();

                String sysMesgCont = "";
                String leadStatCont = "";
                String leadStatChange = "";
                String sysDateY = DateUtil.getDate("yyyy");
                String sysDateM = DateUtil.getDate("MM");
                String sysDateD = DateUtil.getDate("dd");

                sysMesgCont = messageSource.getMessage("crm.info.yyyymmdd" , new String[]{ sysDateY, sysDateM, sysDateD} , Locale.CHINA );

                leadStatCont = commonCodeService.selectCommonCodeName("CRM375", beforeLeadStatCd, "zh");

                if (!(beforeLeadStatCd.equals(salesOpptProcessMgmtVO.getLeadStatCd()))){
                    leadStatChange = messageSource.getMessage("crm.info.fromChange" , new String[]{ leadStatCont } , Locale.CHINA );
                    sysMesgCont = sysMesgCont + leadStatChange;
                }

                leadStatCont += " --> ";
                leadStatCont += commonCodeService.selectCommonCodeName("CRM375", salesOpptProcessMgmtVO.getLeadStatCd(), "zh");

                if ("SYSTEM".equals(salesOpptProcessMgmtVO.getUpdtUsrId()) ) {
                    if (StringUtils.isNotBlank(leadStatChange)) {
                        sysMesgCont += " , ";
                    }
                    sysMesgCont += messageSource.getMessage("crm.info.systemCompulsion", null, Locale.CHINA);
                } else {
                    //if (!(beforeMngScId.equals(salesOpptProcessMgmtVO.getMngScId()))){
                    if (!(salesOpptProcessMgmtVO.getMngScId().equals(beforeMngScId))){
                        if (StringUtils.isNotBlank(leadStatChange)) {
                            sysMesgCont += " , ";
                        }
                        sysMesgCont += messageSource.getMessage("crm.info.idAssign", null, Locale.CHINA);
                    }
                }

                salesOpptProcessMgmtHistVO.setDlrCd(salesOpptProcessMgmtVO.getDlrCd());
                salesOpptProcessMgmtHistVO.setSaleOpptSeq(salesOpptProcessMgmtVO.getSeq());
                salesOpptProcessMgmtHistVO.setMngScId(salesOpptProcessMgmtVO.getMngScId());
                salesOpptProcessMgmtHistVO.setRegUsrId(LoginUtil.getUserId());
                salesOpptProcessMgmtHistVO.setUpdtUsrId(LoginUtil.getUserId());
                salesOpptProcessMgmtHistVO.setLeadStatCont(leadStatCont);
                salesOpptProcessMgmtHistVO.setSysMesgCont(sysMesgCont);
                salesOpptProcessMgmtHistVO.setBefLeadStatCd(beforeLeadStatCd);
                salesOpptProcessMgmtHistVO.setLeadStatCd(salesOpptProcessMgmtVO.getLeadStatCd());
                salesOpptProcessMgmtHistVO.setBefMngScId(beforeMngScId);
                salesOpptProcessMgmtHistVO.setFailCauCd(salesOpptProcessMgmtVO.getFailCauCd());
                salesOpptProcessMgmtHistVO.setOtherBrandCd(salesOpptProcessMgmtVO.getOtherBrandCd());
                salesOpptProcessMgmtHistVO.setFailCauReasonCont(salesOpptProcessMgmtVO.getFailCauReasonCont());

                rltCnt = insertSalesOpptProcessMgmtHist(salesOpptProcessMgmtHistVO);
            }

            return rltCnt;

        } catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * Excel Upload를 위한 Method 시작
     */
    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptDmsOriDup(java.util.List)
     */
    public String selectSalesOpptDmsOriDup(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception {

        /**
        *   1. '고객여부'를 확인 ( 개인 : 핸드폰 번호, 법인 : 대표번호)
        *    1-1) 없는 경우 고객 생성
        *   2. 중복 '판매기회'를 확인 (고객번호로 확인)
        *    2-1) '판매기회'있음.
        *      2-1-1) 실패 상태인 경우 ('01'~'05'가 아닌 경우)
        *        2-1-1-1) '판매기회' 업데이트 (상태:01, 데이터 업데이트)
        *        2-1-1-2) 고객정보 업데이트
        *      2-1-2) 진행중인 경우
        *        2-1-2-1) '중복이력'에 추가.
        *    2-2) '판매기회' 없음.
        *      2-2-1) 캠페인시퀀스가 있는지 확인
        *      2-2-2) '판매기회' 생성
        */

        try {
            String dataChk = "";
            String currSalesOpptSeq = ""; // 현재 판매기회 seq
            String custNo = ""; // 고객번호
            Boolean custDupChk = false;
            String custHoldTp = "";
            int custCnt = 0;
            Boolean continued = true;

            salesOpptProcessMgmtVO.setRelCustNm(salesOpptProcessMgmtVO.getPurcMngNm());
            salesOpptProcessMgmtVO.setRelCustHpNo(salesOpptProcessMgmtVO.getHpNo());

            CustomerInfoVO customerInfoVO = new CustomerInfoVO();
            CustomerInfoSearchVO customerInfoSearchVO = new CustomerInfoSearchVO();

            // 정규식 체크 - 시작
            // 이동전화
            String regExpRlt = "";
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getHpNo())){
                regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(salesOpptProcessMgmtVO.getHpNo());
                if ("FALSE".equals(regExpRlt)){
                    //throw processException("crm.info.regExpHpNo"); // 이동전화 번호가 규칙에 맞지 않습니다.
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("crm.info.regExpHpNo", null, Locale.CHINA);
                    dataChk += "</div>";
                    continued = false;
                }
            }

            // emailNm
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getEmailNm())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByEmail(salesOpptProcessMgmtVO.getEmailNm());
                if ("FALSE".equals(regExpRlt)){
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("crm.info.regExpEmail", null, Locale.CHINA);
                    dataChk += "</div>";
                    continued = false;
                }
            }

            // telNo
//            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getTelNo())) {
//                regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(salesOpptProcessMgmtVO.getTelNo());
//                if ("FALSE".equals(regExpRlt)){
//                    dataChk += "<div>";
//                    dataChk += messageSource.getMessage("crm.info.regExpTelNo", null, Locale.CHINA);  // 전화번호가 규칙에 맞지 않습니다.
//                    dataChk += "</div>";
//                    continued = false;
//                }
//            }

            // officeTelNo
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getOfficeTelNo())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(salesOpptProcessMgmtVO.getOfficeTelNo());
                if ("FALSE".equals(regExpRlt)){
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("crm.info.regExpTelNo", null, Locale.CHINA);  // 전화번호가 규칙에 맞지 않습니다.
                    dataChk += "</div>";
                    continued = false;
                }
            }
            // ssnCrnNo
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getSsnCrnNo())) {
                if("01".equals(salesOpptProcessMgmtVO.getMathDocTp())) {
                    if (salesOpptProcessMgmtVO.getSsnCrnNo().length() == 15) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo15Digit(salesOpptProcessMgmtVO.getSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            dataChk += "<div>";
                            //dataChk += messageSource.getMessage("crm.info.regExpRegiNo", null, Locale.CHINA);  // 신분증이 규칙에 맞지 않습니다.
                            dataChk += messageSource.getMessage("crm.info.regExpSsnCrnNo", null, Locale.CHINA);  // 증거번호 규칙에 맞지 않습니다.
                            dataChk += "</div>";
                            continued = false;
                        }

                    } else if (salesOpptProcessMgmtVO.getSsnCrnNo().length() == 18) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo18Digit(salesOpptProcessMgmtVO.getSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            dataChk += "<div>";
                            //dataChk += messageSource.getMessage("crm.info.regExpRegiNo", null, Locale.CHINA);  // 신분증이 규칙에 맞지 않습니다.
                            dataChk += messageSource.getMessage("crm.info.regExpSsnCrnNo", null, Locale.CHINA);  // 증거번호 규칙에 맞지 않습니다.
                            dataChk += "</div>";
                            continued = false;
                        }
                    } else {
                        dataChk += "<div>";
                        //dataChk += messageSource.getMessage("crm.info.regExpRegiNo", null, Locale.CHINA);  // 신분증이 규칙에 맞지 않습니다.
                        dataChk += messageSource.getMessage("crm.info.regExpSsnCrnNo", null, Locale.CHINA);  // 증거번호 규칙에 맞지 않습니다.
                        dataChk += "</div>";
                        continued = false;
                    }
                } else if("08".equals(salesOpptProcessMgmtVO.getMathDocTp())) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByCorpNo(salesOpptProcessMgmtVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        dataChk += "<div>";
                        //dataChk += messageSource.getMessage("crm.info.regExpCorpNo", null, Locale.CHINA);  // 법인번호가 규칙에 맞지 않습니다.
                        dataChk += messageSource.getMessage("crm.info.regExpSsnCrnNo", null, Locale.CHINA);  // 증거번호 규칙에 맞지 않습니다.
                        dataChk += "</div>";
                        continued = false;
                    }
                }
            }

            // 정규식 체크 - 끝

            // 시장활동인 경우 캠페인 등록번호의 휴요성 체크
//            if ("03".equals(salesOpptProcessMgmtVO.getHoldTp())) {
//               캠페인의 유효성 확인
//                salesOpptHoldTypeMgmtSearchVO.setsRemark(salesOpptProcessMgmtVO.getMakCd());
//
//                Calendar startCal = Calendar.getInstance();
//                Calendar endCal = Calendar.getInstance();
//
//                salesOpptHoldTypeMgmtSearchVO.setsStartDt(startCal.getTime());
//                salesOpptHoldTypeMgmtSearchVO.setsEndDt(startCal.getTime());
//
//                int year;
//                int month;
//                int day;
//
//                // 시작일
//                startCal.setTime(salesOpptHoldTypeMgmtSearchVO.getsStartDt());
//                year = startCal.get(Calendar.YEAR);
//                month = startCal.get(Calendar.MONTH);
//                day = startCal.get(Calendar.DATE);
//                startCal.set(year, month, day, 00, 00, 00);
//                salesOpptHoldTypeMgmtSearchVO.setsStartDt(startCal.getTime());
//
//                // 종료일
//                endCal.setTime(salesOpptHoldTypeMgmtSearchVO.getsEndDt());
//                year = endCal.get(Calendar.YEAR);
//                month = endCal.get(Calendar.MONTH);
//                day = endCal.get(Calendar.DATE);
//                endCal.set(year, month, day, 23, 59, 59);
//                salesOpptHoldTypeMgmtSearchVO.setsEndDt(endCal.getTime());
//
//                holdDtlSeqCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);

//                if (holdDtlSeqCnt == 0) {
//                    dataChk += "<div>";
//                    dataChk += messageSource.getMessage("crm.lbl.unableCampaign", null, Locale.CHINA);  // 유효하지 않은 캠페인 입니다.
//                    dataChk += "</div>";
//                    continued = false;
//                }
//            }

            if (!continued) {
                return dataChk;
            }

            // 1. '고객여부'를 확인 ( 개인 : 핸드폰 번호, 법인 : 대표번호)
            customerInfoSearchVO.setsDlrCd(salesOpptProcessMgmtVO.getDlrCd());
            customerInfoSearchVO.setsCustTp(salesOpptProcessMgmtVO.getCustTp());
            customerInfoSearchVO.setsHpNo(salesOpptProcessMgmtVO.getHpNo());
            customerInfoSearchVO.setsOfficeTelNo(salesOpptProcessMgmtVO.getOfficeTelNo());
            if(customerInfoSearchVO.getsCustCd()==null){
                customerInfoSearchVO.setsCustCd(salesOpptProcessMgmtVO.getCustCd());
            }

            if (StringUtils.isBlank(customerInfoSearchVO.getsCustCd())) {
                customerInfoSearchVO.setsCustCd("01");
                salesOpptProcessMgmtVO.setCustCd("01");
            }

            // 핸드폰 또는 회사번호 (중복)
            //custCnt = customerInfoService.selectCustDupByKeyCnt(customerInfoSearchVO);
            custCnt = customerInfoOutBoundService.selectCustDupByKeyCnt(customerInfoSearchVO);

            if (custCnt > 0) {
                customerInfoVO = customerInfoOutBoundService.selectCustDupByKey(customerInfoSearchVO);
                custNo = customerInfoVO.getCustNo();
            } else {
                custDupChk = true;
            }

            if (custDupChk) {
                // 1-1) 없는 경우 고객 생성
                customerInfoVO = new CustomerInfoVO();
                customerInfoVO.setDlrCd(salesOpptProcessMgmtVO.getDlrCd());
                customerInfoVO.setCustNm(salesOpptProcessMgmtVO.getCustNm());
                customerInfoVO.setCustTp(salesOpptProcessMgmtVO.getCustTp());
                customerInfoVO.setHpNo(salesOpptProcessMgmtVO.getHpNo());
                customerInfoVO.setPrefCommMthCd("01");
                customerInfoVO.setPrefCommNo(salesOpptProcessMgmtVO.getHpNo());
                customerInfoVO.setWechatId(salesOpptProcessMgmtVO.getWechatId());
                customerInfoVO.setEmailNm(salesOpptProcessMgmtVO.getEmailNm());
                customerInfoVO.setSexCd(salesOpptProcessMgmtVO.getSexCd());
                customerInfoVO.setMathDocTp(salesOpptProcessMgmtVO.getMathDocTp());
                customerInfoVO.setSsnCrnNo(salesOpptProcessMgmtVO.getSsnCrnNo());
                customerInfoVO.setPurcMngNm(salesOpptProcessMgmtVO.getPurcMngNm());
                customerInfoVO.setOfficeTelNo(salesOpptProcessMgmtVO.getOfficeTelNo());
                customerInfoVO.setTelNo(salesOpptProcessMgmtVO.getOfficeTelNo());
                customerInfoVO.setMngScId(salesOpptProcessMgmtVO.getMngScId());
                customerInfoVO.setMngScIdIsNull("N");
                customerInfoVO.setCustCollSrcCd("01");  // CRM042 고객수집경로 기본 '01' 판매

                //customerInfoVO.setCustCd(salesOpptProcessMgmtVO.getCustCd());

                CommonCodeVO commonCodeVO = new CommonCodeVO();
                commonCodeVO = commonCodeService.selectCommonCodeByKey("CRM008", salesOpptProcessMgmtVO.getHoldTp());
                if (commonCodeVO == null) {
                    customerInfoVO.setCustHoldTp("14");  // etc.
                } else {
                    custHoldTp = commonCodeVO.getRemark1();
                    customerInfoVO.setCustHoldTp(custHoldTp);

                }

                // 증거유형 + 증거번호 ( 중복 )
                if (StringUtils.isNotBlank(customerInfoSearchVO.getsMathDocTp()) && StringUtils.isNotBlank(customerInfoSearchVO.getsSsnCrnNo()) ) {
                    customerInfoVO = customerInfoOutBoundService.selectCustMathDocDupByKey(customerInfoSearchVO);
                    if(customerInfoVO != null) {
                        dataChk += messageSource.getMessage("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA);  // 법인번호가 규칙에 맞지 않습니다.
                        continued = false;
                    }
                }

                if (!continued) {
                    return dataChk;
                }

                customerInfoVO = customerInfoService.insertCustomer(customerInfoVO);
                custNo = customerInfoVO.getCustNo();
            }

            // 2. 중복 '판매기회'를 확인 (고객번호로 확인)
            SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
            salesOpptProcessMgmtSearchVO.setsCustNo(custNo);

            int salesOpptProcCount = selectSalesOpptProcessMgmtsByConditionCnt(salesOpptProcessMgmtSearchVO);

            if (StringUtils.isBlank(salesOpptProcessMgmtVO.getMngScId())) {
                salesOpptProcessMgmtVO.setLeadStatCd("01");
            } else {
                salesOpptProcessMgmtVO.setLeadStatCd("02");
            }

            if (salesOpptProcCount > 0) { // 2-1) '판매기회'있음.

                // 2-1-1) '실패' 상태인 경우 ('01'~'06'가 아닌 경우 CRM375)
                salesOpptProcessMgmtSearchVO.setsLeadStatCd("check");
                currSalesOpptSeq = salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtContinueByCondition(salesOpptProcessMgmtSearchVO);

                if (currSalesOpptSeq != null) {
                    //   2-1-1-1) '판매기회' 업데이트 (상태:01, 데이터 업데이트)
                    salesOpptProcessMgmtVO.setSeq(currSalesOpptSeq);

                    // 실패 된 것을 살리기 때문에 데이터를 Reset 한다.
                    salesOpptProcessMgmtVO.setReSetYn("Y");

                    salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

                    //   2-1-1-2) 고객정보 업데이트
                    customerInfoVO.setCommandTp("LEADOPPTPROC");
                    customerInfoVO.setSexCd(salesOpptProcessMgmtVO.getSexCd());
                    customerInfoVO.setWechatId(salesOpptProcessMgmtVO.getWechatId());
                    customerInfoVO.setEmailNm(salesOpptProcessMgmtVO.getEmailNm());
                    customerInfoVO.setTelNo(salesOpptProcessMgmtVO.getTelNo());
                    //customerInfoVO.setMngScId(salesOpptProcessMgmtVO.getMngScId());
                    customerInfoVO.setPurcMngNm(salesOpptProcessMgmtVO.getPurcMngNm());
                    customerInfoVO.setCustNo(custNo);

                    customerInfoVO = customerInfoService.updateCustomer(customerInfoVO);

                    //dataChk = "U";
                    dataChk = messageSource.getMessage("global.info.update", null, Locale.CHINA);

                } else { // 2-1-2) 진행중인 경우
                    // 2-1-2-1) '중복이력'에 추가.
                    salesOpptProcessMgmtDAO.insertSalesOpptDup(salesOpptProcessMgmtVO);

                    //dataChk = "D";
                    dataChk = messageSource.getMessage("crm.info.duplicate", null, Locale.CHINA);

                }

            } else { // 2-2) '판매기회' 없음.
                // 2-2-1) 캠페인시퀀스가 있는지 확인 (화면에서 리드출처 필수로 체크함)

                //  2-2-1) '판매기회' 생성
                salesOpptProcessMgmtVO.setCustNo(custNo);
                salesOpptProcessMgmtVO.setLeadStatCd("01");
                salesOpptProcessMgmtVO.setDelYn("N");
                salesOpptProcessMgmtVO.setBhmcYn("N");
                //salesOpptProcessMgmtVO.setRvsitYn("N");
                if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getMakCd())) {
                    salesOpptProcessMgmtVO.setHoldDetlTpSeq(Integer.parseInt(salesOpptProcessMgmtVO.getMakCd()));  // 출처상세시퀀스
                }

                if ( StringUtils.isNotBlank(salesOpptProcessMgmtVO.getHoldTp()) && "03".equals(salesOpptProcessMgmtVO.getHoldTp()) ) {
                    if ( salesOpptProcessMgmtVO.getHoldDetlTpSeq() == null ) {
                        // 리드출처상세는 필수 입니다.
                        //throw processException("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.approchLocationDtl", null, LocaleContextHolder.getLocale())});
                    }
                }

                salesOpptProcessMgmtDAO.insertSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

                // 판매기회이력관리 추가.
                SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO = new SalesOpptProcessMgmtFinishVO();
                salesOpptProcessMgmtFinishVO.setSeq(salesOpptProcessMgmtVO.getSeq());
                salesOpptProcessMgmtFinishService.insertSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);
                salesOpptProcessMgmtVO.setcSeq(salesOpptProcessMgmtFinishVO.getcSeq());

                salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

                dataChk = messageSource.getMessage("global.info.new", null, Locale.CHINA);

            }

            return dataChk;
        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }

    }
    /*
     * Excel Upload를 위한 Method 끝
     */

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        SalesOpptProcessMgmtSearchVO searchVO = new SalesOpptProcessMgmtSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();
        int year;
        int month;
        int day;

        if ("01".equals((String)params.get("whichExcel"))) {
            if ( !"null".equals((String)params.get("sStartDt")) ) {
                searchVO.setsStartDt(DateUtil.convertToDate((String)params.get("sStartDt")));
            }

            if ( !"null".equals((String)params.get("sEndDt")) ) {
                searchVO.setsEndDt(DateUtil.convertToDate((String)params.get("sEndDt")));
            }

            if(searchVO.getsStartDt() != null || searchVO.getsEndDt() != null ){

                if(searchVO.getsStartDt() == searchVO.getsEndDt()){
                    // 시작일 = 종료일 동일한경우
                    startCal.setTime(searchVO.getsStartDt());
                    year = startCal.get(Calendar.YEAR);
                    month = startCal.get(Calendar.MONTH);
                    day = startCal.get(Calendar.DATE);
                    startCal.set(year, month, day+1, 00, 00, 00);
                    searchVO.setsStartDt(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
                }else if(searchVO.getsEndDt() != null){
                    // 종료일이 있는경우
                    endCal.setTime(searchVO.getsEndDt());
                    year = endCal.get(Calendar.YEAR);
                    month = endCal.get(Calendar.MONTH);
                    day = endCal.get(Calendar.DATE);
                    endCal.set(year, month, day+1, 00, 00, 00);
                    searchVO.setsEndDt(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
                }
            }
            List<SalesOpptProcessMgmtVO> list = selectLeadRepetitionByCondition(searchVO);
            if ( list.size() > 0 ) {
                context.putVar("items", list);
            }
        }else{

            if ( !"null".equals((String)params.get("sSubmitDtFrom")) ) {
                searchVO.setsSubmitDtFrom(DateUtil.convertToDate((String)params.get("sSubmitDtFrom")));
            }

            if ( !"null".equals((String)params.get("sSubmitDtTo")) ) {
                searchVO.setsSubmitDtTo( DateUtil.convertToDate((String)params.get("sSubmitDtTo")) );
            }

            if ( !"null".equals((String)params.get("sRegDtFrom")) ) {
                searchVO.setsRegDtFrom(DateUtil.convertToDate((String)params.get("sRegDtFrom")));
            }

            if ( !"null".equals((String)params.get("sRegDtTo")) ) {
                searchVO.setsRegDtTo(DateUtil.convertToDate((String)params.get("sRegDtTo")));
            }

            if(searchVO.getsRegDtFrom() != null || searchVO.getsRegDtTo() != null ){

                if(searchVO.getsRegDtFrom() == searchVO.getsRegDtTo()){
                    // 시작일 = 종료일 동일한경우
                    startCal.setTime(searchVO.getsRegDtFrom());
                    year = startCal.get(Calendar.YEAR);
                    month = startCal.get(Calendar.MONTH);
                    day = startCal.get(Calendar.DATE);
                    startCal.set(year, month, day+1, 00, 00, 00);
                    searchVO.setsRegDtFrom(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
                }else if(searchVO.getsRegDtTo() != null){
                    // 종료일이 있는경우
                    endCal.setTime(searchVO.getsRegDtTo());
                    year = endCal.get(Calendar.YEAR);
                    month = endCal.get(Calendar.MONTH);
                    day = endCal.get(Calendar.DATE);
                    endCal.set(year, month, day+1, 00, 00, 00);
                    searchVO.setsRegDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
                }
            }

            if(searchVO.getsSubmitDtFrom() != null || searchVO.getsSubmitDtTo() != null ){

                if(searchVO.getsSubmitDtFrom() == searchVO.getsSubmitDtTo()){
                    // 시작일 = 종료일 동일한경우
                    startCal.setTime(searchVO.getsSubmitDtFrom());
                    year = startCal.get(Calendar.YEAR);
                    month = startCal.get(Calendar.MONTH);
                    day = startCal.get(Calendar.DATE);
                    startCal.set(year, month, day+1, 00, 00, 00);
                    searchVO.setsSubmitDtFrom(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
                }else if(searchVO.getsSubmitDtTo() != null){
                    // 종료일이 있는경우
                    endCal.setTime(searchVO.getsSubmitDtTo());
                    year = endCal.get(Calendar.YEAR);
                    month = endCal.get(Calendar.MONTH);
                    day = endCal.get(Calendar.DATE);
                    endCal.set(year, month, day+1, 00, 00, 00);
                    searchVO.setsSubmitDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
                }
            }
            List<SalesOpptProcessMgmtVO> list = selectSalesOpptProcessMgmtsByCondition(searchVO);

            if ( list.size() > 0 ) {
                context.putVar("items", list);
            }
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#insertSalesOpptPorcessBatchUpload(java.util.List)
     */
    @Override
    public String insertSalesOpptPorcessBatchUpload(List<SalesOpptProcessMgmtVO> list) throws Exception {

        String rultMesg = "";
        String userId = LoginUtil.getUserId();
        String dataChk = "";  // U :Update, D:Duplicate, N:New
        int creatCnt = 0;
        int dupCnt = 0;
        int updateCnt = 0;

        for(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO : list){
            salesOpptProcessMgmtVO.setRegUsrId(userId);
            salesOpptProcessMgmtVO.setUpdtUsrId(userId);

            dataChk = selectSalesOpptDmsOriDup(salesOpptProcessMgmtVO);

            if ("U".equals(dataChk)) {
                updateCnt++;
            } else if("D".equals(dataChk)) {
                dupCnt++;
            } else if ("N".equals(dataChk)) {
                creatCnt++;
            }
        }

        rultMesg += messageSource.getMessage("global.info.new", null, Locale.CHINA);
        rultMesg += " : " + creatCnt + ", ";
        rultMesg += messageSource.getMessage("global.info.update", null, Locale.CHINA);
        rultMesg += " : " + updateCnt + ", ";
        rultMesg += messageSource.getMessage("crm.info.duplicate", null, Locale.CHINA);
        rultMesg += " : " + dupCnt;
        return rultMesg;

    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#insertSalesOpptPorcessBatchUploadRlt(java.util.List)
     */
    @Override
    public List<SalesOpptProcessMgmtVO> insertSalesOpptPorcessBatchUploadRlt(List<SalesOpptProcessMgmtVO> list)
            throws Exception {
        String userId = LoginUtil.getUserId();
        String dataChk = "";  // U :Update, D:Duplicate, N:New

//        List<SalesOpptProcessMgmtVO> rltList = new ArrayList<SalesOpptProcessMgmtVO>();
        List<ExcelUploadError> errors = null;
        for(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO : list){
            salesOpptProcessMgmtVO.setRegUsrId(userId);
            salesOpptProcessMgmtVO.setUpdtUsrId(userId);

            errors = new ArrayList<ExcelUploadError>();

            if( salesOpptProcessMgmtVO.getErrorCount() == 0) {
                dataChk = selectSalesOpptDmsOriDup(salesOpptProcessMgmtVO);
                errors.add(new ExcelUploadError(dataChk));
//                if ("U".equals(dataChk)) {
//                    errors.add(new ExcelUploadError(messageSource.getMessage("global.info.update", null, Locale.CHINA)));
//                } else if("D".equals(dataChk)) {
//                    errors.add(new ExcelUploadError(messageSource.getMessage("crm.info.duplicate", null, Locale.CHINA)));
//                } else if ("N".equals(dataChk)) {
//                    errors.add(new ExcelUploadError(messageSource.getMessage("global.info.new", null, Locale.CHINA)));
//                }
                salesOpptProcessMgmtVO.setErrors(errors);
            } else {
                errors.add(new ExcelUploadError(salesOpptProcessMgmtVO.getErrorsStr()));
                salesOpptProcessMgmtVO.setErrors(errors);
            }
            salesOpptProcessMgmtVO.setErrorCount(9999);
            //if( !StringUtil.isNullToString(salesOpptProcessMgmtVO.getDlrCd()).equals("")){            }
        }

        return list;
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptDupHistByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public int selectSalesOpptDupHistByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptProcessMgmtDAO.selectSalesOpptDupHistByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptDupHistByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public List<SalesOpptProcessMgmtVO> selectSalesOpptDupHistByCondition(SalesOpptProcessMgmtSearchVO searchVO)
            throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptProcessMgmtDAO.selectSalesOpptDupHistByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectLeadRepetitionByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public int selectLeadRepetitionByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptProcessMgmtDAO.selectLeadRepetitionByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectLeadRepetitionByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public List<SalesOpptProcessMgmtVO> selectLeadRepetitionByCondition(SalesOpptProcessMgmtSearchVO searchVO)
            throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptProcessMgmtDAO.selectLeadRepetitionByCondition(searchVO);
    }



    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#multiSalesOpptProcessToFail(chn.bhmc.dms.crm.ass.vo.SalesOpptProcessSaveVO)
     */
    @Override
    public void multiSalesOpptProcessToFail(SalesOpptProcessSaveVO saveVO) throws Exception {

        List<SalesOpptProcessMgmtVO> salesOpptProcessList = saveVO.getAssignList();

        for (SalesOpptProcessMgmtVO salesOpptProcessMgmtVO : salesOpptProcessList) {
            //insertPreSalesOpptProcessMgmtHist(salesOpptProcessMgmtVO, salesOpptProcessMgmtVO.getBefLeadStatCd(), salesOpptProcessMgmtVO.getBefMngScId());
            insertSalesOpptProcessFailTodo(salesOpptProcessMgmtVO.getCustNm(), salesOpptProcessMgmtVO.getCustNo(), salesOpptProcessMgmtVO.getLeadStatCd());
            salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptPorcessBatchUploadPreChk(java.util.List)
     */
    @Override
    public List<SalesOpptProcessMgmtVO> selectSalesOpptPorcessBatchUploadPreChk(List<SalesOpptProcessMgmtVO> list)
            throws Exception {
        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();
        String dataChk = "";  // U :Update, D:Duplicate, N:New

        List<ExcelUploadError> errors = null;
        for(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO : list){
            salesOpptProcessMgmtVO.setDlrCd(dlrCd);
            salesOpptProcessMgmtVO.setRegUsrId(userId);
            salesOpptProcessMgmtVO.setUpdtUsrId(userId);

            errors = new ArrayList<ExcelUploadError>();

            if( salesOpptProcessMgmtVO.getErrorCount() == 0) {
                dataChk = selectSalesOpptPorcessBatchUploadPreChkValid(salesOpptProcessMgmtVO);
                if (StringUtils.isNotBlank(dataChk)) {
                    errors.add(new ExcelUploadError(dataChk));
                    salesOpptProcessMgmtVO.setErrors(errors);
                }
            } else {

                for(int i=0; i < salesOpptProcessMgmtVO.getErrorCount(); i++) {
                    //errors.add(new ExcelUploadError(salesOpptProcessMgmtVO.getErrorsStr()));
                    errors.add(new ExcelUploadError(salesOpptProcessMgmtVO.getErrors().get(i).getErrorMessage()));
                }
                salesOpptProcessMgmtVO.setErrors(errors);
            }
            salesOpptProcessMgmtVO.setErrorCount(salesOpptProcessMgmtVO.getErrors().size());
        }

        return list;
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptPorcessBatchUploadPreChkValid(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO)
     * 엑셀 업로드시 코드에 대한 Validation check를 한다.
     * 값이 코드에 맞지 않은 경우 Message를 리턴 한다.
     */
    public String selectSalesOpptPorcessBatchUploadPreChkValid(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception {
        try {
            String dataChk = "";
            int custCnt = 0;
            int chkCodeCnt = 0;
            boolean continued = true;

            salesOpptProcessMgmtVO.setRelCustNm(salesOpptProcessMgmtVO.getPurcMngNm());
            salesOpptProcessMgmtVO.setRelCustHpNo(salesOpptProcessMgmtVO.getHpNo());

            CustomerInfoVO customerInfoVO = new CustomerInfoVO();
            CustomerInfoSearchVO customerInfoSearchVO = new CustomerInfoSearchVO();
            CommonCodeTxtSearchVO commonCodeTxtSearchVO = new CommonCodeTxtSearchVO();

        // 1. 코드 정합성 체크
            String dlrCd = LoginUtil.getDlrCd();
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getDlrCd())) {
                if (!dlrCd.equals(salesOpptProcessMgmtVO.getDlrCd())) {
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("crm.info.notEqualsDlrCd", null, Locale.CHINA);
                    dataChk += "</div>";
                    continued = false;
                }
            }

            // 개인 or 법인
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getCustTp())) {
                commonCodeTxtSearchVO.setsCmmGrpCd("CRM001");
                commonCodeTxtSearchVO.setsCmmCd(salesOpptProcessMgmtVO.getCustTp());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(commonCodeTxtSearchVO);
                if (chkCodeCnt == 0) {
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())}, Locale.CHINA);   // {0}이(가) 올바르지 않습니다.
                    dataChk += "</div>";
                    continued = false;
                }
            }

            // 의향 차종
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getIntrCarlineCd())) {
                CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
                carInfoSearchVO.setUseYn("Y");
                carInfoSearchVO.setCarlineCd(salesOpptProcessMgmtVO.getIntrCarlineCd());
                chkCodeCnt = carInfoService.selectCarListsByConditionCnt(carInfoSearchVO);
                if (chkCodeCnt == 0) {
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("crm.lbl.intentionCarline", null, LocaleContextHolder.getLocale())}, Locale.CHINA);   // {0}이(가) 올바르지 않습니다.
                    dataChk += "</div>";
                    continued = false;
                }
            }

            // 정보유형코드
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getInfoTp())) {
                commonCodeTxtSearchVO.setsCmmGrpCd("CRM366");
                commonCodeTxtSearchVO.setsCmmCd(salesOpptProcessMgmtVO.getInfoTp());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(commonCodeTxtSearchVO);
                if (chkCodeCnt == 0) {
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("crm.lbl.infoType", null, LocaleContextHolder.getLocale())}, Locale.CHINA);   // {0}이(가) 올바르지 않습니다.
                    dataChk += "</div>";
                    continued = false;
                }
            }

            // 책임자 ID
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getMngScId())) {
                UserVO userVO = userService.selectUserByKey(salesOpptProcessMgmtVO.getMngScId());
                if (userVO == null) {
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("crm.lbl.prsNm", null, LocaleContextHolder.getLocale())}, Locale.CHINA);   // {0}이(가) 올바르지 않습니다.
                    dataChk += "</div>";
                    continued = false;
                }
            }

            // 성별
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getSexCd())) {
                commonCodeTxtSearchVO.setsCmmGrpCd("COM017");
                commonCodeTxtSearchVO.setsCmmCd(salesOpptProcessMgmtVO.getSexCd());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(commonCodeTxtSearchVO);
                if (chkCodeCnt == 0) {
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.sex", null, LocaleContextHolder.getLocale())}, Locale.CHINA);   // {0}이(가) 올바르지 않습니다.
                    dataChk += "</div>";
                    continued = false;
                }

            }

            // 증서유형
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getMathDocTp())) {
                commonCodeTxtSearchVO.setsCmmGrpCd("CRM024");
                commonCodeTxtSearchVO.setsCmmCd(salesOpptProcessMgmtVO.getMathDocTp());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(commonCodeTxtSearchVO);
                if (chkCodeCnt == 0) {
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())}, Locale.CHINA);   // {0}이(가) 올바르지 않습니다.
                    dataChk += "</div>";
                    continued = false;
                }
            }

            // 증서유형이 있는데 증서번호가 없는 경우
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getMathDocTp())
                    && StringUtils.isBlank(salesOpptProcessMgmtVO.getSsnCrnNo())
                    ) {
                dataChk += "<div>";
                dataChk += messageSource.getMessage("crm.info.noinfoData", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA);
                dataChk += "</div>";
                continued = false;
            }

            // 증서번호이 있는데 증서유형가 없는 경우
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getSsnCrnNo())
                    && StringUtils.isBlank(salesOpptProcessMgmtVO.getMathDocTp())
            ) {
                dataChk += "<div>";
                dataChk += messageSource.getMessage("crm.info.noinfoData", new String[]{messageSource.getMessage("global.lbl.mathDocTp", null, LocaleContextHolder.getLocale())}, Locale.CHINA);
                dataChk += "</div>";
                continued = false;
            }

            // 지불방식
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getPayTp())) {
                commonCodeTxtSearchVO.setsCmmGrpCd("CRM368");
                commonCodeTxtSearchVO.setsCmmCd(salesOpptProcessMgmtVO.getPayTp());
                chkCodeCnt = commonCodeService.selectCommonCodeTxtsByConditionCnt(commonCodeTxtSearchVO);
                if (chkCodeCnt == 0) {
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("crm.lbl.payTp", null, LocaleContextHolder.getLocale())}, Locale.CHINA);   // {0}이(가) 올바르지 않습니다.
                    dataChk += "</div>";
                    continued = false;
                }
            }

            // 현지번호판사용여부
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getLocalCarRegNoYn())) {
                if (!("Y".equals(salesOpptProcessMgmtVO.getLocalCarRegNoYn() ) || "N".equals(salesOpptProcessMgmtVO.getLocalCarRegNoYn()))) {
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("crm.lbl.plateNum", null, LocaleContextHolder.getLocale())}, Locale.CHINA);
                    dataChk += "</div>";
                    continued = false;

                }
            }

        // 2. 정규식 체크
            // 정규식 체크 - 시작
            // 이동전화
            String regExpRlt = "";
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getHpNo())){
                regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(salesOpptProcessMgmtVO.getHpNo());
                if ("FALSE".equals(regExpRlt)){
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("crm.info.regExpHpNo", null, Locale.CHINA);
                    dataChk += "</div>";
                    continued = false;
                }
            }

            // emailNm
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getEmailNm())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByEmail(salesOpptProcessMgmtVO.getEmailNm());
                if ("FALSE".equals(regExpRlt)){
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("crm.info.regExpEmail", null, Locale.CHINA);
                    dataChk += "</div>";
                    continued = false;
                }
            }

            // telNo
//            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getTelNo())) {
//                regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(salesOpptProcessMgmtVO.getTelNo());
//                if ("FALSE".equals(regExpRlt)){
//                    dataChk += "<div>";
//                    dataChk += messageSource.getMessage("crm.info.regExpTelNo", null, Locale.CHINA);  // 전화번호가 규칙에 맞지 않습니다.
//                    dataChk += "</div>";
//                    continued = false;
//                }
//            }

            // officeTelNo
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getOfficeTelNo())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(salesOpptProcessMgmtVO.getOfficeTelNo());
                if ("FALSE".equals(regExpRlt)){
                    dataChk += "<div>";
                    dataChk += messageSource.getMessage("crm.info.regExpTelNo", null, Locale.CHINA);  // 전화번호가 규칙에 맞지 않습니다.
                    dataChk += "</div>";
                    continued = false;
                }
            }
            // ssnCrnNo
            Boolean ssnCrnNoReg = true;
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getSsnCrnNo())) {
                if("01".equals(salesOpptProcessMgmtVO.getMathDocTp())) {
                    if (salesOpptProcessMgmtVO.getSsnCrnNo().length() == 15) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo15Digit(salesOpptProcessMgmtVO.getSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            dataChk += "<div>";
                            dataChk += messageSource.getMessage("crm.info.regExpSsnCrnNo", null, Locale.CHINA);  // 증거번호 규칙에 맞지 않습니다.
                            dataChk += "</div>";
                            ssnCrnNoReg = false;
                            continued = false;
                        }

                    } else if (salesOpptProcessMgmtVO.getSsnCrnNo().length() == 18) {
                        regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo18Digit(salesOpptProcessMgmtVO.getSsnCrnNo());
                        if ("FALSE".equals(regExpRlt)){
                            dataChk += "<div>";
                            dataChk += messageSource.getMessage("crm.info.regExpSsnCrnNo", null, Locale.CHINA);  // 증거번호 규칙에 맞지 않습니다.
                            dataChk += "</div>";
                            ssnCrnNoReg = false;
                            continued = false;
                        }
                    } else {
                        dataChk += "<div>";
                        dataChk += messageSource.getMessage("crm.info.regExpSsnCrnNo", null, Locale.CHINA);  // 증거번호 규칙에 맞지 않습니다.
                        dataChk += "</div>";
                        ssnCrnNoReg = false;
                        continued = false;
                    }
                } else if("08".equals(salesOpptProcessMgmtVO.getMathDocTp())) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByCorpNo(salesOpptProcessMgmtVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        dataChk += "<div>";
                        dataChk += messageSource.getMessage("crm.info.regExpSsnCrnNo", null, Locale.CHINA);  // 증거번호 규칙에 맞지 않습니다.
                        dataChk += "</div>";
                        ssnCrnNoReg = false;
                        continued = false;
                    }
                } else if("10".equals(salesOpptProcessMgmtVO.getMathDocTp())) {
                    if (salesOpptProcessMgmtVO.getSsnCrnNo().length() != 18) {
                        dataChk += "<div>";
                        dataChk += messageSource.getMessage("crm.info.regExpSsnCrnNo", null, Locale.CHINA);  // 증거번호 규칙에 맞지 않습니다.
                        dataChk += "</div>";
                        ssnCrnNoReg = false;
                        continued = false;
                        //throw processException("crm.info.lengthCheckMsg", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())});
                    }
                }
            }

        // 3. 고객 중복 체크
            // 1. '고객여부'를 확인 ( 개인 : 이동전화, 법인 : 이동전화)
            customerInfoSearchVO.setsDlrCd(salesOpptProcessMgmtVO.getDlrCd());
            customerInfoSearchVO.setsCustTp(salesOpptProcessMgmtVO.getCustTp());
            customerInfoSearchVO.setsHpNo(salesOpptProcessMgmtVO.getHpNo());
            customerInfoSearchVO.setsOfficeTelNo(salesOpptProcessMgmtVO.getOfficeTelNo());
            if(customerInfoSearchVO.getsCustCd()==null){
                customerInfoSearchVO.setsCustCd(salesOpptProcessMgmtVO.getCustCd());
            }

            if (StringUtils.isBlank(customerInfoSearchVO.getsCustCd())) {
                customerInfoSearchVO.setsCustCd("01");
                salesOpptProcessMgmtVO.setCustCd("01");
            }

            // 핸드폰 또는 회사번호 (중복)
            //custCnt = customerInfoService.selectCustDupByKeyCnt(customerInfoSearchVO);
            custCnt = customerInfoOutBoundService.selectCustDupByKeyCnt(customerInfoSearchVO);
            // 핸드폰 번호가 중복 됩니다.
            if (custCnt != 0 ) {
                dataChk += "<div>";
                dataChk += messageSource.getMessage("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA);  // 법인번호가 규칙에 맞지 않습니다.
                dataChk += "</div>";
                continued = false;
            }

            // 증거유형 + 증거번호 ( 중복 ) 비어 있지 않은 경우 체크
            if (StringUtils.isNotBlank(salesOpptProcessMgmtVO.getMathDocTp()) && StringUtils.isNotBlank(salesOpptProcessMgmtVO.getSsnCrnNo()) ) {
                customerInfoSearchVO.setsMathDocTp(salesOpptProcessMgmtVO.getMathDocTp());
                customerInfoSearchVO.setsSsnCrnNo(salesOpptProcessMgmtVO.getSsnCrnNo());

                if (ssnCrnNoReg) {
                    customerInfoVO = customerInfoDAO.selectCustMathDocDupByKey(customerInfoSearchVO);
                    if(customerInfoVO != null) {
                        dataChk += "<div>";
                        dataChk += messageSource.getMessage("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA);  // 법인번호가 규칙에 맞지 않습니다.
                        dataChk += "</div>";
                        continued = false;
                    }
                }
                //customerInfoVO = customerInfoOutBoundService.selectCustMathDocDupByKey(customerInfoSearchVO);
            }

            return dataChk;
        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }

    }
    /*
     * Excel Upload를 위한 Method 끝
     */

}
