package chn.bhmc.dms.mob.ser.rcv.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.ser.rcv.service.ServiceReceiveDetailService;
import chn.bhmc.dms.ser.rcv.service.ServiceReceiveService;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSaveVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSearchVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveVO;


@Controller
public class MobServiceReceiveController extends HController {

     /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="serviceReceiveService")
    ServiceReceiveService serviceReceiveService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    @Autowired
    ServiceReceiveDetailService serviceReceiveDetailService;

    /**
     * 수납 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/rcv/serviceReceive/__selectServiceReceiveMain.do", method = RequestMethod.GET)
    public String __selectServiceReceiveMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());


        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat);
        String oneMonthDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt",sysDate);
        model.addAttribute("sevenDtBf",sevenDtBf);
        model.addAttribute("oneMonthDtBf",oneMonthDtBf);


      //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //수납상태
        model.addAttribute("receiveCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER070", null, langCd));
        //영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        //지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        //지불기한
        model.addAttribute("paymPridCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
       //시스탬일자
       model.addAttribute("sysDate", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
       //청산완료여부
       model.addAttribute("paymYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

       return "/mob/ser/rcv/serviceReceive/selectServiceReceiveMain";

    }

    /**
     * 수납 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/rcv/serviceReceive/selectServiceReceiveMain.do", method = RequestMethod.GET)
    public String selectServiceReceiveMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());


        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat);
        String oneMonthDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt",sysDate);
        model.addAttribute("sevenDtBf",sevenDtBf);
        model.addAttribute("oneMonthDtBf",oneMonthDtBf);


      //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //수납상태
        model.addAttribute("receiveCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER070", null, langCd));
        //영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        //지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        //지불기한
        model.addAttribute("paymPridCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
       //시스탬일자
       model.addAttribute("sysDate", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
       //청산완료여부
       model.addAttribute("paymYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

       model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/rcv/serviceReceive/baseJsp/selectServiceReceiveMain.jsp");
       return "/ZnewMob/templatesNewMob/mobTemplateA";

    }


    @RequestMapping(value="/mob/ser/rcv/serviceReceive/selectServiceReceiveList.do", method = RequestMethod.GET)
    public String selectServiceReceiveList(Model model) throws Exception {
       return "/mob/ser/rcv/serviceReceive/selectServiceReceiveList";
    }


    @RequestMapping(value="/mob/ser/rcv/serviceReceive/selectServiceReceiveSubList1.do", method = RequestMethod.GET)
    public String selectServiceReceiveSubList1(Model model) throws Exception {
       return "/mob/ser/rcv/serviceReceive/selectServiceReceiveSubList1";
    }



    /**
     * 수납 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/mob/ser/rcv/serviceReceive/selectServiceReceives.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectServiceReceives(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(serviceReceiveService.selectServiceReceiveByConditionCnt(searchVO));
         if(result.getTotal() != 0){
            result.setData(serviceReceiveService.selectServiceReceiveByCondition(searchVO));
        }

        return result;

    }

    /**
     * 수납  정보를 수정한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/mob/ser/rcv/serviceReceive/updateServiceReceive.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateServiceReceive(@Validated @RequestBody ServiceReceiveVO serviceReceiveVO) throws Exception{

        serviceReceiveService.updateServiceReceive(serviceReceiveVO);

        return true;
    }

    /**
     * 수납  정보를 삭제한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/mob/ser/rcv/serviceReceive/deleteServiceReceive.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteServiceReceive(@Validated @RequestBody ServiceReceiveVO serviceReceiveVO) throws Exception{

        serviceReceiveService.deleteServiceReceive(serviceReceiveVO);

        return true;
    }

    /**
     * 수납디테일 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return
     */
    @RequestMapping(value="/mob/ser/rcv/serviceReceive/selectServiceReceiveDetails.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectCalculateDetails(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(serviceReceiveDetailService.selectServiceReceiveDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(serviceReceiveDetailService.selectServiceReceiveDetailsByCondition(searchVO));
        }

        return result;

     }

    /**
     * 수납  디테일을 등록/수정한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/mob/ser/rcv/serviceReceive/multiServiceReceiveDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertServiceReceive(@Validated @RequestBody ServiceReceiveSaveVO serviceReceiveSaveVO) throws Exception{

        serviceReceiveDetailService.multiServiceReceiveDetail(serviceReceiveSaveVO);

        return true;
    }


    @RequestMapping(value="/mob/ser/rcv/serviceReceive/selectServiceReceiveDetailsHistList.do", method = RequestMethod.GET)
    public String selectServiceReceiveDetailsHistList(Model model) throws Exception {
       return "/mob/ser/rcv/serviceReceive/selectServiceReceiveDetailsHistList";
    }
}
