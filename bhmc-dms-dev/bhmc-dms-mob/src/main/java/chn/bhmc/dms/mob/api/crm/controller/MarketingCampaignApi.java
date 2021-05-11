package chn.bhmc.dms.mob.api.crm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import able.com.web.HController;
import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.apr.service.SignService;
import chn.bhmc.dms.cmm.apr.vo.DocLineSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.service.CrmCommonCodeService;
import chn.bhmc.dms.mob.api.crm.service.CrmFileMgrService;
import chn.bhmc.dms.mob.api.crm.service.CrmMarketingCampaignService;
import chn.bhmc.dms.mob.api.crm.service.CrmSignService;
import chn.bhmc.dms.mob.api.crm.vo.FileItemSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.FileItemVO;
import chn.bhmc.dms.mob.api.crm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.MarketingCampaignVO;
import chn.bhmc.dms.mob.api.crm.vo.SignLineSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SignLineVO;
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

@RestController
@RequestMapping(value = "api/crm/marketingCampaign")
@Api("CRM市场活动管理相关接口")
public class MarketingCampaignApi extends HController {

    /**
     * 결재양식관리 서비스    //审批表格管理服务
     */
    @Resource(name="docService")
    DocService docService;

    /**
     * 결재 관리 서비스             //付款管理服务
     */
    @Resource(name="signService")
    SignService signService;
    
    /**
     * 결재 관리 서비스             //付款管理服务
     */
    @Resource(name="CrmsignService")
    CrmSignService CrmsignService;

    /**
     * 마케팅 캠페인 관리 서비스   //市场活动管理服务
     */
    @Resource(name="CrmmarketingCampaignService")
    CrmMarketingCampaignService CrmmarketingCampaignService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="CrmcommonCodeService")
    CrmCommonCodeService CrmcommonCodeService;


    @Resource(name="CrmfileMgrService")
    CrmFileMgrService CrmfileMgrService;

    /**
    * 마케팅 캠페인 관리 메인 화면을 출력한다.
    * @return
    */
    @ResponseBody
    @ApiOperation("市场活动管理主界面")
   @RequestMapping(value = "/selectMarketingCampaignMain.do", method = RequestMethod.GET)


    public BaseJSON selectMarketingCampaignMain(Model model, @RequestParam(value="makCd", defaultValue="") String makCd) throws Exception {
       // 캠페인 목록에서 makCd 받아서 상세조회.  //从市场活动表中接受makCd并查看详细信息
    	BaseJSON baseJSON =  new BaseJSON();
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

       model.addAttribute("hostList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM708", null, langCd));  //주최  主办单位
       model.addAttribute("makTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM702", null, langCd));  //유형 类型
       model.addAttribute("statList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM701", null, langCd));  //상태 (캠페인 상태)  市场活动状态

       // 결재처리결과 공통코드 추가
       model.addAttribute("signRsltList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("COM011", null, langCd));  //결재처리结算处理
       // 결재진행상태 공통코드 추가
       model.addAttribute("signStatList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("COM010", null, langCd));  // 状态

       model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/mcm/marketingCampaign/baseJsp/selectMarketingCampaignMain.jsp");

     //  return "/ZnewMob/templatesNewMob/mobTemplateA";   //跳转
          baseJSON.setResult(model);
         return baseJSON;
   }

   /**
    * 마케팅 캠페인 목록   //市场活动列表
    */
   @RequestMapping(value = "/mob/crm/mcm/marketingCampaign/selectMarketingCampaignList.do", method = RequestMethod.GET)
   public String selectMarketingCampaignList(Model model) throws Exception  {
       return "/mob/crm/mcm/marketingCampaign/selectMarketingCampaignList";
   }

   /**
    * 마케팅 캠페인 목록   //营销活动表
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

   // 리스트 페이지로 보여주기     显示列表页
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
   @ApiOperation("市场活动管理-审批")
   @RequestMapping(value = "/selectSignLineExs.do", method = RequestMethod.POST)
   @ResponseBody
   public BaseJSON selectSignLineExs(@RequestBody SignLineSearchVO searchVO) throws Exception {
            BaseJSON  baseJSON =  new BaseJSON();
       SearchResult result = new SearchResult();

       List<SignLineVO> signLineList = CrmsignService.selectSignLinesByCondition(searchVO);

       result.setTotal(signLineList.size());
       result.setData(signLineList);
      baseJSON.setResult(result);
       return baseJSON;
   }

   @ApiOperation("市场活动管理信息")
   @RequestMapping(value = "/selectMarketingCampaigns.do", method = RequestMethod.POST)
   @ResponseBody
   public BaseJSON selectMarketingCampaigns(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {
      BaseJSON   baseJSON = new BaseJSON();
       SearchResult result = new SearchResult();

       result.setTotal(CrmmarketingCampaignService.selectMarketingCampaignsByConditionCnt(searchVO));

       if(result.getTotal() != 0){

           List<MarketingCampaignVO> selectMarketingCampaignsByCondition = CrmmarketingCampaignService.selectMarketingCampaignsByCondition(searchVO);

           result.setData(selectMarketingCampaignsByCondition);
       }
          baseJSON.setResult(result);
       return baseJSON;



   }

   /**
    * 마케팅 캠페인 상세조회 查看市场活动详情
    * @param market마케팅 캠페인 상세조회ingCampaignVO - 마케팅 캠페인 정보
    * @param bindingResult
    * @return
    */
   @ApiOperation("查询市场活动详情")
   @RequestMapping(value = "/selectMarketingCampaignByKey.do", method = RequestMethod.POST)
   @ResponseBody
   public BaseJSON selectMarketingCampaignByKey(@RequestBody MarketingCampaignSearchVO searchVO)throws Exception {
        BaseJSON  baseJSON   =  new BaseJSON();
	   MarketingCampaignVO targetMarketingCampaignVO = new MarketingCampaignVO();

       targetMarketingCampaignVO = CrmmarketingCampaignService.selectMarketingCampaignByKey(searchVO);

        baseJSON.setResult(targetMarketingCampaignVO);
       return baseJSON;
   }



   /**
    * 마케팅 캠페인(목표) 데이터를 조회한다. 查看市场活动（目标）数据
    * @param searchVO - 조회 조건을 포함하는 SecuredResourceSearchVO
    * @return
    */
   @ApiOperation("市场活动-目标")
   @RequestMapping(value = "/selectGoals.do", method = RequestMethod.POST)
   @ResponseBody
   public BaseJSON selectGoals(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {
	   BaseJSON   baseJSON = new BaseJSON();
	   SearchResult result = new SearchResult();

       result.setTotal(CrmmarketingCampaignService.selectGoalsByConditionCnt(searchVO));

       if(result.getTotal() != 0) {
           result.setData(CrmmarketingCampaignService.selectGoalsByCondition(searchVO));
       }
         baseJSON.setResult(result);
         return baseJSON;
   }




   /**
    * 첨부문서 번호로 등록된 파일 목록을 조회한다查询已附上文件编号的文件清单.
    * @param fileDocNo 첨부문서번호
    * @return 파일 목록 文件列表
    */
   @ApiOperation("市场活动-方案")
   @RequestMapping(value = "/selectFiles.do")
   @ResponseBody
   public BaseJSON selectFiles(@RequestBody FileItemSearchVO searchVO) throws Exception {
       BaseJSON  baseJSON =  new BaseJSON();
	   SearchResult result = new SearchResult();
       String fileDocNo = searchVO.getsFileDocNo();

       List<FileItemVO> list = null;

       if(StringUtils.isEmpty(fileDocNo)){
           list = new ArrayList<FileItemVO>();
       } else {
           list = CrmfileMgrService.selectFileItemsByFileDocNo(searchVO.getsFileDocNo());
       }

       result.setTotal(list.size());
       result.setData(list);
    baseJSON.setResult(result);
       return baseJSON;
   }



   /**
    * 유형 Sub 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
    * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
    * @return
    */
   @ApiOperation("查询市场活动表")
   @RequestMapping(value = "/selectMakTpCdList.do", method = RequestMethod.POST)
   @ResponseBody
   public BaseJSON selectMakTpCdList(@RequestBody MarketingCampaignSearchVO searchVO) throws Exception {
     BaseJSON  baseJSON= new  BaseJSON();
       SearchResult result = new SearchResult();

       result.setData(CrmmarketingCampaignService.selectMakTpCdListByCondition(searchVO));
       baseJSON.setResult(result);
       return baseJSON;
   }

}