package chn.bhmc.dms.mob.api;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ibm.icu.util.Calendar;

import able.com.web.HController;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.crm.ass.service.AssignService;
import chn.bhmc.dms.crm.cal.service.CallCenterActionService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cmm.service.CallInfoService;
import chn.bhmc.dms.crm.crq.service.VocMgmtService;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

/**
 * @ClassName: TestController
 * @Description:
 * <pre>
 *     测试迁移接口 - 仿照 MobAssignController 编写
 * </pre>
 * @author blueair
 * @version 1.0.0
 * -----------------------------------------------------
 * @date 2017年9月15日
 * -----------------------------------------------------
 */
@RestController
@RequestMapping("/api/demo")
public class TestApi extends HController{
	/**
     *VOC 배정 서비스
     */
    @Resource(name="assignService")
    AssignService assignService;

    /**
     * VOC관리 서비스
     */
    @Resource(name="vocMgmtService")
    VocMgmtService vocMgmtService;

    /**
     * 고객 서비스
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 리드 서비스
     */
    @Resource(name="leadInfoService")
    LeadInfoService leadInfoService;

    /**
     * 콜센터 서비스
     */
    @Resource(name="callInfoService")
    CallInfoService callInfoService;

    /**
     * 콜센터 서비스
     */
    @Resource(name="callCenterActionService")
    CallCenterActionService callCenterActionService;

    /**
     * 공통코드 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * [4.9.2.001-01] 리드배분 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectLeadAssignMain.do", method = RequestMethod.GET)
    @ResponseBody
    public List<UserVO> selectLeadAssignMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> assignUserList = userService.selectUsersByCondition(searchVO);

        model.addAttribute("assignUserList", assignUserList);
        //model.addAttribute("leadSrcList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));  //리드출처 CRM209
        //model.addAttribute("statList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));  //리드상태 CRM210
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));  // 잠재,보유고객

        return assignUserList;
    }

}
