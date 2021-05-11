package chn.bhmc.dms.dply.spec.web;

import java.util.Calendar;
import java.util.Date;

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
import chn.bhmc.dms.dply.spec.service.DplySpecListService;
import chn.bhmc.dms.dply.spec.vo.DplySpecListSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsProfileController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheolman Man Oh
 * @since 2016. 3. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 18.     Cheolman Man Oh     최초 생성
 * </pre>
 */

@Controller
public class DplySpecListController extends HController {
/*
    @Resource(name="baseNames")
    List<String> baseNames;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;
*/

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
     * 메세지소스 관리 서비스
     */
    @Resource(name="dplySpecListService")
    DplySpecListService dplySpecListService;

    /**
     * Spec List 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/specList/selectSpecListMain.do", method = RequestMethod.GET)
    public String selectSpecListMain(Model model) throws Exception {

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

        // DEPLOY유형
        model.addAttribute("deployTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM023", null, langCd));

        // DEPLOY상태
        model.addAttribute("deployStatDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM024", null, langCd));

        // 스케줄유형코드
        model.addAttribute("scheduleTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM034", null, langCd));

        // DEPLOY서비스작업명령어코드
        model.addAttribute("operCmdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM035", null, langCd));

        // PROPERTY파일타입
        model.addAttribute("prtyFileTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM038", null, langCd));

        // Command Deploy 실행유형코드
        model.addAttribute("commandSpecTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM048", null, langCd));

        return "/dply/spec/specList/selectSpecListMain";
    }

    /**
     * Spec List 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DplySpecListSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specList/selectSpecList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSpecList(@RequestBody DplySpecListSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(dplySpecListService.selectSpecListByConditionCnt(searchVO));

        if(result.getTotal() != 0) {
            result.setData(dplySpecListService.selectSpecListByCondition(searchVO));
        }

        return result;
    }



}
