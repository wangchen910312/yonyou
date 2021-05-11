package chn.bhmc.dms.par.cpm.web;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService;
import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoHeaderVO;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO;

/**
 * AdvanceReceivedInfo Controller
 *
 * @author In Bo Shim
 * @since 2016. 05. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 23.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class AdvanceReceivedInfoController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 선수금헤더 서비스
     */
    @Resource(name="advanceReceivedInfoHeaderService")
    AdvanceReceivedInfoHeaderService advanceReceivedInfoHeaderService;

    /**
     * 선수금상세 서비스
     */
    @Resource(name="advanceReceivedInfoDetailService")
    AdvanceReceivedInfoDetailService advanceReceivedInfoDetailService;

    /**
     * 선수금 헤더 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoMain.do", method = RequestMethod.GET)
    public String selectadvanceReceivedInfoMain(Model model) throws Exception {

        // 공통코드 : 선수금유형
        model.addAttribute("preAmtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR501", null, LocaleContextHolder.getLocale().getLanguage()));
        //dlrCd
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());


        return "/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoMain";

    }

    /**
     * 선수금 제시금액 수정.
     * @param advanceReceivedInfoHeaderVO - 선수금 AdvanceReceivedInfoHeaderVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/advanceReceivedInfo/updateAdvanceReceivedInfoHeader.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateAdvanceReceivedInfoHeader(@RequestBody AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO) throws Exception{

        advanceReceivedInfoHeaderService.updateAdvanceReceivedInfoHeader(advanceReceivedInfoHeaderVO);

        return true;
    }

    /**
     * 선수금 헤더 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AdvanceReceivedInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoHeaderByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public AdvanceReceivedInfoHeaderVO selectAdvanceReceivedInfoHeaderByKey(@RequestBody AdvanceReceivedInfoSearchVO searchVO) throws Exception{

        AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO = advanceReceivedInfoHeaderService.selectAdvanceReceivedInfoHeaderByKey(searchVO.getsDlrCd());

        if(advanceReceivedInfoHeaderVO == null){
            advanceReceivedInfoHeaderVO = new AdvanceReceivedInfoHeaderVO();
        }

        return advanceReceivedInfoHeaderVO;

    }

    /**
     * 선수금 상세 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AdvanceReceivedInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAdvanceReceivedInfoDetails(@RequestBody AdvanceReceivedInfoSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(searchVO.getsDlrCd());
        result.setTotal(advanceReceivedInfoDetailService.selectAdvanceReceivedInfoDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(advanceReceivedInfoDetailService.selectAdvanceReceivedInfoDetailsByCondition(searchVO));
        }

        return result;

    }
}
