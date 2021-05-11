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
import chn.bhmc.dms.mob.api.repair.service.RepairReservationReceiptService;
import chn.bhmc.dms.mob.api.repair.service.RepairServiceCommonService;
import chn.bhmc.dms.mob.api.repair.service.RepairServiceLaborService;
import chn.bhmc.dms.mob.api.repair.service.RepairServicePartService;
import chn.bhmc.dms.mob.api.repair.vo.ReservationReceiptSearchVO;
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
 * @ClassName   : MobReservationReceiptController.java
 * @Description : 예약현황 컨트롤러
 * @author JongHee Lim
 * @since 2016. 5. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 4.     JongHee Lim     최초 생성
 * </pre>
 */
@Api("维修-预约服务-维修预约查询 ")
@RequestMapping(value = "/api/repair/ReservationReceipt")
@Controller
public class ReservationReceiptApi extends HController {

    @Autowired
    RepairReservationReceiptService RepairReservationReceiptService;

    @Autowired
    RepairCommonCodeService RepairCommonCodeService;

    @Autowired
    RepairServiceLaborService RepairServiceLaborService;

    @Autowired
    RepairServicePartService RepairServicePartService;


    @Autowired
    RepairServiceCommonService RepairServiceCommonService;

    @ApiOperation("维修预约查询页面显示")
    @ResponseBody
    @RequestMapping(value="/selectReservationReceiptMain.do", method = RequestMethod.GET)
    public BaseJSON selectReservationReceiptMain(Model model) throws Exception {

    	BaseJSON baseJSON =new BaseJSON();
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());
        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 예약구분
        model.addAttribute("resvTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));

        // 공통코드 : 예약상태
        model.addAttribute("resvReptStatCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER015", null, langCd));

        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("preFixId", "RE");
        baseJSON.setResult(model);
        return baseJSON;

    }

    /**
     * 查询维修列表数据list
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return
     */
    @ApiOperation("查询维修列表数据")
    @RequestMapping(value="/selectReservationReceiptsList.do",  method = RequestMethod.POST)
    public @ResponseBody BaseJSON selectReservationReceiptsList(@RequestBody ReservationReceiptSearchVO searchVO) throws Exception {

    	BaseJSON baseJSON = new BaseJSON();
        SearchResult result = new SearchResult();

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        result.setTotal(RepairReservationReceiptService.selectReservationReceiptListByConditionCnt(searchVO));

        if(result.getTotal() != 0 ){
            result.setData(RepairReservationReceiptService.selectReservationReceiptListByCondition(searchVO));
            baseJSON.setResult(result);
        }
        return baseJSON;

    }

    /**
    *
    * 点击列表条目
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
	@ApiOperation("列表条目查询无数据")
   @RequestMapping(value="/selectCustDemands.do" , method=RequestMethod.POST)
   @ResponseBody
   public BaseJSON selectCustDemands(@RequestBody TabInfoSearchVO searchVO)throws Exception{

		BaseJSON baseJSON = new BaseJSON();
       SearchResult result = new SearchResult();
       searchVO.setsDlrCd(LoginUtil.getDlrCd());

       result.setData(RepairServiceCommonService.selectCustDemandsByCondition(searchVO));

       result.setTotal(result.getData().size());
       baseJSON.setResult(result);
       return baseJSON;
   }

	/**
    *
    * 查询
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
	@ApiOperation("列表条目查询无数据")
   @RequestMapping(value="/selectEtcIssues.do" , method=RequestMethod.POST)
   @ResponseBody
   public BaseJSON selectEtcIssues(@RequestBody TabInfoSearchVO searchVO)throws Exception{

		BaseJSON baseJSON = new BaseJSON();
       SearchResult result = new SearchResult();
       searchVO.setsDlrCd(LoginUtil.getDlrCd());

       result.setData(RepairServiceCommonService.selectEtcIssuesByCondition(searchVO));

       result.setTotal(result.getData().size());

       baseJSON.setResult(result);
       return baseJSON;
   }

   /**
    * 부품 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
    * @return
    */
	@ApiOperation("列表条目查询有维修项目选择数据")
   @RequestMapping(value="/selectServiceParts.do",  method = RequestMethod.POST)
   public @ResponseBody BaseJSON selectReservationParts(@RequestBody TabInfoSearchVO searchVO) throws Exception {

		BaseJSON baseJSON = new BaseJSON();
       SearchResult result = new SearchResult();
       searchVO.setsDlrCd(LoginUtil.getDlrCd());

       result.setTotal(RepairServicePartService.selectServicePartsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(RepairServicePartService.selectServicePartsByCondition(searchVO));
           baseJSON.setResult(result);
       }
       return baseJSON;

    }

   /**
    * 공임 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
    * @return
    */
	@ApiOperation("列表条目查询有维修项目数据")
   @RequestMapping(value="/selectServiceLabors.do",  method = RequestMethod.POST)
   public @ResponseBody BaseJSON selectReservationLabors(@RequestBody TabInfoSearchVO searchVO) throws Exception {

		BaseJSON baseJSON = new BaseJSON();
       SearchResult result = new SearchResult();

       searchVO.setsDlrCd(LoginUtil.getDlrCd());

       result.setTotal(RepairServiceLaborService.selectServiceLaborsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(RepairServiceLaborService.selectServiceLaborsByCondition(searchVO));
           baseJSON.setResult(result);
       }
       return baseJSON;

    }

}