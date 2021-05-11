package chn.bhmc.dms.sal.svo.web;

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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.svo.service.PackageWorkService;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkSearchVO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 집단판매업무심사
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.18         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/svo/packageWork")
public class PackageWorkJudgeController extends HController {

    /**
     * 집단판매 업무 서비스
     */
    @Resource(name="packageWorkService")
    PackageWorkService packageWorkService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * 집단판매업무심사 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectPackageSalesWorkJudgeMain.do", method = RequestMethod.GET)
    public String selectPackageSalesWorkJudgeMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 상태 SAL184 : APPROVE_CD
        model.addAttribute("stateTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL184", null, langCd));
        // 항목 SAL151
        model.addAttribute("atcDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL151", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 판매지역(딜러지역) SAL146
        model.addAttribute("distCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL146", null, langCd));


        return "/sal/svo/packageWork/selectPackageSalesWorkJudgeMain";
    }

    /**
     * 집단판매업무심사 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectPackageSalesWorkJudge.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackageSalesWorkJudge(@RequestBody PackageSalesWorkSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(packageWorkService.selectPackageSalesWorkJudgesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(packageWorkService.selectPackageSalesWorkJudgesByCondition(searchVO));
        }

        return result;
    }


    /**
     * 집단판매업무 심사 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectPackageSalesWorkJudgePopup.do", method = RequestMethod.GET)
    public String selectPackageSalesWorkJudgePopup(Model model) throws Exception{

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 항목 SAL151
        model.addAttribute("atcDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL151", null, LocaleContextHolder.getLocale().getLanguage()));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/svo/packageWork/selectPackageSalesWorkJudgePopup";
    }

    /**
     * 집단판매업무 심사 팝업 내용조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectPackageSalesWorkJudgePopupContain.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackageSalesWorkJudgePopupContain(@RequestBody PackageSalesWorkSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(packageWorkService.selectPackageSalesWorkJudgePopupContainsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(packageWorkService.selectPackageSalesWorkJudgePopupContainsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 집단판매업무 심사 팝업 - 심사내역 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectPackageSalesWorkJudgePopupEvl.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackageSalesWorkJudgePopupEvl(@RequestBody PackageSalesWorkSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(packageWorkService.selectPackageSalesWorkPopupEvlsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(packageWorkService.selectPackageSalesWorkPopupEvlsByCondition(searchVO));
        }

        return result;
    }

    /**
    *
    * 집단판매업무 심사 확정
    * @param saveVO
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/confirmPackageSalesWorkJudgePopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmPackageSalesWorkJudgePopup(@Validated @RequestBody PackageSalesWorkVO confirmVO) throws Exception {
        packageWorkService.confirmPackageSalesWorkJudgePopups(confirmVO);
        return true;
    }


}
