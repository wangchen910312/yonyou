package chn.bhmc.dms.dply.cmm.web;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.dply.cmm.service.DplyCmmService;
import chn.bhmc.dms.dply.cmm.vo.DplyCmmSearchVO;
import chn.bhmc.dms.dply.cmm.vo.SyncCommandSearchVO;
import chn.bhmc.dms.dply.cmm.vo.SyncCommandSendReceiveHistorySearchVO;
import chn.bhmc.dms.dply.spec.service.SpecMngService;
import chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplyCmmMngController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 27.     Kang Seok Han     최초 생성
 * </pre>
 */

@Controller
public class DplyCmmMngController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 형상관리 공통업무 관리 서비스
     */
    @Resource(name="dplyCmmService")
    DplyCmmService dplyCmmService;


    /**
     * SPEC 등록 관리 서비스
     */
    @Resource(name="specMngService")
    SpecMngService specMngService;


    /**
     * SyncCommandSendReceive 조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/sync/selectSyncCmdSndRcvHistMain.do", method = RequestMethod.GET)
    public String selectNotificationHistoryMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 현재일자 DateUtil
        //SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        //model.addAttribute("toDay", simpleformat.format(new Date()));
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");
        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), "yyyy-MM-dd");
        String lastDay      = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), "yyyy-MM-dd");
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("nextMonthDay", nextMonthDay);

        // 형상관리 PROPERTY LIST
        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        SpecMngSearchVO specMngSearchVO = new SpecMngSearchVO();
        model.addAttribute("repositoryDS", specMngService.selectRepository(specMngSearchVO));

        HashMap<String, String> map = new HashMap<String, String>();
        map.put("mesgCd", "3"); // 3으로 시작하는 메시지코드
        model.addAttribute("mesgCdDS", dplyCmmService.selectMessageTemplateByCondition(map));

        // DEPLOY유형
        model.addAttribute("deployTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM023", null, langCd));

        // DEPLOY상태
        model.addAttribute("deployStatDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM024", null, langCd));

        // Notification Type
        model.addAttribute("notificationTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM033", null, langCd));

        // 스케줄유형코드
        model.addAttribute("scheduleTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM034", null, langCd));

        // DEPLOY서비스작업명령어코드
        model.addAttribute("operCmdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM035", null, langCd));

        // PROPERTY파일타입
        model.addAttribute("prtyFileTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM038", null, langCd));

        // DEPLOY결과코드
        model.addAttribute("deployRsltCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM041", null, langCd));

        // REPOSITORY 작업명령어코드
        model.addAttribute("repositoryOperCmdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM042", null, langCd));

        // Sync Command Send Receive Type
        model.addAttribute("sndRecvTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM046", null, langCd));


        return "/dply/cmm/sync/selectSyncCmdSndRcvHistMain";
    }

    /**
     * SyncCommandSendReceiveList를 조회한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/sync/selectSyncCommandSendReceiveHistory.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotificationHistory(@RequestBody SyncCommandSendReceiveHistorySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(dplyCmmService.selectSyncCommandSendReceiveHistoryByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(dplyCmmService.selectSyncCommandSendReceiveHistoryByCondition(searchVO));
        }

        return result;

    }

    /**
     * Sync Command Send Test 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/sync/selectSyncCmdTestMain.do", method = RequestMethod.GET)
    public String selectSyncCmdTestMain(Model model) throws Exception {

/*
        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        // Notification Type
        model.addAttribute("notificationTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM033", null, langCd));
*/
        return "/dply/cmm/sync/selectSyncCmdTestMain";
    }

    /**
     * Sync Command Send Test
     * @return
     */
    @RequestMapping(value = "/dply/cmm/sync/multiSyncCommand.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiSyncCommand(@RequestBody SyncCommandSearchVO searchVO) throws Exception {
        return dplyCmmService.multiSyncCommand(searchVO);
    }

    /**
     * 공통 DMS 조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/dms/selectDmsCmmPopup.do", method = RequestMethod.GET)
    public String selectDmsProfileMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 형상관리 PROPERTY LIST
        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        // DEPLOY대상여부
        model.addAttribute("deployTargYnTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM039", null, langCd));

        // 최종ALIVECHECK상태코드
        model.addAttribute("lastAchkResCdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM043", null, langCd));

        return "/dply/cmm/dms/selectDmsCmmPopup";
    }



}
