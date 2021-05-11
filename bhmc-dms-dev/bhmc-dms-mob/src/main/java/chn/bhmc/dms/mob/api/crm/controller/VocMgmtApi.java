package chn.bhmc.dms.mob.api.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.service.CrmCarInfoService;
import chn.bhmc.dms.mob.api.crm.service.CrmCommonCodeService;
import chn.bhmc.dms.mob.api.crm.service.CrmVocMgmtService;
import chn.bhmc.dms.mob.api.crm.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.VocMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.VocMgmtVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

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

@RestController
@RequestMapping(value = "api/crm/vocMgmt")
@Api("CRM服务请求管理相关接口")
public class VocMgmtApi extends HController {
    /**
     * VOC관리 서비스
     */
    @Resource(name="CrmvocMgmtService")
    CrmVocMgmtService CrmvocMgmtService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="CrmcommonCodeService")
    CrmCommonCodeService CrmcommonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="CrmcarInfoService")
    CrmCarInfoService CrmcarInfoService;


    /**
     * VOC 관리 메인 화면을 출력한다.
     * @return
     */
    @ResponseBody
    @ApiOperation("CRM-服务请求管理")
    @RequestMapping(value = "/selectVocMgmtMain.do", method = RequestMethod.GET)
    public BaseJSON selectVocMgmtMain(Model model, @RequestParam(value="callTelNo", defaultValue="") String callTelNo, @RequestParam(value="vocNo", defaultValue="") String vocNo) throws Exception {
        BaseJSON  baseJSON =  new BaseJSON();
        model.addAttribute("callTelNo", callTelNo);
        model.addAttribute("vocNo", vocNo);

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("vocTpCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM604", null, langCd));               //VOC유형코드            / VOC_TP_CD
        model.addAttribute("vocStatCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM624", null, langCd));               //VOC상태코드            / VOC_STAT_CD
        model.addAttribute("vocTpSubCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM617", null, langCd));               //VOC유형SUB코드            / VOC_TP_SUB_CD
        model.addAttribute("tendCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM609", null, langCd));                //성향코드                  / TEND_CD
        model.addAttribute("acptSrcCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM602", null, langCd));             //접수출처코드           / ACPT_SRC_CD
        model.addAttribute("activeGainPathCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM615", null, langCd));      //활동 획득 경로 코드  / ACTIVE_GAIN_PATH_CD
        model.addAttribute("cmplCauCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM601", null, langCd));             //불만원인코드           / CMPL_CAU_CD
        model.addAttribute("prorCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM623", null, langCd));                //우선순위코드           / PROR_CD
        model.addAttribute("procLmtCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM616", null, langCd));             //처리시한 코드          / PROC_LMT_CD
        model.addAttribute("pmoCauCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM620", null, langCd));              //승급 원인 코드         / PMO_CAU_CD
        model.addAttribute("vocTpSub1CdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM605", null, langCd));           //VOC유형하위1코드   / VOC_TP_SUB1_CD

        model.addAttribute("crm030List",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));  //고객 및 연계인 관계

        model.addAttribute("activeStatCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM625", null, langCd));       //VOC 활동 상태         / ACTIVE_STAT_CD
        model.addAttribute("activeTpCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM626", null, langCd));         //VOC 활동 유형         / ACTIVE_TP_CD
        model.addAttribute("activeTpSubCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM627", null, langCd));      //VOC 활동 SUB 유형 / ACTIVE_TP_SUB_CD


        model.addAttribute("cmplStsfNmList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM628", null, langCd));      //문의만족도 / CMPL_STSF_NM

        model.addAttribute("sendCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM629", null, langCd));      //발송상태/ SEND_CD
        model.addAttribute("salesActiveSrcCdList",   CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM630", null, langCd));      //영업활동정보출처 / SALES_ACTIVE_SRC_CD

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부 是否使用
        model.addAttribute("carLineCdInfo", CrmcarInfoService.selectCarListsByCondition(carInfoSearchVO));

        //성코드
        VocMgmtSearchVO vocMgmtSearchVO = new VocMgmtSearchVO();
        model.addAttribute("sungCdInfo", CrmvocMgmtService.selectSungCdListByCondition(vocMgmtSearchVO));

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
         baseJSON.setResult(model);
        return baseJSON;
      //  return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    /**
     * VOC 관리 목록  管理清单
     */
    @RequestMapping(value = "/mob/crm/crq/vocMgmt/selectVocMgmtMainList.do", method = RequestMethod.GET)
    public String selectVocMgmtMainList(Model model) throws Exception  {
        return "/mob/crm/crq/vocMgmt/selectVocMgmtMainList";
    }

    /**
     * VOC 활동    活动
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
    @ApiOperation("查询服务请求管理列表")
    @RequestMapping(value = "/selectVocMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON  selectVocMgmts(@RequestBody VocMgmtSearchVO searchVO, Model model) throws Exception {
       /* SearchResult result = new SearchResult();

        result.setTotal(vocMgmtService.selectVocMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0) {
            result.setData(vocMgmtService.selectVocMgmtsByCondition(searchVO));
        }

        return result;*/
    	BaseJSON   baseJSON =  new BaseJSON();
        SearchResult result = new SearchResult();


        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        //此处原代码有误，故暂时省略不用，后续如提出要求则重新修改正确逻辑后启用
        /*Calendar startStartCal = Calendar.getInstance();
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
        }*/
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/




        result.setTotal(CrmvocMgmtService.selectVocMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<VocMgmtVO> selectVocMgmtsByCondition = CrmvocMgmtService.selectVocMgmtsByCondition(searchVO);
            result.setData(selectVocMgmtsByCondition);
        }
         baseJSON.setResult(result);
        return baseJSON;
    }

    /**
     * VOC활동 데이터를 조회한다.查看活动数据
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return
     */
    @ApiOperation("CRM-查看活动数据")
    @RequestMapping(value = "/selectActives.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectActives(@RequestBody VocMgmtSearchVO searchVO) throws Exception {
        BaseJSON  baseJSON =  new BaseJSON();

    	SearchResult result = new SearchResult();

        result.setTotal(CrmvocMgmtService.selectActivesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(CrmvocMgmtService.selectActivesByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;
    }


    /**
     * VOC 유형 / 1급 SUB 유형 / 2급 SUB 유형에 따른 상태 조회(값 셋팅시에만 사용함)
     * SUB 유형 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @ApiOperation("客户请求信息")
    @RequestMapping(value = "/selectVocTpSubCdList.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectVocTpSubCdList(@RequestBody VocMgmtSearchVO searchVO) throws Exception {
           BaseJSON  baseJSON=  new BaseJSON();

           SearchResult result = new SearchResult();

        result.setData(CrmvocMgmtService.selectVocTpSubCdListByCondition(searchVO));
           baseJSON.setResult(result);
        return baseJSON;
    }



    /**
     * VOC 상세 정보를 조회한다.查看详细信息
     * @param VocMgmtSearchVO - VOC_NO, DLR_CD
     * @return
     */
    @ApiOperation("查看详细信息")
    @RequestMapping(value = "/selectVocMgmtByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectCustomerCareMgmtByKey(@RequestBody VocMgmtSearchVO searchVO) throws Exception {
         BaseJSON  baseJSON  =  new BaseJSON();
        VocMgmtVO vo = CrmvocMgmtService.selectVocMgmtByKey(searchVO);
        baseJSON.setResult(vo);
        return baseJSON;

    }

}