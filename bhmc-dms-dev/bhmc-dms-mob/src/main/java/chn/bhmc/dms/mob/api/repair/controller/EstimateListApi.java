package chn.bhmc.dms.mob.api.repair.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.repair.service.RepairCommonCodeService;
import chn.bhmc.dms.mob.api.repair.service.RepairEstimateService;
import chn.bhmc.dms.mob.api.repair.service.RepairLtsModelMappingService;
import chn.bhmc.dms.mob.api.repair.vo.EstimateSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.EstimateVO;
import chn.bhmc.dms.mob.api.repair.vo.LtsModelSearchVO;
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
 * @ClassName   : MobEstimateListController.java
 * @Description : 견적현황 Controller
 * @author JongHee Lim
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     JongHee Lim     최초 생성
 * </pre>
 */
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobEstimateListController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author JongHee Lim
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
@Api("维修-服务接待-维修估算查询 ")
@RequestMapping(value = "/api/repair/estimateList")
public class EstimateListApi extends HController {

    @Autowired
    RepairEstimateService RepairEstimateService;

    /**
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    RepairLtsModelMappingService RepairLtsModelMappingService;

    @Autowired
    RepairCommonCodeService RepairCommonCodeService;

    @RequestMapping(value="/selectEstimateListMain.do", method=RequestMethod.GET)
    @ApiOperation("维修估算查询页面加载")
    @ResponseBody
    public BaseJSON selectEstimateListMain(Model model)throws Exception{
    	BaseJSON baseJSON = new BaseJSON();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        //견적상태코드
        model.addAttribute("estStatCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER400", null, langCd));

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", RepairLtsModelMappingService.selectLtsModelsByCondition(searchVO));
        baseJSON.setResult(model);
//        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/est/estimate/baseJsp/selectEstimateListMain.jsp");
//        model.addAttribute("fromWhere", "selectEstimateListMain");
//        model.addAttribute("laborsTemplate", "subTemplate2");
//        model.addAttribute("partsTemplate", "subTemplate3");

        return baseJSON;
    }


    /**
    *
    * 견적서 정보 리스트 조회
    *
    * @param searchVO - 견적서 정보 조회
    * @return
    * @throws Exception
    */
   @ApiOperation("维修估算查询")
   @RequestMapping(value="/selectEstimateListMains.do", method=RequestMethod.POST)
   @ResponseBody
   public BaseJSON selectEstimateListMains(@RequestBody EstimateSearchVO searchVO)throws Exception{
       BaseJSON baseJ = new BaseJSON();
       String dlrCd = LoginUtil.getDlrCd();
       searchVO.setsDlrCd(dlrCd);
       SearchResult result = new SearchResult();
     try {
    	   result.setTotal(RepairEstimateService.selectEstimateListByConditionCnt(searchVO));

           if(result.getTotal() != 0){
               result.setData(RepairEstimateService.selectEstimateListByCondition(searchVO));
           }

           baseJ.setResult(result);
	 } catch (Exception e) {
		 baseJ.setResultCode(1);
		 baseJ.setResultMsg("失败");
	 	e.printStackTrace();
	 }
       return baseJ;
   }

   /**
   *
   * 견적서 정보 조회
   *
   * @param searchVO - 견적서 정보 조회
   * @return
   * @throws Exception
   */
   @ApiOperation("维修估算查询详情页")
   @RequestMapping(value="/selectEstimateManageMains.do", method=RequestMethod.POST)
   @ResponseBody
   public BaseJSON selectEstimateManageMains(@RequestBody EstimateSearchVO searchVO)throws Exception{
	   BaseJSON baseJ = new BaseJSON();
	   EstimateVO estimateVO = new EstimateVO();
	   try {
		   estimateVO= RepairEstimateService.selectEstimateManageByKey(searchVO);
		   baseJ.setResult(estimateVO);
	  } catch (Exception e) {
		  baseJ.setResultCode(1);
		  baseJ.setResultMsg("失败");
		e.printStackTrace();
	  }
       return baseJ;
   }
}
