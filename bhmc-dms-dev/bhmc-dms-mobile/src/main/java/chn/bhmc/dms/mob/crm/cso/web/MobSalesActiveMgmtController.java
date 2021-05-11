package chn.bhmc.dms.mob.crm.cso.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesActiveSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesActiveVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

/**
 * 영업활동 관리 컨트롤러
 *
 * @author Park sung sin
 * @since 2016.04.27.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.27         Park sung sin            최초 생성
 * </pre>
 */

@RequestMapping("/mob/crm/cso/salesActive")
@Controller
public class MobSalesActiveMgmtController extends HController {

    /**
     * 영업활동 관리 서비스
     */
    @Resource(name="salesActiveMgmtService")
    SalesActiveMgmtService salesActiveMgmtService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 영업활동 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSalesActiveMgmtMain.do", method = RequestMethod.GET)
    public String selectSalesActiveCalMain(Model model ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> users = userService.selectUsersByCondition(searchVO);
        model.addAttribute("users", users);     // 판매고문

        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));           // 연락방식코드
        model.addAttribute("salesActiveTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));     // 영업활동유형코드
        model.addAttribute("salesActiveStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM323", null, langCd));   // 영업활동상태코드

        return "/mob/crm/cso/salesActive/selectSalesActiveMgmtMain";
    }

    /**
     * 영업활동 목록
     * @return
     */
    @RequestMapping(value = "/selectSalesActiveMgmtList.do", method = RequestMethod.GET)
    public String selectSalesActiveMgmtList(Model model)  throws Exception  {


        return "/mob/crm/cso/salesActive/selectSalesActiveMgmtList";
    }

    /**
     * 영업활동 관리 목록 데이터를 조회한다.
     * @param SalesActiveSearchVO - 판매고문, 고객명, 영업활동유형코드
     * @return
     */
    @RequestMapping(value = "/selectSalesActiveMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesActiveMgmts(@RequestBody SalesActiveSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesActiveMgmtService.selectSalesActiveMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesActiveMgmtService.selectSalesActiveMgmtsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 영업활동 상세 정보를 조회한다.
     * @param SalesActiveSearchVO - 영업활동번호
     * @return
     */
    @RequestMapping(value = "/selectSalesActiveMgmtByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SalesActiveVO selectSalesActiveMgmtByKey(@RequestBody SalesActiveSearchVO searchVO) throws Exception {

        // TODO[이인문] 로그인 SC/ 권한 이랑 파라미터SC 권한 체크 ( 아무나 get방식으로 param 보내서 조회 하면 안되니까.. )
        SalesActiveVO vo = salesActiveMgmtService.selectSalesActiveMgmtByKey(searchVO);
        return vo;

    }

    /**
     * 영업활동 관리 정보를 저장 한다.
     * @param SalesActiveVO - 영업활동 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiSalesActiveMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiSalesActiveMgmts(@Validated @RequestBody SalesActiveVO salesActiveVO)throws Exception {

        // 영업활동관리에서 등록후 영업활동 번호를 return
        String salesActiveNo;
        salesActiveNo = salesActiveMgmtService.multiSalesActiveMgmts(salesActiveVO);
        return salesActiveNo;
    }

}