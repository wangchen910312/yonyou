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
import chn.bhmc.dms.mob.api.repair.service.RepairPartReservationService;
import chn.bhmc.dms.mob.api.repair.service.RepairServiceCommonService;
import chn.bhmc.dms.mob.api.repair.vo.PartReservationSearchVO;
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
 * @ClassName   : MobPartReservationController.java
 * @Description : 부품 예약현황 Controller
 * @author JongHee Lim
 * @since 2016. 6. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 3.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
@Api("维修-预约服务-配件预约服务查询 ")
@RequestMapping(value = "/api/repair/PartReservation")
public class PartReservationApi extends HController {

    @Autowired
    RepairPartReservationService RepairPartReservationService;

    @Autowired
    RepairCommonCodeService RepairCommonCodeService;

    @Autowired
    RepairServiceCommonService RepairServiceCommonService;

    @ApiOperation("配件维修预约查询页面显示")
    @ResponseBody
    @RequestMapping(value="/selectPartReservationMain.do", method = RequestMethod.GET)
    public BaseJSON selectPartReservationMain(Model model) throws Exception {



    	BaseJSON baseJSON =new BaseJSON();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 공통코드 : 부품예약유형
        model.addAttribute("partResvTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER016", null, langCd));
     // 공통코드 : 부품예약상태
        model.addAttribute("partResvStatCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER019", null, langCd));
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
        // 기타유형
        model.addAttribute("etcTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        // 성별
        model.addAttribute("sexCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        // 공통코드 : 구원유형
        model.addAttribute("rescueTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER111", null, langCd));
        // 공통코드 : 여부
        model.addAttribute("useYnDs", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        baseJSON.setResult(model);
        return baseJSON;

    }

    /**
     * 配件预约服务查询列表list
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return
     */
    @ApiOperation("配件预约服务查询列表")
    @RequestMapping(value="/selectPartReservations.do",  method = RequestMethod.POST)
    public @ResponseBody BaseJSON selectReservationReceipts(@RequestBody PartReservationSearchVO searchVO) throws Exception {

    	BaseJSON baseJSON =new BaseJSON();
        SearchResult result = new SearchResult();

        result.setTotal(RepairPartReservationService.selectPartReservationByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(RepairPartReservationService.selectPartReservationByCondition(searchVO));
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
	@ApiOperation("列表条目查询")
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

}