package chn.bhmc.dms.sal.aap.web;


import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.sal.aap.service.AapInfoService;
import chn.bhmc.dms.sal.aap.vo.AapInfoSearchVO;

/**
 * 계약 대행업무관리
 *
 * @author KimJinSuk
 * @since 2016. 4. 14
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자               수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.14           KimJinSuk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/aap/aapInfo")
public class AapInfoController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * 판매고문 관리 서비스
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;

    /**
     * 대행업무관리 서비스
     */
    @Resource(name="aapInfoService")
    AapInfoService aapInfoService;

    /**
     * 대행업무관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAapInfoMain.do", method = RequestMethod.GET)
    public String selectAapInfoMain(Model model) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);

        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        //int day = cal.get(Calendar.DATE);
        //cal.set(year, month, day+1, 00, 00, 00);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);

        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
            cal.set(year, month, lastDay, 00, 00, 00);
        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);
        String threeMonthBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), dateFormat);

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDate);
        model.addAttribute("threeMonthDay", threeMonthBf);

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //대행업무구분 공통코드 목록
        model.addAttribute("aapWrkDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL021", null, LocaleContextHolder.getLocale().getLanguage()));

        //List<UserVO> saleEmpList = viewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10321", LoginUtil.getDlrCd(), Constants.PERMISSION_READ);
        List<UserVO> saleEmpList = crmCommonService.selectMngScIdListByCondition();
        model.addAttribute("saleEmpDSInfo", saleEmpList);

        return "/sal/aap/aapInfo/selectAapInfoMain";
    }

    /**
     * 계약 대행업무 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAapInfoSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAapInfoSearch(@RequestBody AapInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(aapInfoService.selectAapInfoSearchsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(aapInfoService.selectAapInfoSearchsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 대행업무item조회 팝업
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectAapInfoItemPopup.do", method = RequestMethod.GET)
    public String selectAapInfoItemPopup(Model model) throws Exception{
        //String langCd = LocaleContextHolder.getLocale().getLanguage();
        return "/sal/aap/aapInfo/selectAapInfoItemPopup";
    }

    /**
     * 대행업무 item 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectAapItemSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAapItemSearch() throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        List<CommonCodeVO> list = commonCodeService.selectCommonCodesByCmmGrpCd("SAL021", "Y", langCd);

        SearchResult result = new SearchResult();
        result.setTotal(list.size());

        if(result.getTotal() != 0){
            result.setData(list);
        }
        return result;
    }

}
