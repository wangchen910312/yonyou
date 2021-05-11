package chn.bhmc.dms.crm.slm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;

import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;





/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LeadInfoReportController.java
 * @Description : 리드현황 컨트롤러
 * @author Kyo Jin Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@Controller
public class LeadInfoReportController extends HController{



    /**
     * Customer Information Management Service
     */
    @Resource(name="leadInfoService")
    LeadInfoService leadInfoService;

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
     * 권한 관리 서비스
     */
    @Resource(name="roleMappingService")
    RoleMappingService roleMappingService;

    /**
     * 활동 관리 서비스
     */
    @Resource(name="contactHistoryService")
    ContactHistoryService contactHistoryService;

    /**
     * 리드조회 메인 화면을 출력한다.
     * @return
     *
    @RequestMapping(value = "/crm/slm/leadRegistReport/selectLeadRegistReportMain.do", method = RequestMethod.GET)
    public String selectLeadRegistReportMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("leadSrcList",           commonCodeService.selectCommonCodesByCmmGrpCd("CRM209", null, langCd));  //리드출처
        model.addAttribute("statList",              commonCodeService.selectCommonCodesByCmmGrpCd("CRM210", null, langCd));  //리드상태
        model.addAttribute("leadTpList",              commonCodeService.selectCommonCodesByCmmGrpCd("CRM223", null, langCd));  //리드유형

        // 권한 사용자
        List<UserVO> roleUsers = roleMappingService.selectAuthoritiesUsersByRoleId(Constants.SYS_CD_DLR, LoginUtil.getDlrCd(), "ROLE_SC");
        model.addAttribute("roleUsers", roleUsers);

        return "/crm/slm/leadRegistReport/selectLeadRegistReportMain";
    }
    */
}
