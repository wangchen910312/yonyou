package chn.bhmc.dms.mob.api.repair.controller;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.repair.service.RepairCalculateService;
import chn.bhmc.dms.mob.api.repair.service.RepairCommonCodeService;
import chn.bhmc.dms.mob.api.repair.service.RepairServiceCommonService;
import chn.bhmc.dms.mob.api.repair.service.RepairServiceLaborService;
import chn.bhmc.dms.mob.api.repair.service.RepairServicePartService;
import chn.bhmc.dms.mob.api.repair.service.RepairSystemConfigInfoService;
import chn.bhmc.dms.mob.api.repair.vo.CalculateSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.CalculateVO;
import chn.bhmc.dms.mob.api.repair.vo.TabInfoSearchVO;
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
 * @ClassName   : MobCalculateController.java
 * @Description : 정산 컨트롤러
 * @author JongHee Lim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 23.     JongHee Lim     최초 생성
 * </pre>
 */
@RestController
@RequestMapping("/api/repair/calculate")
@Api("维修结算收款相关功能接口")
public class CalculateApi extends HController {

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    RepairCommonCodeService RepairCommonCodeService;

    @Autowired
    RepairCalculateService RepairCalculateService;

    @Autowired
    RepairSystemConfigInfoService RepairSystemConfigInfoService;

    @Autowired
    RepairServicePartService RepairServicePartService;

    @Autowired
    RepairServiceLaborService RepairServiceLaborService;

    @Autowired
    RepairServiceCommonService RepairServiceCommonService;

    /**
     * 维修结算收款-服务结算收款页面的url跳转
     * @return
     */
    @ResponseBody
    @ApiOperation("服务结算收款页面url跳转")
    @RequestMapping(value="/selectCalculateMain.do", method = RequestMethod.GET)
    public BaseJSON selectBayManageMain(Model model) throws Exception {
    	BaseJSON baseJSON =new BaseJSON();
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = RepairSystemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        //String sysDate = DateUtil.getDate("yyyy-MM-dd");

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        // 지불기한
        model.addAttribute("paymPridCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 지불방식
        //model.addAttribute("paymMthCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        // RO상태
        model.addAttribute("roStatCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        model.addAttribute("preFixId", "CA");

        //model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/cal/calculate/baseJsp/selectCalculateMain.jsp");
        model.addAttribute("fromWhere", "selectCalculateMain");
        model.addAttribute("laborsTemplate", "subTemplate2");
        model.addAttribute("partsTemplate", "subTemplate3");
        baseJSON.setResult(model);
        return baseJSON;

    }


    /**
     * 服务结算查询列表信息
     */
    @ApiOperation("服务结算收款页面列表信息")
    @RequestMapping(value="/selectCalculatesList.do",  method = RequestMethod.POST)
    public @ResponseBody BaseJSON selectCalculatesList(@RequestBody CalculateSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON =new BaseJSON();
        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();

        result.setTotal(RepairCalculateService.selectCalculateListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(RepairCalculateService.selectCalculateListByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;

    }
    
    /**
     * 
     * @param searchVO
     * @return
     * @throws Exception
     */
    @ApiOperation("服务结算实收金额总金额")
    @RequestMapping(value="/selectCalculatesAmouts.do",  method = RequestMethod.POST)
    public @ResponseBody BaseJSON selectCalculatesAmouts(@RequestBody CalculateSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON =new BaseJSON();
        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);
        //SearchResult result = new SearchResult();
        String aumouts = RepairCalculateService.selectCalculatesAmouts(searchVO);
        baseJSON.setResult(aumouts);
        return baseJSON;
    }
    

    /**
     * 查看零件数据
     */
    @ApiOperation("配件项目")
    @RequestMapping(value="/selectServiceParts.do",  method = RequestMethod.POST)
    public @ResponseBody BaseJSON selectReservationParts(@RequestBody TabInfoSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON =new BaseJSON();
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(RepairServicePartService.selectServicePartsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(RepairServicePartService.selectServicePartsByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;

     }

    /**
     * 维修项目
     */
    @ApiOperation("维修项目")
    @RequestMapping(value="/selectServiceLabors.do",  method = RequestMethod.POST)
    public @ResponseBody BaseJSON selectReservationLabors(@RequestBody TabInfoSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON =new BaseJSON();
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(RepairServiceLaborService.selectServiceLaborsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(RepairServiceLaborService.selectServiceLaborsByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;

     }


    /**
     *基本信息
     */
    @ApiOperation("结算金额信息")
    @RequestMapping(value="/selectCalculateByKey.do",  method = RequestMethod.POST)
    public @ResponseBody BaseJSON selectRepairOrderByKey(@RequestBody CalculateSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON =new BaseJSON();
        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        CalculateVO resultVO = RepairCalculateService.selectCalculateByKey(searchVO);

        if(resultVO == null){
            resultVO = new CalculateVO();
        }

        baseJSON.setResult(resultVO);
        return baseJSON;
    }

    /**
    *客户主诉
    */
   @ApiOperation("客户主诉")
   @RequestMapping(value="/selectCustDemands.do" , method=RequestMethod.POST)
   @ResponseBody
   public BaseJSON selectCustDemands(@RequestBody TabInfoSearchVO searchVO)throws Exception{
	   BaseJSON baseJSON =new BaseJSON();
       SearchResult result = new SearchResult();
       searchVO.setsDlrCd(LoginUtil.getDlrCd());

       result.setData(RepairServiceCommonService.selectCustDemandsByCondition(searchVO));

       result.setTotal(result.getData().size());

       baseJSON.setResult(result);

       return baseJSON;
   }

   /**
   *其他事项
   */
   @ApiOperation("其他事项")
  @RequestMapping(value="/selectEtcIssues.do" , method=RequestMethod.POST)
  @ResponseBody
  public BaseJSON selectEtcIssues(@RequestBody TabInfoSearchVO searchVO)throws Exception{
	   BaseJSON baseJSON =new BaseJSON();
      SearchResult result = new SearchResult();
      searchVO.setsDlrCd(LoginUtil.getDlrCd());

      result.setData(RepairServiceCommonService.selectEtcIssuesByCondition(searchVO));

      result.setTotal(result.getData().size());
      baseJSON.setResult(result);
      return baseJSON;
  }

}
