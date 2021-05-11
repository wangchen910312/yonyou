package chn.bhmc.dms.sal.cnt.web;


import java.util.ArrayList;
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
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cnt.service.ProgressStsService;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 계약품의현황
 *
 * @author Kim YeWon
 * @since 2016. 2. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.18           Kim YeWon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/cnt/contractCondition")
public class ProgressStsController extends HController {

    /**
     * 계약품의현황 서비스
     */
    @Resource(name="progressStsService")
    ProgressStsService progressStsService;

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
     * 계약품위현황  View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectProgressStsMain.do", method = RequestMethod.GET)
    public String selectProgressStsMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 검색일자
        String sysDate  = DateUtil.getDate("yyyy-MM-dd");
        String oneDay   = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // LoginUtil.getDlrCd() 판매사원 리스트 호출 [TOBE]
        // 판매사원 [TODO] HR 쪽 연동
        ArrayList<HashMap<String,String>> saleEmpList = new ArrayList<HashMap<String,String>>();
        HashMap<String, String> emp = new HashMap<String, String>();
        emp.put("saleEmpNm", LoginUtil.getUserId() + " " + LoginUtil.getUserNm());
        emp.put("saleEmpCd", LoginUtil.getUserId());
        saleEmpList.add(emp);
        emp = new HashMap<String, String>();
        emp.put("saleEmpNm", LoginUtil.getUserId() + " " + LoginUtil.getUserNm());
        emp.put("saleEmpCd", LoginUtil.getUserId());
        saleEmpList.add(emp);

        // 판매사원 리스트 : [TODO] HR 쪽 연동
        model.addAttribute("saleEmpDSInfo", saleEmpList);


        //판매유형 공통코드 목록
        model.addAttribute("contractTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));
        //계약상태 공통코드 목록
        model.addAttribute("contractStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));


        return "/sal/cnt/contractCondition/selectProgressStsMain";
    }



    /**
     * 계약품위현황 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @RequestMapping(value = "/selectProgressSts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectProgressSts(@RequestBody ContractSearchVO searchVO) throws Exception {
        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        SearchResult result = new SearchResult();

        //result.setTotal(progressStsService.selectProgressStsByConditionCnt(searchVO));

        //if(result.getTotal() != 0){
            result.setData(progressStsService.selectProgressStsByCondition(searchVO));
        //}

        return result;
    }

}
