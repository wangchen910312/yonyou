package chn.bhmc.dms.sal.usc.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.sal.usc.service.PurcEvalService;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSaveVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;



/**
 * 중고차평가관리
 *
 * @author Kim yewon
 * @since 2016. 6. 10
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 6. 10           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/usc/purcEval")
public class UsedCarEvalMngController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 평가매입 서비스
     */
    @Resource(name="purcEvalService")
    PurcEvalService purcEvalService;


    /**
     * 차량,모델,OCN,색상,로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * 중고차평가관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectEvalMngMain.do", method = RequestMethod.GET)
    public String selectEvalMngMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //중고차매입상태 SAL044
        model.addAttribute("purcStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL044", null, langCd));
        //차량상태 SAL001
        model.addAttribute("carStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));
        //연료구분 SAL114
        model.addAttribute("fuelCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL114", null, langCd));
        //구동방식(미션구분) SAL121
        model.addAttribute("drvMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL121", null, langCd));
        //승사용구분 SAL120
        model.addAttribute("pcDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));
        //경매구분 SAL050
        model.addAttribute("auctCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL050", null, langCd));
        //차량인도여부 SAL051
        model.addAttribute("carDlYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL051", null, langCd));

        String toDay = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("toDay", toDay);

        return "/sal/usc/purcEval/selectEvalMngMain";
    }



    /**
     * 중고차평가관리 - 경매정보를 등록한다.
     * @param PurcEvalSaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiSaveAuctInfo.do", method = RequestMethod.POST)
    public @ResponseBody boolean multiSaveAuctInfo(@Validated @RequestBody PurcEvalSaveVO saveVO) throws Exception {

        purcEvalService.multiSaveAuctInfo(saveVO);

        return true;

    }



}
