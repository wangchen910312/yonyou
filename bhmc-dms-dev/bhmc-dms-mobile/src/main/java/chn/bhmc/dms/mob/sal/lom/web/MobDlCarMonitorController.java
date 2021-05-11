package chn.bhmc.dms.mob.sal.lom.web;

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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.lom.service.TpVehicleMonitoringService;
import chn.bhmc.dms.sal.lom.vo.TpVehicleConditionSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobDlCarMonitorController
 * @Description : 클래스 설명을 기술합니다.
 * @author Park Sung sin
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Park Sung sin     최초 생성
 * </pre>
 */
@Controller
public class MobDlCarMonitorController extends HController {
    /**
     * TP차량모니터링 서비스
     */
    @Resource(name="tpVehicleMonitoringService")
    TpVehicleMonitoringService tpVehicleMonitoringService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;
    /**
     * TP차량모니터링 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/sal/lom/dlCarMonitor/selectDlCarMonitorMain.do", method = RequestMethod.GET)
    public String selectDlCarMonitorMain(Model model, HttpServletRequest request) throws Exception {


        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        //String oneDay  = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -1), dateFormat);
        model.addAttribute("toDay", sysDate);
        //model.addAttribute("oneDay", oneDay);
        model.addAttribute("oneDay", sysDate);

        model.addAttribute("toDayFrom", oneDay);
        model.addAttribute("toDayTo", sysDate);


        // 운송회사 SAL057
        model.addAttribute("tpCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL057", null, LocaleContextHolder.getLocale().getLanguage()));


        return "/mob/sal/lom/dlCarMonitor/selectDlCarMonitorMain";
    }


    /**
     * TP차량모니터링 목록
     * @return
     */
    @RequestMapping(value = "/mob/sal/lom/dlCarMonitor/selectDlCarMonitorList.do", method = RequestMethod.GET)
    public String selectDlCarMonitorList(Model model)  throws Exception  {

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", sysDate);

        // 운송회사 SAL057
        model.addAttribute("tpCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL057", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/mob/sal/lom/dlCarMonitor/selectDlCarMonitorList";
    }

    /**
     * TP차량모니터링 목록 데이터를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mob/sal/lom/dlCarMonitor/selectDlCarMonitorCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDlCarMonitorCondition(@RequestBody TpVehicleConditionSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());

        result.setTotal(tpVehicleMonitoringService.selectTpVehicleMonitoringConditionCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(tpVehicleMonitoringService.selectTpVehicleMonitoringCondition(searchVO));  //Result, Search
        }

        return result;
    }

}
