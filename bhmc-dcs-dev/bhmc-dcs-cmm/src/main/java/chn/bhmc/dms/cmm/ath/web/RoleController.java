package chn.bhmc.dms.cmm.ath.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.RoleService;
import chn.bhmc.dms.cmm.ath.vo.RoleSaveVO;
import chn.bhmc.dms.cmm.ath.vo.RoleSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 역할 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
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
public class RoleController extends HController {

    /**
     * 역할 관리 서비스
     */
    @Resource(name="roleService")
    RoleService roleService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 역할 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/role/selectRoleMain.do", method = RequestMethod.GET)
    public String selectRoleMain(Model model, HttpServletRequest request) throws Exception {
        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");

        //시스템코드 'D':딜러, 'I':임포터
        model.addAttribute("sysCd", sysCd);
        //시스템구분
        model.addAttribute("sysCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM055", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/cmm/ath/role/selectRoleMain";
    }

    /**
     * 역할 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RoleSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ath/role/selectRoles.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRoles(@RequestBody RoleSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(roleService.selectRolesByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(roleService.selectRolesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 역할 정보를 저장한다.
     * @param saveVO - 역할정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/ath/role/multiRoles.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiRoles(@Validated @RequestBody RoleSaveVO saveVO) throws Exception {
        roleService.multiRoles(saveVO);
        return true;
    }

    /**
     * 역할조회 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     *
     */
    @RequestMapping(value = "/cmm/ath/role/selectRolePopup.do", method = RequestMethod.GET)
    public String selectRolePopup(Model model) throws Exception {
        return "/cmm/ath/role/selectRolePopup";
    }
}
