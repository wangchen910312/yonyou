package chn.bhmc.dms.mob.api.part.controller;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

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
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.service.PartPartReservationService;
import chn.bhmc.dms.mob.api.part.service.PartServicePartService;
import chn.bhmc.dms.mob.api.part.service.PartSystemConfigInfoService;
import chn.bhmc.dms.mob.api.part.vo.PartReservationSearchVO;
import chn.bhmc.dms.mob.api.part.vo.TabInfoSearchVO;
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
@RequestMapping("/api/part/PartReservationCopy")
@Api("配件预约")
public class PartReservationCopyApi extends HController {

    /**
     * 부품예약 서비스
     */
    @Autowired
    PartPartReservationService PartPartReservationService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    PartCommonCodeService PartCommonCodeService;

    @Resource(name="PartSystemConfigInfoService")
    PartSystemConfigInfoService PartSystemConfigInfoService;

    /**
     * 공통부품 서비스
     */
    @Resource(name="PartServicePartService")
    PartServicePartService PartServicePartService;

    /**
     * 부품예약접수 메인 화면을 출력한다.
     * @return
     */
    @ApiOperation("配件预约(页面加载)")
    @RequestMapping(value="/selectPartReservationMain.do", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON selectPartReservationMain(Model model) throws Exception {

    	BaseJSON baseJSON = new BaseJSON();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = PartSystemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        // 공통코드 : 부품예약유형
        model.addAttribute("partResvTpCdList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("SER016", null, langCd));
     // 공통코드 : 부품예약상태
        model.addAttribute("partResvStatCdList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("SER019", null, langCd));
        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 예약구분
        model.addAttribute("resvTpCdList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", PartCommonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", PartCommonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        // 성별
        model.addAttribute("sexCdList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        // 공통코드 : 구원유형
        model.addAttribute("rescueTpCdList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("SER111", null, langCd));
        // 공통코드 : 여부
        model.addAttribute("useYnDs", PartCommonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        model.addAttribute("sParResvEndDt", sysDate);
        model.addAttribute("sParResvStartDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "PRE");
        model.addAttribute("preFixTp", "PRESTATUS");
        //model.addAttribute("sVinNo", sVinNo);

        //model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/par/cpm/partReservationCopy/baseJsp/selectPartReservationMain.jsp");
        baseJSON.setResult(model);
        return baseJSON;
    }

    @RequestMapping(value="/mob/par/pcm/partReservation/selectPartReservationList.do", method = RequestMethod.GET)
    public String selectPartReservationList(Model model) throws Exception {
        return "/mob/par/pcm/partReservationCopy/selectPartReservationList";
    }

    @RequestMapping(value="/mob/par/pcm/partReservation/selectPartReservationSubList1.do", method = RequestMethod.GET)
    public String selectPartReservationSubList1(Model model) throws Exception {
        return "/mob/par/pcm/partReservationCopy/selectPartReservationSubList1";
    }


//    /**与下方方法名重复
//     * 예약접수 목록 데이터를 조회한다.
//     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
//     * @return
//     */
//    @RequestMapping(value="/mob/par/pcm/partReservation/selectPartReservations",  method = RequestMethod.POST)
//    public @ResponseBody SearchResult selectReservationReceipts(@RequestBody PartReservationSearchVO searchVO) throws Exception {
//
//        SearchResult result = new SearchResult();
//
//        result.setTotal(partReservationService.selectPartReservationByConditionCnt(searchVO));
//
//        if(result.getTotal() != 0){
//            result.setData(partReservationService.selectPartReservationByCondition(searchVO));
//        }
//
//        return result;
//
//     }

    /**
     * 예약접수 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return
     */
    @RequestMapping(value="/selectReservationReceipts.do",  method = RequestMethod.POST)
    @ApiOperation("配件预约查询(主)")
    public @ResponseBody BaseJSON selectReservationReceipts(@RequestBody PartReservationSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(PartPartReservationService.selectPartReservationByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(PartPartReservationService.selectPartReservationByCondition(searchVO));
        }
        BaseJSON json = new BaseJSON();
        json.setResult(result);
        return json;

     }

//    /**
//     * 예약,부품,공임을 등록/수정/취소한다.
//     * @param saveVO - 예약접수 등록/수정/취소 목록을 포함하는 SaveVO
//     * @param bindingResult
//     * @return
//     */
//    @RequestMapping(value = "/mob/par/pcm/partReservation/multiPartReservation.do", method = RequestMethod.POST)
//    public @ResponseBody String multiReservationReceipt(@Validated @RequestBody PartReservationSaveVO partRreservationSaveVO, BindingResult bindingResult) throws Exception {
//
//        String resvDocNo = partReservationService.multiPartReservation(partRreservationSaveVO);
//
//        return resvDocNo;
//
//    }
//
//    /**
//     * 예약접수 상세 데이터를 조회한다.
//     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
//     * @return
//     */
//    @RequestMapping(value="/mob/par/pcm/partReservation/selectPartReservationByKey.do",  method = RequestMethod.POST)
//    public @ResponseBody PartReservationVO selectReservationReceiptByKey(@RequestBody PartReservationSearchVO searchVO) throws Exception {
//
//        return partReservationService.selectPartReservationByKey(searchVO);
//
//     }

    /**
     * 부품 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return
     */
    @RequestMapping(value="/selectReservationParts.do",  method = RequestMethod.POST)
    @ApiOperation("配件预约查询(明细)")
    public @ResponseBody BaseJSON selectReservationParts(@RequestBody TabInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(PartServicePartService.selectServicePartsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(PartServicePartService.selectServicePartsByCondition(searchVO));
        }
        BaseJSON json = new BaseJSON();
        json.setResult(result);
        return json;

     }



}