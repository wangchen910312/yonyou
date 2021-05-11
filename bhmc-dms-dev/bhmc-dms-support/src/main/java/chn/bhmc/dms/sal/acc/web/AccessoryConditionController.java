package chn.bhmc.dms.sal.acc.web;


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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.acc.service.AccessoryConditionService;
import chn.bhmc.dms.sal.acc.vo.AccessoryConditionSearchVO;



/**
 * 경품판매현황
 *
 * @author Kim Jin Suk
 * @since 2016. 9. 20
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.09.20           Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/acc/accessoryCondition")
public class AccessoryConditionController extends HController {

    /**
     * 경품판매현황 서비스
     */
    @Resource(name="accessoryConditionService")
    private AccessoryConditionService accessoryConditionService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 경품판매현황 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAccessoryConditionMain.do", method = RequestMethod.GET)
    public String selectAccessoryConditionMain(Model model,
            @RequestParam(value="accessoryMngNo",    required = false, defaultValue="") String accessoryMngNo
    ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 현재일자 DateUtil
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

        //경품업무유형 : SAL158
        model.addAttribute("goodsTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL158", null, langCd));

        // 납부방식 : SAL012
        model.addAttribute("ioTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL012", null, langCd));

        // 공통코드 : 부품출고요청상태
        //model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302"));


        model.addAttribute("accessoryMngNo", accessoryMngNo);

        return "/sal/acc/accessoryCondition/selectAccessoryConditionMain";
    }


    /**
     * 경품판매현황 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAccessoryConditionSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryConditionSearch(@RequestBody AccessoryConditionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(accessoryConditionService.selectAccessoryConditionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(accessoryConditionService.selectAccessoryConditionsByCondition(searchVO));
        }

        return result;
    }


}
