package chn.bhmc.dms.mob.crm.cso.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesActiveSearchVO;
import chn.bhmc.dms.crm.cso.vo.TotalSchedulerVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

/**
 * 영업활동 스케줄 컨트롤러
 *
 * @author Park Sung sin
 * @since 2016.04.28.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.28         Park Sung sin            최초 생성
 * </pre>
 */

@RequestMapping("/mob/crm/cso/salesActive")
@Controller
public class MobSalesActiveCalendarController extends HController {

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
     * 마케팅 관리 서비스
     */
    @Resource(name="marketingCampaignService")
    MarketingCampaignService marketingCampaignService;

    /**
     * 영업활동 스케줄 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSalesActiveCalendarMain.do", method = RequestMethod.GET)
    public String selectSalesActiveCalendarMain(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String SysYM = DateUtil.getDate("yyyy-MM");


        //일단력에서 이전 버튼 클릭시 로직 구현
        if(request.getParameter("searchDate") !=null && !"".equals(request.getParameter("searchDate"))){
            sysDate = request.getParameter("searchDate");
            SysYM = request.getParameter("searchDate").substring(0,7);
        }

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("SysYM", SysYM);

        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> users = userService.selectUsersByCondition(searchVO);
        model.addAttribute("users", users);

        //영업활동 상세
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));           // 연락방식코드
        model.addAttribute("salesActiveStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM323", null, langCd));   // 영업활동상태코드

        //시승내역 상세
        model.addAttribute("tdrvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM403", null, langCd));          // 시승 타입/ 판매전망
        model.addAttribute("custStsfCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM406", null, langCd));      // 고객만족도
        model.addAttribute("saleFcstCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));

        //내방예약 상세
        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
        List<MarketingCampaignVO> vsitSrcDetlContList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("csltTmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM201", null, langCd));    // 상담시간
        model.addAttribute("vsitSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM202", null, langCd)); // 내방출처
        model.addAttribute("vsitSrcDetlContList", vsitSrcDetlContList); // 내방출처상세
        model.addAttribute("vsitStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM207", null, langCd)); // 내방상태



        model.addAttribute("salesActiveTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));     // 영업활동유형코드
        //model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));      // 판매기회단계 CRM211
        model.addAttribute("schedulerTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM362", null, langCd));         // 스케줄타입


        return "/mob/crm/cso/salesActive/selectSalesActiveCalendarMain";
    }


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

        //조회 user 세팅
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        String  userId = mobLoginVO.getUserId();
        searchVO.setsScId(userId);

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
     * 영업활동 스케줄 데이터 건수를 조회한다. (모바일 전용)
     * @param SalesActiveSearchVO - 판매고문, 시작월, 종료월
     * @return
     */
    @RequestMapping(value = "/selectSalesActiveCalendarsCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesActiveCalendarsCnt(@RequestBody SalesActiveSearchVO searchVO, HttpServletRequest request) throws Exception {


        /******************************************
         *** 날짜 검색 조건 시작  ( 활동 스케줄러에서.. 당월 검색 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();


        //조회 user 세팅
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        String  userId = mobLoginVO.getUserId();
        searchVO.setsScId(userId);

        if(searchVO.getsStartDt() == null ){
            searchVO.setsStartDt(startCal.getTime());
        }

        int year;
        int month;
        int day;

        startCal.setTime(searchVO.getsStartDt());

        if("day".equals(request.getParameter("dateFl"))){ //날짜 선택일 경우

            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DAY_OF_MONTH);;

            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsStartDt(startCal.getTime());             // 시작일 설정

            startCal.set(year, month, day+1, 00, 00, 00);
            searchVO.setsEndDt(startCal.getTime());               // 종료일 설정 (시작일 + 1)
        } else {  //달선택일 경우

            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = 1;

            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsStartDt(startCal.getTime());             // 시작일 설정 (매월 1일)

            startCal.set(year, month+1, day, 00, 00, 00);
            searchVO.setsEndDt(startCal.getTime());               // 종료일 설정 (시작월 + 1달)
        }


        /******************************************
         *** 날짜 검색 조건 시작 ***********************
         ******************************************/

        SearchResult result = salesActiveMgmtService.selectSalesTotalActiveCalendars(searchVO);

        @SuppressWarnings("unchecked")
        List<TotalSchedulerVO> totalSchedulerList = (List<TotalSchedulerVO>) result.getData();

        int SchedulerTp01 = 0;
        int SchedulerTp02 = 0;
        int SchedulerTp03 = 0;

        for (TotalSchedulerVO totalSchedulerVO  : totalSchedulerList) {
                // SchedulerTp : 01(내방) / 02(시승) / 03(영업자 스케줄)
                if("01".equals(totalSchedulerVO.getSchedulerTp())){
                    SchedulerTp01++;
                }else if("02".equals(totalSchedulerVO.getSchedulerTp())){
                    SchedulerTp02++;
                }else if("03".equals(totalSchedulerVO.getSchedulerTp())){
                    SchedulerTp03++;
                }
            //}
        }

        Map<String, Object> resMap = new HashMap<String, Object>();

        resMap.put("SchedulerTp01", SchedulerTp01);
        resMap.put("SchedulerTp02", SchedulerTp02);
        resMap.put("SchedulerTp03", SchedulerTp03);
        List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();

        data.add(resMap);

        result.setData(data);

        return result;
    }

}