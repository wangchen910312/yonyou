package chn.bhmc.dms.mob.ser.ro.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.sal.veh.service.CarInfoService;

import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.ser.ro.service.PreCheckService;
import chn.bhmc.dms.ser.ro.vo.PreCheckSearchVO;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobPreCheckListController.java
 * @Description : 사전점검현황 Controller
 * @author JongHee Lim
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobPreCheckListController  extends HController{

    @Autowired
    PreCheckService preCheckService;

    /**
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;


    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * 사전점검 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/ro/preCheck/__selectPreCheckListMain.do", method = RequestMethod.GET)
    public String __selectPreCheckListMain(Model model) throws Exception {

        //model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM-dd"));
        //model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd") );



        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        //String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);




        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));
        //입고점검유형
        model.addAttribute("carAcptTp", commonCodeService.selectCommonCodesByCmmGrpCd("SER911", null, langCd));

        //사전점검상태
        model.addAttribute("diagStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER023", null, langCd));
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");  // UseYn
        model.addAttribute("carLineList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/mob/ser/ro/preCheck/selectPreCheckListMain";

    }

    @RequestMapping(value="/mob/ser/ro/preCheck/selectPreCheckListMain.do", method = RequestMethod.GET)
    public String selectPreCheckListMain(Model model) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));
        //입고점검유형
        model.addAttribute("carAcptTp", commonCodeService.selectCommonCodesByCmmGrpCd("SER911", null, langCd));

        //사전점검상태
        model.addAttribute("diagStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER023", null, langCd));
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");  // UseYn
        model.addAttribute("carLineList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/ro/preCheck/baseJsp/selectPreCheckListMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    @RequestMapping(value="/mob/ser/ro/preCheck/selectPreCheckListList.do", method = RequestMethod.GET)
    public String selectPreCheckListList(Model model) throws Exception {
        return "/mob/ser/ro/preCheck/selectPreCheckListList";
    }

    /*@RequestMapping(value="/mob/ser/rev/partReservation/selectPreCheckListSubList1.do", method = RequestMethod.GET)
    public String selectPreCheckListSubList1(Model model) throws Exception {
        return "/mob/ser/rev/partReservation/selectPartReservationSubList1";
    }*/

    /**
    *
    * 사전점검  정보 조회
    *
    * @param searchVO - 사전점검  정보 조회
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/mob/ser/ro/preCheck/selectPreCheckListMains.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPreCheckListMains(@RequestBody PreCheckSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(preCheckService.selectPreCheckListByCondition(searchVO));
        result.setTotal(result.getData().size());

        return result;
    }


}
