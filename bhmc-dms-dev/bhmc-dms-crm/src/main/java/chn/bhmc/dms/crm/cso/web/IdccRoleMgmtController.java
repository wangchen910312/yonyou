package chn.bhmc.dms.crm.cso.web;

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
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtVO;

/**
 * IDCC 역활 확보유형 관리 컨트롤러
 *
 * @author kyo jin lee
 * @since 2016.07.10.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.10         kyo jin lee            최초 생성
 * </pre>
 */

@Controller
public class IdccRoleMgmtController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * IDCC 역활유입유형 관리 서비스
     */
    @Resource(name="idccRoleMgmtService")
    IdccRoleMgmtService idccRoleMgmtService;

    /**
     * IDCC 역활 확보유형 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/cso/idccRoleMgmt/selectIdccRoleMgmtMain.do", method = RequestMethod.GET)
    public String selectidccRoleMgmtMain(Model model ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        return "/crm/cso/idccRoleMgmt/selectIdccRoleMgmtMain";
    }

    @RequestMapping(value = "/crm/cso/idccRoleMgmt/selectIdccRole.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectidccRole(@RequestBody IdccRoleMgmtSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(idccRoleMgmtService.selectIdccRoleMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(idccRoleMgmtService.selectIdccRoleMgmtsByCondition(searchVO));
        }
        return result;
    }

    @RequestMapping(value = "/crm/cso/idccRoleMgmt/multiIdccRole.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiidccRole(@RequestBody BaseSaveVO<IdccRoleMgmtVO> saveVO) throws Exception {
        idccRoleMgmtService.multiIdccRole(saveVO);
        return true;
    }

}