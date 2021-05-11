package chn.bhmc.dms.mob.cmm.sci.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.ZipCodeService;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

/**
 * 공통팝업 컨트롤러
 *
 * @author Sung sin Park
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Sung sin Park            최초 생성
 * </pre>
 */

@Controller
public class MobCommonPopupController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 보험가입정보관리 서비스 - 주소지: 성, 시, 구 호출
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;



    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource (name = "dealerService")
    DealerService dealerService;


    @Resource(name="zipCodeService")
    ZipCodeService zipCodeService;


    @RequestMapping(value = "/mob/cmm/sci/commonPopup/selectUserPopup.do", method = RequestMethod.GET)
    public String selectUserPopup1(Model model) {

        model.addAttribute("langCd", LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/cmm/sci/commonPopup/baseJsp/selectUserPopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

    @RequestMapping(value = "/mob/cmm/sci/commonPopup/selectUserListPopup.do", method = RequestMethod.GET)
    public String selectUserPopup(Model model) {

        model.addAttribute("langCd", LocaleContextHolder.getLocale().getLanguage());
        return "/mob/cmm/sci/commonPopup/selectUserListPopup";
    }


    /**
     * 우편번호 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     *
     */
    // 우편번호
    @RequestMapping(value = "/mob/cmm/sci/commonPopup/selectZipCodePopup.do", method = RequestMethod.GET)
    public String selectZipCodePopup(Model model) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        DealerVO dealerVo = dealerService.selectDealerByKey(mobLoginVO.getDlrCd());
        model.addAttribute("zipNo", dealerVo.getZipNo());
        String sZipCd = dealerVo.getZipNo();

        //get sungNm and other data from zipcode db table
        ZipCodeSearchVO zipCodeSearchVO = new ZipCodeSearchVO();  // make a new ZipCodesearchVO
        zipCodeSearchVO.setsZipCd(sZipCd);  // put the sZipCd para to ZipCodesearchVO for using selectZipCodesByCondition() which is in zipCodeService.
        model.addAttribute("zipInfoList",zipCodeService.selectZipCodesByCondition(zipCodeSearchVO));
        model.addAttribute("gubunList", commonCodeService.selectCommonCodesByCmmGrpCd("COM018", null, LocaleContextHolder.getLocale().getLanguage()));

        model.addAttribute("langCd", LocaleContextHolder.getLocale().getLanguage());

        //성목록 - 03.04 14:57 정주영(매우 중요)
        model.addAttribute("sungCdList", incJoinInfoService.selectSungCd(null));

        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, LocaleContextHolder.getLocale().getLanguage()));

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/cmm/sci/commonPopup/baseJsp/selectZipCodePopup.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

    /**
     * 우편번호 팝업 성 리스트화면을 출력한다.
     * @return
     *
     */
    @RequestMapping(value = "/mob/cmm/sci/commonPopup/selectZipCodeListPopup.do", method = RequestMethod.GET)
    public String selectZipCodeListPopup(Model model) {

        model.addAttribute("langCd", LocaleContextHolder.getLocale().getLanguage());
        return "/mob/cmm/sci/commonPopup/selectZipCodeListPopup";
    }

    /**
     * 우편번호 팝업 도시 리스트화면을 출력한다.
     * @return
     *
     */
    @RequestMapping(value = "/mob/cmm/sci/commonPopup/selectZipCodeListPopup2.do", method = RequestMethod.GET)
    public String selectZipCodeListPopup2(Model model, @RequestParam("sungCd") String sungCd) {

        model.addAttribute("langCd", LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("sungCd", sungCd);
        return "/mob/cmm/sci/commonPopup/selectZipCodeListPopup2";
    }

    /**
     * 우편번호 팝업 거리 리스트화면을 출력한다.
     * @return
     *
     */
    @RequestMapping(value = "/mob/cmm/sci/commonPopup/selectZipCodeListPopup3.do", method = RequestMethod.GET)
    public String selectZipCodeListPopup3(Model model, @RequestParam("sungCd") String sungCd, @RequestParam("cityCd") String cityCd) {

        model.addAttribute("langCd", LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("sungCd", sungCd);
        model.addAttribute("cityCd", cityCd);
        return "/mob/cmm/sci/commonPopup/selectZipCodeListPopup3";
    }


}
