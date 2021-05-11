package chn.bhmc.dms.sal.cnt.web;


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
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cnt.service.ProgressService;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 계약품의진척
 *
 * @author Kim YeWon
 * @since 2016. 2. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.19           Kim YeWon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/cnt/contractCondition")
public class ProgressController extends HController {

    /**
     * 계약품의진척 서비스
     */
    @Resource(name="progressService")
    ProgressService progressService;

    /**
     * 차량,모델,OCN,색상,로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 계약품의진척  View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectProgressMain.do", method = RequestMethod.GET)
    public String selectProgressMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 검색일자
        String sysDate  = DateUtil.getDate("yyyy-MM-dd");
        String oneDay   = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        //판매유형 공통코드 목록
        model.addAttribute("contractTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));
        //계약상태 공통코드 목록
        model.addAttribute("contractStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        return "/sal/cnt/contractCondition/selectProgressMain";
    }



    /**
     * 계약품의진척 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @RequestMapping(value = "/selectProgress.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectProgress(@RequestBody ContractSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(progressService.selectProgressByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(progressService.selectProgressByCondition(searchVO));
        }

        return result;
    }






}
