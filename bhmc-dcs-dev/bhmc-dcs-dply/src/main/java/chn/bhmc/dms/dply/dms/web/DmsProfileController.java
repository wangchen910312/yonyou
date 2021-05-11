package chn.bhmc.dms.dply.dms.web;

import java.util.List;

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
import chn.bhmc.dms.dply.cmm.service.DplyCmmService;
import chn.bhmc.dms.dply.cmm.vo.DplyCmmSearchVO;
import chn.bhmc.dms.dply.dms.service.DmsProfileService;
import chn.bhmc.dms.dply.dms.vo.BundleDeployHistorySearchVO;
import chn.bhmc.dms.dply.dms.vo.DmsProfileSaveVO;
import chn.bhmc.dms.dply.dms.vo.DmsProfileSearchVO;
import chn.bhmc.dms.dply.spec.service.SpecMngService;
import chn.bhmc.dms.dply.spec.vo.DeployHistorySearchVO;
import chn.bhmc.dms.dply.spec.vo.DeployReportMasterVO;
import chn.bhmc.dms.dply.spec.vo.RepositoryVO;
import chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsProfileController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheolman Man Oh
 * @since 2016. 3. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 18.     Cheolman Man Oh     최초 생성
 * </pre>
 */

@Controller
public class DmsProfileController extends HController {
/*
    @Resource(name="baseNames")
    List<String> baseNames;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;
*/
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 형상관리 공통업무 관리 서비스
     */
    @Resource(name="dplyCmmService")
    DplyCmmService dplyCmmService;

    /**
     * DMS Profile 서비스
     */
    @Resource(name="dmsProfileService")
    DmsProfileService dmsProfileService;

    /**
     * SPEC 등록 관리 서비스
     */
    @Resource(name="specMngService")
    SpecMngService specMngService;

    /**
     * DMS Profile 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/dms/dmsProfile/selectDmsProfileMain.do", method = RequestMethod.GET)
    public String selectDmsProfileMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 형상관리 PROPERTY LIST
        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        // DEPLOY대상여부
        model.addAttribute("deployTargYnTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM039", null, langCd));

        // 최종ALIVECHECK상태코드
        model.addAttribute("lastAchkResCdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM043", null, langCd));


        return "/dply/dms/dmsProfile/selectDmsProfileMain";
    }

    /**
     * DMS Profile 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DmsProfileSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/dms/dmsProfile/selectDmsProfile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsProfile(@RequestBody DmsProfileSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(dmsProfileService.selectDmsProfileByConditionCnt(searchVO));

        if(result.getTotal() != 0) {
            result.setData(dmsProfileService.selectDmsProfileByCondition(searchVO));
        }

        return result;
    }

    /**
     * Deploy History 조회 팝업 화면 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/dms/dmsProfile/selectDplyHistPopup.do", method = RequestMethod.GET)
    public String selectDplyHistPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // SPEC타입별 DEPLOY결과코드
        model.addAttribute("deployRsltCdBySpecTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM044", null, langCd));

        // SPEC타입별 롤백결과코드
        model.addAttribute("rollbackRsltCdBySpecTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM045", null, langCd));

        return "/dply/dms/dmsProfile/selectDplyHistPopup";
    }

    /**
     * DMS Bundle Status 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/dms/dmsProfile/selectDealerBundlePopup.do", method = RequestMethod.GET)
    public String selectDealerBundlePopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();

        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        // SPEC타입별 DEPLOY결과코드
        model.addAttribute("deployRsltCdBySpecTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM044", null, langCd));

        // SPEC타입별 롤백결과코드
        model.addAttribute("rollbackRsltCdBySpecTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM045", null, langCd));

        return "/dply/dms/dmsProfile/selectDealerBundlePopup";
    }

    /**
     * DMS Mobile User Status 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/dms/dmsProfile/selectDMSMobileUserStatusPopup.do", method = RequestMethod.GET)
    public String selectDMSMobileUserStatusPopup(Model model) throws Exception {
        return "/dply/dms/dmsProfile/selectDMSMobileUserStatusPopup";
    }

    /**
     * DMS DB Ojbec 조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/dms/dmsProfile/selectDBObjectPopup.do", method = RequestMethod.GET)
    public String selectDBObjectPopup(Model model) throws Exception {
        return "/dply/dms/dmsProfile/selectDBObjectPopup";
    }


    /**
     * Deploy Dealer 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SpecMngSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/dms/dmsProfile/selectBundleDeployHistoryByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDplyDlrByKey(@RequestBody BundleDeployHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(dmsProfileService.selectBundleDeployHistoryByKey(searchVO));

        return result;

    }

    // Deploy 대상여부 반영 처리
    @RequestMapping(value = "/dply/dms/dmsProfile/updateDeployTargetYN.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateDeployTargetYN(@RequestBody DmsProfileSaveVO saveVO) throws Exception {

        return dmsProfileService.updateDeployTargetYN(saveVO);
    }


    /**
     * 특정 조건으로 Deploy Request History 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeployHistorySearchVO
     * @return
     */
    @RequestMapping(value = "/dply/dms/dmsProfile/selectDeployReqHistByDlrCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDeployReqHistByDlrCd(@RequestBody DeployHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        List<DeployReportMasterVO> list = null;

        list = specMngService.selectDeployReqHistByDlrCd(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;

    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "/dply/dms/dmsProfile/selectUpgradeAgentPopup.do", method = RequestMethod.GET)
    public String selectUpgradeAgentPopup(Model model) throws Exception {
        // 형상관리 PROPERTY LIST
        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        return "/dply/dms/dmsProfile/selectUpgradeAgentPopup";
    }



    /**
     * Repository 정보를 조회한다
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/dply/dms/dmsProfile/selectRepository.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRepository(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<RepositoryVO> list = null;

        list = specMngService.selectRepository(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }




}
