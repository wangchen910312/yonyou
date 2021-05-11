package chn.bhmc.dms.mob.crm.mcm.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.apr.service.SignService;
import chn.bhmc.dms.cmm.apr.vo.DocLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MarketingCampaignController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 6. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 27.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Controller
public class MobMarketingCampaignController extends HController {

    /**
     * 결재양식관리 서비스
     */
    @Resource(name="docService")
    DocService docService;

    /**
     * 결재 관리 서비스
     */
    @Resource(name="signService")
    SignService signService;


    /**
     * 마케팅 캠페인 관리 서비스
     */
    @Resource(name="marketingCampaignService")
    MarketingCampaignService marketingCampaignService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
    * 마케팅 캠페인 관리 메인 화면을 출력한다.
    * @return
    */
   @RequestMapping(value = "/mob/crm/mcm/marketingCampaign/selectMarketingCampaignMain.do", method = RequestMethod.GET)
   public String selectMarketingCampaignMain(Model model, @RequestParam(value="makCd", defaultValue="") String makCd) throws Exception {
       // 캠페인 목록에서 makCd 받아서 상세조회.
       if( !StringUtils.isEmpty(makCd) ){
           model.addAttribute("makCd", makCd);
       }

       String langCd = LocaleContextHolder.getLocale().getLanguage();
       /*String today = DateUtil.getDate("yyyy-MM-dd");
       String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";

       model.addAttribute("oneDay", oneDay);
       model.addAttribute("today", today);*/

       MobLoginVO mobLoginVO = MobUtil.getLoginVO();
       model.addAttribute("userId", mobLoginVO.getUserId());
       model.addAttribute("userNm", mobLoginVO.getUserNm());
       model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
       model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

       model.addAttribute("hostList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM708", null, langCd));  //주최
       model.addAttribute("makTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM702", null, langCd));  //유형
       model.addAttribute("statList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM701", null, langCd));  //상태 (캠페인 상태)

       // 결재처리결과 공통코드 추가
       model.addAttribute("signRsltList", commonCodeService.selectCommonCodesByCmmGrpCd("COM011", null, langCd));  //결재처리
       // 결재진행상태 공통코드 추가
       model.addAttribute("signStatList", commonCodeService.selectCommonCodesByCmmGrpCd("COM010", null, langCd));  //상태

       model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/mcm/marketingCampaign/baseJsp/selectMarketingCampaignMain.jsp");

       return "/ZnewMob/templatesNewMob/mobTemplateA";
   }

   /**
    * 마케팅 캠페인 목록
    */
   @RequestMapping(value = "/mob/crm/mcm/marketingCampaign/selectMarketingCampaignList.do", method = RequestMethod.GET)
   public String selectMarketingCampaignList(Model model) throws Exception  {
       return "/mob/crm/mcm/marketingCampaign/selectMarketingCampaignList";
   }

   /**
    * 마케팅 캠페인 목록
    */
   @RequestMapping(value = "/mob/crm/mcm/marketingCampaign/selectMarketingCampaignSubList.do", method = RequestMethod.GET)
   public String selectMarketingCampaignSubList(Model model) throws Exception  {
       return "/mob/crm/mcm/marketingCampaign/selectMarketingCampaignSubList";
   }

   /**
    * File List
    */
   @RequestMapping(value = "/mob/crm/mcm/marketingCampaign/selectMarketingCampaignFileList.do", method = RequestMethod.GET)
   public String selectMarketingCampaignFileList(Model model) throws Exception  {
       return "/mob/crm/mcm/marketingCampaign/selectMarketingCampaignFileList";
   }

   // 리스트 페이지로 보여주기
   @RequestMapping(value = "/mob/crm/mcm/marketingCampaign/selectMarketingCampaignSignLineList.do", method = RequestMethod.GET)
   public String selectMarketingCampaignSignLineList(Model model) throws Exception  {
       return "/mob/crm/mcm/marketingCampaign/selectMarketingCampaignSignLineList";
   }

   /**
    * selectDocLineExs.do
    */
   @RequestMapping(value = "/mob/crm/mcm/marketingCampaign/selectDocLineExs.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectDocLineExs(@RequestBody DocLineSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();
       searchVO.setsDlrCd(LoginUtil.getDlrCd());

       result.setTotal(docService.selectDocLinesByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(docService.selectDocLinesByCondition(searchVO));
       }

       return result;

   }

   /**
    * selectSignLineExs.do
    */
   @RequestMapping(value = "/mob/crm/mcm/marketingCampaign/selectSignLineExs.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSignLineExs(@RequestBody SignLineSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       List<SignLineVO> signLineList = signService.selectSignLinesByCondition(searchVO);

       result.setTotal(signLineList.size());
       result.setData(signLineList);

       return result;
   }


   @RequestMapping(value = "/mob/crm/mcm/marketingCampaign/selectMarketingCampaigns.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectMarketingCampaigns(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       result.setTotal(marketingCampaignService.selectMarketingCampaignsByConditionCnt(searchVO));

       if(result.getTotal() != 0){

           List<MarketingCampaignVO> selectMarketingCampaignsByCondition = marketingCampaignService.selectMarketingCampaignsByCondition(searchVO);

           result.setData(selectMarketingCampaignsByCondition);
       }

       return result;



   }

   /**
    * 마케팅 캠페인 상세조회
    * @param marketingCampaignVO - 마케팅 캠페인 정보
    * @param bindingResult
    * @return
    */
   @RequestMapping(value = "/mob/crm/mcm/marketingCampaign/selectMarketingCampaignByKey.do", method = RequestMethod.POST)
   @ResponseBody
   public MarketingCampaignVO selectMarketingCampaignByKey(@RequestBody MarketingCampaignSearchVO searchVO)throws Exception {
       MarketingCampaignVO targetMarketingCampaignVO = new MarketingCampaignVO();

       targetMarketingCampaignVO = marketingCampaignService.selectMarketingCampaignByKey(searchVO);

       return targetMarketingCampaignVO;
   }



   /**
    * 마케팅 캠페인(목표) 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
    * @return
    */
   @RequestMapping(value = "/mob/crm/mcm/marketingCampaign/selectGoals.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectGoals(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {
       SearchResult result = new SearchResult();

       result.setTotal(marketingCampaignService.selectGoalsByConditionCnt(searchVO));

       if(result.getTotal() != 0) {
           result.setData(marketingCampaignService.selectGoalsByCondition(searchVO));
       }

       return result;
   }

   /**
    * 심사 및 반려
    * @return
    * @throws Exception
    *
    */
   @RequestMapping(value = "/mob/crm/mcm/marketingCampaign/updateSignLineEx.do", method = RequestMethod.POST)
   @ResponseBody
   public boolean updateSignLineEx(@Validated @RequestBody SignLineVO signLineVO, Model model) throws Exception {

       signService.updateSignLine(signLineVO);

       return true;
   }


}