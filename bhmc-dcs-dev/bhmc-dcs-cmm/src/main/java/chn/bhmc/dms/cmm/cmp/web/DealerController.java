package chn.bhmc.dms.cmm.cmp.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 딜러 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class DealerController extends HController {

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 딜러 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/dealer/selectDealerMain.do", method = RequestMethod.GET)
    public String selectDealerMain(Model model, HttpServletRequest request) throws Exception {
        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");

        //멤버쉽 운영기준
        List<CommonCodeVO> membershipPolicyList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM808", null, LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("membershipPolicyList", membershipPolicyList);
        //자동배정기준
        List<CommonCodeVO> autoAssignCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM225", null, LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("autoAssignCdList", autoAssignCdList);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //시스템구분이 법인 인 경우
        if(Constants.SYS_CD_CORP.equals(sysCd)){
            return "/cmm/cmp/dealer/selectDealerMainForDcs";
        }

        return "/cmm/cmp/dealer/selectDealerMainForDms";
    }

    /**
     * 딜러 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/dealer/selectDealers.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealers(@RequestBody DealerSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(dealerService.selectDealersByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(dealerService.selectDealersByCondition(searchVO));
        }

        return result;
    }

    /**
     * 딜러 정보를 가져온다.
     * @param searchVO 딜러 조회 조건
     * @return 조회 조건을 만족하는 딜러 정보를 반환한다.
     */
    @RequestMapping(value="/cmm/cmp/dealer/selectDealer.do",  method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectDealer(@RequestBody DealerSearchVO searchVO) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        List<DealerVO> groupDealerList = new ArrayList<DealerVO>();

        //딜러정보
        DealerVO dealerVO = dealerService.selectDealerByKey(searchVO.getsDlrCd());

        //동일그룹 딜러목록
        if(StringUtils.isNoneBlank(dealerVO.getDlrGrpCd())){
            DealerSearchVO dealerGroupSearchVO = new DealerSearchVO();
            dealerGroupSearchVO.setsDlrGrpCd(dealerVO.getDlrGrpCd());
            groupDealerList = dealerService.selectDealersByCondition(searchVO);
        }

        result.put("dealer", dealerVO);
        result.put("groupDealerList", groupDealerList);

        return result;
    }

    /**
     * 딜러 정보를 수정한다.
     * @param dealerVO - 딜러정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/dealer/updateDealer.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateDealer(@Validated @RequestBody DealerVO dealerVO) throws Exception {
        dealerService.updateDealer(dealerVO);
        return true;
    }

    @RequestMapping(value = "/cmm/cmp/dealer/selectDealerBatchUploadPopup.do", method = RequestMethod.GET)
    public String selectDealerBatchUploadPopup(HttpServletRequest request) throws Exception {
        return "/cmm/cmp/dealer/selectDealerBatchUploadPopup";
    }
}
