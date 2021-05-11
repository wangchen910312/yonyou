package chn.bhmc.dms.mob.sal.cmp.web;


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
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.cmp.service.CmpCarRunMngService;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngSearchVO;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngVO;



/**
 * 회사차운행관리
 *
 * @author Park Sungsin
 * @since 2016. 4. 19
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.19           Park Sung sin            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/sal/cmp/cmpCarRunMng")
public class MobCmpCarRunMngController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 회사차운행관리 서비스
     */
    @Resource(name="cmpCarRunMngService")
    CmpCarRunMngService cmpCarRunMngService;


    /**
     * 회사차운행관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCmpCarRunMngMain.do", method = RequestMethod.GET)
    public String selectCmpCarRunMngMain(Model model) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String toDay = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("toDay", toDay);

        //회사차구분 공통코드 목록
        model.addAttribute("cmpCarDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/mob/sal/cmp/cmpCarRunMng/selectCmpCarRunMngMain";
    }


    /**
     * 회사차운행관리 목록
     * @param searchVO - 조회 조건을 포함하는 AapMngSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCmpCarRunMngList.do", method = RequestMethod.GET)
    public String selectCmpCarRunMngList(Model model) throws Exception {

        String toDay = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("toDay", toDay);

        //회사차구분 공통코드 목록
        model.addAttribute("cmpCarDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/mob/sal/cmp/cmpCarRunMng/selectCmpCarRunMngList";
    }

    /**
     * 회사차운행관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AapMngSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCmpCarRunMng.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCmpCarRunMng(@RequestBody CmpCarRunMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(cmpCarRunMngService.selectCmpCarRunMngByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(cmpCarRunMngService.selectCmpCarRunMngByCondition(searchVO));
        }

        return result;
    }


    /**
     * 회사차운형관리 저장
     */
    @RequestMapping(value = "/saveCmpCarRunMng.do", method = RequestMethod.POST)
    @ResponseBody
    public String saveCmpCarRunMng(@RequestBody CmpCarRunMngVO saveVO) throws Exception {

        String result = cmpCarRunMngService.saveCmpCarRunMng(saveVO);


        return result;
    }


    /**
     * 회사차운형관리 삭제
     */
    @RequestMapping(value = "/deleteCmpCarRunMng.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteCmpCarRunMng(@RequestBody CmpCarRunMngVO saveVO) throws Exception {

        cmpCarRunMngService.deleteCmpCarRunMng(saveVO);


        return true;
    }

}
