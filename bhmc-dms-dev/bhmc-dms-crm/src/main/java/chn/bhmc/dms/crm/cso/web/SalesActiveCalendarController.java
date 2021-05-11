package chn.bhmc.dms.crm.cso.web;

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

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesActiveSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesActiveVO;

/**
 * 영업활동 스케줄 컨트롤러
 *
 * @author in moon lee
 * @since 2016.04.28.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.28         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/cso/salesActive")
@Controller
public class SalesActiveCalendarController extends HController {

    /**
     * 영업활동 관리 서비스
     */
    @Resource(name="salesActiveMgmtService")
    SalesActiveMgmtService salesActiveMgmtService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 영업활동 스케줄 메인 화면을 출력한다.
     * @return
     */
//    @RequestMapping(value = "/selectSalesActiveCalendarMain.do", method = RequestMethod.GET)
//    public String selectSalesActiveCalendarMain(Model model ) throws Exception {
//
//        String langCd = LocaleContextHolder.getLocale().getLanguage();
//
//        model.addAttribute("sysDate", sysDate);
//
//        List<UserVO> users = userService.selectUsersByRoleId(LoginUtil.getDlrCd(), "ROLE_CRM", Constants.SYS_CD_DLR);
//        model.addAttribute("users", users);
//
//        model.addAttribute("salesActiveTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));     // 영업활동유형코드
//        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계
//        model.addAttribute("schedulerTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM362", null, langCd));         // 스케줄타입
//
//        return "/crm/cso/salesActive/selectSalesActiveCalendarMain";
//    }

    /**
     * 영업활동 스케줄 메인 화면을 출력한다.
     * @return
     */
//    @RequestMapping(value = "/selectSalesActiveCalendarDayMain.do", method = RequestMethod.GET)
//    public String selectSalesActiveCalendarDayMain(Model model
//                                                        , @RequestParam(value="sScId") String sScId
//    ) throws Exception {
//
//        String langCd = LocaleContextHolder.getLocale().getLanguage();
//
//        model.addAttribute("sScId", sScId);
//
//        model.addAttribute("sysDate", sysDate);
//
//
//        List<UserVO> users = userService.selectUsersByRoleId(LoginUtil.getDlrCd(), "ROLE_CRM", Constants.SYS_CD_DLR);
//        model.addAttribute("users", users);
//
//        model.addAttribute("salesActiveTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));     // 영업활동유형코드
//        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계
//
//        return "/crm/cso/salesActive/selectSalesActiveCalendarDayMain";
//    }

    /**
     * 영업활동 스케줄 목록 데이터를 조회한다.
     * @param SalesActiveSearchVO - 판매고문, 시작월, 종료월
     * @return
     */
    @RequestMapping(value = "/selectSalesActiveCalendars.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesActiveCalendars(@RequestBody SalesActiveSearchVO searchVO) throws Exception {


        /******************************************
         *** 날짜 검색 조건 시작  ( 활동 스케줄러에서.. 당월 검색 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();

        if(searchVO.getsStartDt() == null ){
            searchVO.setsStartDt(startCal.getTime());
        }

        int year;
        int month;
        int day;

        startCal.setTime(searchVO.getsStartDt());
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        day = 1;

        startCal.set(year, month, day, 00, 00, 00);
        searchVO.setsStartDt(startCal.getTime());             // 시작일 설정 (매월 1일)

        startCal.set(year, month+1, day, 00, 00, 00);
        searchVO.setsEndDt(startCal.getTime());               // 종료일 설정 (시작월 + 1달)
        /******************************************
         *** 날짜 검색 조건 시작 ***********************
         ******************************************/

        return salesActiveMgmtService.selectSalesTotalActiveCalendars(searchVO);

    }


    /**
     * 영업활동 스케줄 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSalesActiveCalendarPopup.do", method = RequestMethod.GET)
    public String selectSalesActiveCalendarPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));           // 연락방식코드
        model.addAttribute("salesActiveTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));     // 영업활동유형코드
        model.addAttribute("salesActiveStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM323", null, langCd));   // 영업활동상태코드

        return "/crm/cso/salesActive/selectSalesActiveCalendarPopup";
    }


    /**
     * 영업 스케줄 상세 정보를 조회한다.
     * @param SalesActiveSearchVO - 영업활동번호
     * @return
     */
    @RequestMapping(value = "/selectSalesActiveCalendarByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SalesActiveVO selectSalesActiveCalendarByKey(@RequestBody SalesActiveSearchVO searchVO) throws Exception {

        SalesActiveVO vo = salesActiveMgmtService.selectSalesActiveMgmtByKey(searchVO);
        return vo;

    }


    /**
     * 영업활동 스케줄 정보를 저장 한다.
     * @param SalesActiveVO - 영업활동 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiSalesActiveCalendars.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiSalesActiveCalendars(@Validated @RequestBody SalesActiveVO salesActiveVO)throws Exception {

        // 영업활동관리에서 등록후 영업활동 번호를 return
        String salesActiveNo;
        salesActiveNo = salesActiveMgmtService.multiSalesActiveMgmts(salesActiveVO);
        return salesActiveNo;

    }


}