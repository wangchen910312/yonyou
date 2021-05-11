package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.exception.BizException;
import able.com.service.HService;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.service.CustomerRelInfoService;
import chn.bhmc.dms.crm.cif.service.dao.CustomerInfoDAO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.cmm.service.RegularExpressionService;
import chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtFinishService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.mob.api.crm.dao.CrmSalesOpptProcessMgmtDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmSalesOpptProcessMgmtService;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptProcessMgmtHistSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptProcessMgmtHistVO;
import chn.bhmc.dms.sal.acu.service.ContBeforeMngOutBoundService;
import chn.bhmc.dms.sal.cnt.service.ContractReOutBoundService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;


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

@Service("CrmsalesOpptProcessMgmtService")
public class CrmSalesOpptProcessMgmtServiceImpl extends HService implements CrmSalesOpptProcessMgmtService{

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
    @Resource(name="CrmsalesOpptProcessMgmtDAO")
    CrmSalesOpptProcessMgmtDAO CrmsalesOpptProcessMgmtDAO;

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
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsHistByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistSearchVO)
     */
    @Override
    public int selectSalesOpptProcessMgmtsHistByConditionCnt(SalesOpptProcessMgmtHistSearchVO searchVO)
            throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return CrmsalesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsHistByConditionCnt(searchVO);
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

            List<SalesOpptProcessMgmtHistVO> salesOpptProcessMgmtHistList = CrmsalesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsHistByCondition(searchVO);

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
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsByKey(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public SalesOpptProcessMgmtVO selectSalesOpptProcessMgmtsByKey(SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return CrmsalesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByKey(searchVO);
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

        return CrmsalesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#selectSalesOpptProcessMgmtsByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessMgmtsByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return CrmsalesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByCondition(searchVO);
    }


}
