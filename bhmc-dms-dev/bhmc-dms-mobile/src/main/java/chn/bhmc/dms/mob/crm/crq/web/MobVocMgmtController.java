package chn.bhmc.dms.mob.crm.crq.web;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.crq.service.VocMgmtService;
import chn.bhmc.dms.crm.crq.vo.VocMgmtSearchVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobVocMgmtController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 7. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 4.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Controller
public class MobVocMgmtController extends HController {
    /**
     * VOC관리 서비스
     */
    @Resource(name="vocMgmtService")
    VocMgmtService vocMgmtService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 사용자 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * VOC 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/crm/crq/vocMgmt/selectVocMgmtMain.do", method = RequestMethod.GET)
    public String selectVocMgmtMain(Model model, @RequestParam(value="callTelNo", defaultValue="") String callTelNo, @RequestParam(value="vocNo", defaultValue="") String vocNo) throws Exception {

        model.addAttribute("callTelNo", callTelNo);
        model.addAttribute("vocNo", vocNo);

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("vocTpCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM604", null, langCd));               //VOC유형코드            / VOC_TP_CD
        model.addAttribute("vocStatCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM624", null, langCd));               //VOC상태코드            / VOC_STAT_CD
        model.addAttribute("vocTpSubCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM617", null, langCd));               //VOC유형SUB코드            / VOC_TP_SUB_CD
        model.addAttribute("tendCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM609", null, langCd));                //성향코드                  / TEND_CD
        model.addAttribute("acptSrcCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM602", null, langCd));             //접수출처코드           / ACPT_SRC_CD
        model.addAttribute("activeGainPathCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM615", null, langCd));      //활동 획득 경로 코드  / ACTIVE_GAIN_PATH_CD
        model.addAttribute("cmplCauCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM601", null, langCd));             //불만원인코드           / CMPL_CAU_CD
        model.addAttribute("prorCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM623", null, langCd));                //우선순위코드           / PROR_CD
        model.addAttribute("procLmtCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM616", null, langCd));             //처리시한 코드          / PROC_LMT_CD
        model.addAttribute("pmoCauCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM620", null, langCd));              //승급 원인 코드         / PMO_CAU_CD
        model.addAttribute("vocTpSub1CdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM605", null, langCd));           //VOC유형하위1코드   / VOC_TP_SUB1_CD

        model.addAttribute("crm030List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));  //고객 및 연계인 관계

        model.addAttribute("activeStatCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM625", null, langCd));       //VOC 활동 상태         / ACTIVE_STAT_CD
        model.addAttribute("activeTpCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM626", null, langCd));         //VOC 활동 유형         / ACTIVE_TP_CD
        model.addAttribute("activeTpSubCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM627", null, langCd));      //VOC 활동 SUB 유형 / ACTIVE_TP_SUB_CD


        model.addAttribute("cmplStsfNmList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM628", null, langCd));      //문의만족도 / CMPL_STSF_NM

        model.addAttribute("sendCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM629", null, langCd));      //발송상태/ SEND_CD
        model.addAttribute("salesActiveSrcCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM630", null, langCd));      //영업활동정보출처 / SALES_ACTIVE_SRC_CD

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //성코드
        VocMgmtSearchVO vocMgmtSearchVO = new VocMgmtSearchVO();
        model.addAttribute("sungCdInfo", vocMgmtService.selectSungCdListByCondition(vocMgmtSearchVO));

        String mngScIdCtrl = "N";
        if (LoginUtil.hasRole("ROLE_ADMIN")) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);

//        UserSearchVO userSearchVO = new UserSearchVO();
//        userSearchVO.setsEnabledYn("Y");
//        userSearchVO.setsDlrCd(LoginUtil.getDlrCd());
//        List<UserVO> mngScIdList = userService.selectUsersByRoleId(LoginUtil.getDlrCd(), "ROLE_CRM_R_07", Constants.SYS_CD_DLR);
//        model.addAttribute("mngScIdList", mngScIdList);


        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());
        model.addAttribute("loginDlrNm", LoginUtil.getDlrNm());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/crq/vocMMgmt/baseJsp/selectVocMgmtMain.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    /**
     * VOC 관리 목록
     */
    @RequestMapping(value = "/mob/crm/crq/vocMgmt/selectVocMgmtMainList.do", method = RequestMethod.GET)
    public String selectVocMgmtMainList(Model model) throws Exception  {
        return "/mob/crm/crq/vocMgmt/selectVocMgmtMainList";
    }

    /**
     * VOC 활동
     */
    @RequestMapping(value = "/mob/crm/crq/vocMgmt/selectVocMgmtSubList.do", method = RequestMethod.GET)
    public String selectVocMgmtSubList(Model model) throws Exception  {
        return "/mob/crm/crq/vocMgmt/selectVocMgmtSubList";
    }

    /**
     * VOC 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/crq/vocMgmt/selectVocMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVocMgmts(@RequestBody VocMgmtSearchVO searchVO, Model model) throws Exception {
       /* SearchResult result = new SearchResult();

        result.setTotal(vocMgmtService.selectVocMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0) {
            result.setData(vocMgmtService.selectVocMgmtsByCondition(searchVO));
        }

        return result;*/
        SearchResult result = new SearchResult();


        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startStartCal = Calendar.getInstance();
        if(searchVO.getsRegStartDt() != null || searchVO.getsRegEndDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsRegStartDt() == searchVO.getsRegEndDt()){
                // 시작일 = 종료일 동일한경우
                startStartCal.setTime(searchVO.getsRegStartDt());
                year = startStartCal.get(Calendar.YEAR);
                month = startStartCal.get(Calendar.MONTH);
                day = startStartCal.get(Calendar.DATE);
                startStartCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegEndDt(startStartCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsRegEndDt() != null){
                // 종료일이 있는경우
                Calendar startEndCal = Calendar.getInstance();
                startEndCal.setTime(searchVO.getsRegEndDt());
                year = startEndCal.get(Calendar.YEAR);
                month = startEndCal.get(Calendar.MONTH);
                day = startEndCal.get(Calendar.DATE);
                startEndCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegEndDt(startEndCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/




        result.setTotal(vocMgmtService.selectVocMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<VocMgmtVO> selectVocMgmtsByCondition = vocMgmtService.selectVocMgmtsByCondition(searchVO);
            result.setData(selectVocMgmtsByCondition);
        }

        return result;
    }

    /**
     * VOC활동 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/crq/vocMgmt/selectActives.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectActives(@RequestBody VocMgmtSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(vocMgmtService.selectActivesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vocMgmtService.selectActivesByCondition(searchVO));
        }

        return result;
    }
}