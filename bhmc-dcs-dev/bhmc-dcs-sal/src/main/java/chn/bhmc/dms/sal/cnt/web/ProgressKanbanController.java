package chn.bhmc.dms.sal.cnt.web;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cnt.service.ProgressService;
import chn.bhmc.dms.sal.cnt.vo.ContractCntVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;

/**
 * 계약품의진척
 *
 * @author Kim YeWon
 * @since 2016. 2. 22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.21           Kim YeWon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/cnt/contractCondition")
public class ProgressKanbanController extends HController {


    /**
     * 계약품의진척 서비스
     */
    @Resource(name="progressService")
    ProgressService progressService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 계약품의진척(간반차트)  View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectProgressKanbanMain.do", method = RequestMethod.GET)
    public String selectProgressKanbanMain(Model model) throws Exception {

        // 검색일자
        String sysDate  = DateUtil.getDate("yyyy-MM-dd");
        String oneDay   = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

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
        model.addAttribute("contractTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, LocaleContextHolder.getLocale().getLanguage()));

        //간반차트 헤더에 표시될 갯수를 조회한다.
        List<ContractCntVO> list = progressService.selectPannelCnt();

        model.addAttribute("cnt10", list.get(0).getCnt10());
        model.addAttribute("cnt20", list.get(0).getCnt20());
        model.addAttribute("cnt21", list.get(0).getCnt21());
        model.addAttribute("cnt30", list.get(0).getCnt30());
        model.addAttribute("cnt40", list.get(0).getCnt40());
        model.addAttribute("cnt41", list.get(0).getCnt41());
        model.addAttribute("cnt50", list.get(0).getCnt50());
        model.addAttribute("cnt90", list.get(0).getCnt90());
        model.addAttribute("cnt91", list.get(0).getCnt91());

        return "/sal/cnt/contractCondition/selectProgressKanbanMain";
    }




    /**
     * 계약품의진척[간반차트]
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectPannelList.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,?> selectPannelList(@RequestBody ContractSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("pannelList", progressService.selectProgressByCondition(searchVO));

        return result;
    }




}
