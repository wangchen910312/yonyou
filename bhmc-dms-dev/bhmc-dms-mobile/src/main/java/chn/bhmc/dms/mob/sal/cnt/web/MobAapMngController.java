package chn.bhmc.dms.mob.sal.cnt.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;

import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.aap.service.AapMngService;
import chn.bhmc.dms.sal.aap.vo.AapMngSearchVO;
import chn.bhmc.dms.sal.aap.vo.AapMngVO;



/**
 * 대행업무관리
 *
 * @author Park Sung sin
 * @since 2016. 4. 14
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.14           Park Sung sin            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/sal/cnt/aapMng")
public class MobAapMngController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 대행업무관리 서비스
     */
    @Resource(name="aapMngService")
    AapMngService aapMngService;


    /**
     * 보험가입정보관리 서비스 - 주소지: 성, 시, 구 호출
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;

    /**
     * 배정관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAapMngMain.do", method = RequestMethod.GET)
    public String selectAapMngMain(Model model) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String toDay  = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("toDay", toDay);

        //대행업무구분 공통코드 목록
        model.addAttribute("aapWrkDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL021", null, LocaleContextHolder.getLocale().getLanguage()));

        model.addAttribute("sungCdList", incJoinInfoService.selectSungCd(null));
        return "/mob/sal/cnt/aapMng/selectAapMngMain";
    }

    /**
     * 배정관리 목록
     * @return
     */
    @RequestMapping(value = "/selectAapMngList.do", method = RequestMethod.GET)
    public String selectAapMngList(Model model)  throws Exception  {

        // 현재일자 DateUtil
        String toDay  = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("toDay", toDay);

      //대행업무구분 공통코드 목록
        model.addAttribute("aapWrkDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL021", null, LocaleContextHolder.getLocale().getLanguage()));


        return "/mob/sal/cnt/aapMng/selectAapMngList";
    }


    /**
     * 대행업무관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AapMngSearchVO
     * @return
     */
    @RequestMapping(value = "/selectAapMng.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAapMng(@RequestBody AapMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());

        result.setTotal(aapMngService.selectAapMngByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(aapMngService.selectAapMngByCondition(searchVO));
        }

        return result;
    }



    /**
     * 대행업무 저장
     */
    @RequestMapping(value = "/saveAapMng.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean saveAapMng(@RequestBody AapMngVO saveVO) throws Exception {
        aapMngService.saveAapMng(saveVO);

        return true;
    }

    /**
     * 성에 해당하는 도시를 조회.
     */
    @RequestMapping(value = "/selectCity.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCity(@RequestBody IncJoinInfoVO vo) throws Exception{

        SearchResult result = new SearchResult();
        result.setData(incJoinInfoService.selectCityCd(vo));

        return result;
    }


    /**
     * 도시에 해당하는 구를 조회.
     */
    @RequestMapping(value = "/selectDist.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDist(@RequestBody IncJoinInfoVO vo) throws Exception{

        SearchResult result = new SearchResult();
        result.setData(incJoinInfoService.selectDistCd(vo));

        return result;
    }

}
