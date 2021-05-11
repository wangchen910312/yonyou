package chn.bhmc.dms.dply.spec.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.dply.cmm.service.DplyCmmService;
import chn.bhmc.dms.dply.cmm.vo.DplyCmmSearchVO;
import chn.bhmc.dms.dply.spec.service.SpecMngService;
import chn.bhmc.dms.dply.spec.vo.DmsSearchVO;
import chn.bhmc.dms.dply.spec.vo.DmsVO;
import chn.bhmc.dms.dply.spec.vo.DplyDlrSaveVO;
import chn.bhmc.dms.dply.spec.vo.DplyMastVO;
import chn.bhmc.dms.dply.spec.vo.DplySpecListSearchVO;
import chn.bhmc.dms.dply.spec.vo.RepositoryVO;
import chn.bhmc.dms.dply.spec.vo.SpecBasicSaveVO;
import chn.bhmc.dms.dply.spec.vo.SpecMngSaveVO;
import chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO;
import chn.bhmc.dms.dply.spec.vo.SpecMngVO;


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
public class SpecMngController extends HController {
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
     * SPEC 등록 관리 서비스
     */
    @Resource(name="specMngService")
    SpecMngService specMngService;

    /**
     * 형상관리 공통업무 관리 서비스
     */
    @Resource(name="dplyCmmService")
    DplyCmmService dplyCmmService;

    /**
     * Spec 등록 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectSpecMngMain.do", method = RequestMethod.GET)
    public String selectSpecMngMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 형상관리 PROPERTY LIST
        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        // DEPLOY유형
        model.addAttribute("deployTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM023", null, langCd));

        // DEPLOY상태
        model.addAttribute("deployStatDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM024", null, langCd));

        // 스케줄유형코드
        model.addAttribute("scheduleTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM034", null, langCd));

        // DEPLOY서비스작업명령어코드
        model.addAttribute("operCmdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM035", null, langCd));

        // PROPERTY파일타입
        model.addAttribute("prtyFileTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM038", null, langCd));

        // DEPLOY결과코드
        model.addAttribute("deployRsltCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM041", null, langCd));

        // REPOSITORY 작업명령어코드
        model.addAttribute("repositoryOperCmdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM042", null, langCd));

        // Command Deploy 실행유형코드
        model.addAttribute("commandSpecTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM048", null, langCd));


        return "/dply/spec/specMng/selectSpecMngMain";
    }


    // SPEC 신규 등록, 수정
    @RequestMapping(value = "/dply/spec/specMng/multiSpecMng.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiSpecMng(@RequestBody SpecMngSaveVO saveVO) throws Exception {
        return specMngService.multiSpecMng(saveVO);

    }

    // SPEC 복제
    @RequestMapping(value = "/dply/spec/specMng/multiSpecDuplicate.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiSpecDuplicate(@RequestBody SpecMngSaveVO saveVO) throws Exception {
        return specMngService.multiSpecDuplicate(saveVO);

    }


    // SPEC 삭제
    @RequestMapping(value = "/dply/spec/specMng/deleteSpec.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteSpec(@RequestBody SpecBasicSaveVO saveVO) throws Exception {
        return specMngService.deleteSpec(saveVO);

    }

    // SPEC 삭제 전 체크
    @RequestMapping(value = "/dply/spec/specMng/selectNotNewDplyMastCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectNotNewDplyMastCnt(@RequestParam("specCd") String specCd) throws Exception {
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("specCd", specCd);
        return specMngService.selectNotNewDplyMastCnt(map);

    }


    /**
     * SPEC조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectSpecPopup.do", method = RequestMethod.GET)
    public String selectSpecPopup(Model model) throws Exception {
        return "/dply/spec/specMng/selectSpecPopup";
    }

    /**
     * SPEC 상세 내용 조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectSpecInfoPopup.do", method = RequestMethod.GET)
    public String selectSpecInfoPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        // DEPLOY유형
        model.addAttribute("deployTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM023", null, langCd));

        // DEPLOY상태
        model.addAttribute("deployStatDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM024", null, langCd));

        // 스케줄유형코드
        model.addAttribute("scheduleTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM034", null, langCd));

        // DEPLOY서비스작업명령어코드
        model.addAttribute("operCmdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM035", null, langCd));

        // DEPLOY서비스작업명령어코드
        model.addAttribute("prtyFileTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM038", null, langCd));


        return "/dply/spec/specMng/selectSpecInfoPopup";
    }


    /**
     * DMS조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectDmsPopup.do", method = RequestMethod.GET)
    public String selectDmsPopup(Model model) throws Exception {

        // 최종ALIVECHECK상태코드
        model.addAttribute("lastAchkResCdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM043", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/dply/spec/specMng/selectDmsPopup";
    }


    /**
     * BUNDLE 조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectBundlePopup.do", method = RequestMethod.GET)
    public String selectBundlePopup(Model model) throws Exception {

        // DEPLOY서비스작업명령어코드
        model.addAttribute("operCmdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM035", null, LocaleContextHolder.getLocale().getLanguage()));

        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        SpecMngSearchVO specMngSearchVO = new SpecMngSearchVO();
        model.addAttribute("repositoryDS", specMngService.selectRepository(specMngSearchVO));

        return "/dply/spec/specMng/selectBundlePopup";
    }

    /**
     * REPOSITORY 조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectRepositoryPopup.do", method = RequestMethod.GET)
    public String selectRepositoryPopup(Model model) throws Exception {

        // DEPLOY서비스작업명령어코드
        model.addAttribute("repositoryOperCmdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM042", null, LocaleContextHolder.getLocale().getLanguage()));

        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

//        SpecMngSearchVO specMngSearchVO = new SpecMngSearchVO();
//        model.addAttribute("repositoryDS", specMngService.selectRepository(specMngSearchVO));

//        model.addAttribute("langCd", LocaleContextHolder.getLocale().getLanguage());
        return "/dply/spec/specMng/selectRepositoryPopup";
    }

    /**
     * REPOSITORY 정보를 조회한다
     * @param searchVO - 조회 조건을 포함하는 SpecMngSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectRepository.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRepository(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<RepositoryVO> list = null;

        list = specMngService.selectRepository(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * BUNDLE 조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectRunDeployPopup", method = RequestMethod.GET)
    public String selectRunDeployPopup(Model model) throws Exception {

//        model.addAttribute("langCd", LocaleContextHolder.getLocale().getLanguage());
        return "/dply/spec/specMng/selectRunDeployPopup";
    }


    /**
     * DMS Popup 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DplySpecListSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectDmsPopupList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsPopupList(@RequestBody DmsSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        List<DmsVO> list = null;

        if("N".equals(searchVO.getsDeployTpCd())) {
            list = specMngService.selectDmsPopupList(searchVO);
        } else if("S".equals(searchVO.getsDeployTpCd())) {
            list = specMngService.selectDmsPopupListForSimulation(searchVO);
        }

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }


    /**
     * REPOSITORY 조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectSrcFilePopup.do", method = RequestMethod.GET)
    public String selectSrcFilePopup(Model model) throws Exception {

        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        return "/dply/spec/specMng/selectSrcFilePopup";
    }


    /**
     * SPEC DUPLICATION 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectDupSpecPopup.do", method = RequestMethod.GET)
    public String selectDupSpecPopup(Model model) throws Exception {

        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        return "/dply/spec/specMng/selectDupSpecPopup";
    }


    /**
     * Spec 등록 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DplySpecListSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectSpecMng.do", method = RequestMethod.POST)
    @ResponseBody
    public SpecMngVO selectSpecMng(@RequestBody DplySpecListSearchVO searchVO) throws Exception {


        return specMngService.selectSpecMngByKey(searchVO.getsSpecCd());

/*
        SearchResult result = new SearchResult();
        result.setTotal(dplySpecListService.selectSpecListByConditionCnt(searchVO));

        if(result.getTotal() != 0) {
            result.setData(dplySpecListService.selectSpecListByCondition(searchVO));
        }

        return result;
*/
    }

    /**
     * Spec 등록 Repository 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SpecMngSearchVO
     * @return
     */
/*    @RequestMapping(value = "/dply/spec/specMng/selectSpecRepositoryBySpecCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSpecRepositoryBySpecCd(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(specMngService.selectSpecRepositoryBySpecCd(searchVO));

        return result;

    }*/

    /**
     * Spec 등록 Command 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SpecMngSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectSpecCommandBySpecCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSpecCommandBySpecCd(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(specMngService.selectSpecCommandBySpecCd(searchVO));

        return result;

    }

    /**
     * Spec 등록 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SpecMngSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectSpecBundleBySpecCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSpecServiceBySpecCd(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(specMngService.selectSpecBundleBySpecCd(searchVO));

        return result;

    }

    /**
     * Spec 등록 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SpecMngSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectSpecSqlBySpecCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSpecSqlBySpecCd(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(specMngService.selectSpecSqlBySpecCd(searchVO));

        return result;

    }

    /**
     * Spec 등록 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SpecMngSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectSpecPrtyBySpecCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSpecPrtyBySpecCd(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(specMngService.selectSpecPrtyBySpecCd(searchVO));

        return result;

    }


    /**
     * Spec 등록 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SpecMngSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectSpecFileBySpecCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSpecFileBySpecCd(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(specMngService.selectSpecFileBySpecCd(searchVO));

        return result;

    }


    /**
     * Deploy Master 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SpecMngSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectDplyMastByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDplyMastByKey(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(specMngService.selectDplyMastByKey(searchVO));

        return result;

    }


    // DEPLOY DEALER 신규 등록
    @RequestMapping(value = "/dply/spec/specMng/insertDplyDlr.do", method = RequestMethod.POST)
    @ResponseBody
    public DplyMastVO insertDplyDlr(@RequestBody DplyDlrSaveVO saveVO) throws Exception {

        return specMngService.insertDplyDlr(saveVO);
    }


    // DEPLOY DEALER 삭제
    @RequestMapping(value = "/dply/spec/specMng/deleteDplyDlr.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteDplyDlr(@RequestBody DplyDlrSaveVO saveVO) throws Exception {

        return specMngService.deleteDplyDlr(saveVO);
    }

    // DEALER DEPLOY 제외 정보 update
    @RequestMapping(value = "/dply/spec/specMng/updateDplyDlrExcp.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateDplyDlrExcp(@RequestBody DplyDlrSaveVO saveVO) throws Exception {

        return specMngService.updateDplyDlrExcp(saveVO);
    }


    /**
     * Deploy Group 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SpecMngSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectDplyGrpByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDplyGrpByKey(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(specMngService.selectDplyGrpByKey(searchVO));

        return result;

    }

    /**
     * Deploy Dealer 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SpecMngSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectDplyDlrByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDplyDlrByKey(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(specMngService.selectDplyDlrByKey(searchVO));

        return result;

    }

    /**
     * SPEC_CD, DEPLOY_VER_NO, DEPLOY_GRP_ID 조건으로 Deploy Current State 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SpecMngSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/spec/specMng/selectDplyCurrentState.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDplyCurrentState(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(specMngService.selectDplyCurrentState(searchVO));

        return result;
    }


    // DEPLOY MASTER Activate
    @RequestMapping(value = "/dply/spec/specMng/updateDplyMastStateToReg.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateDplyMastStateToReg(@RequestBody DplyMastVO saveVO) throws Exception {

//        return specMngService.updateDplyMastStateToReg(saveVO);
        int check = specMngService.updateDplyMastStateToReg(saveVO);

        return check;

    }


    //
    @RequestMapping(value = "/dply/spec/specMng/selectDeployDealerCount.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectDeployDealerCount(@RequestBody SpecMngSearchVO searchVO) throws Exception {
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("specCd", searchVO.getsSpecCd());
        map.put("deployVerNo", searchVO.getsDeployVerNo());

        int check = specMngService.selectDeployDealerCount(map);

        return check;

    }

    @RequestMapping(value = "/dply/spec/specMng/selectSrcAppPopup.do", method = RequestMethod.GET)
    public String selectSrcAppPopup(Model model) throws Exception {

        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        return "/dply/spec/specMng/selectSrcAppPopup";
    }

    @RequestMapping(value = "/dply/spec/specMng/selectSrcFileFolderPopup.do", method = RequestMethod.GET)
    public String selectSrcFileFolderPopup(Model model) throws Exception {

        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        return "/dply/spec/specMng/selectSrcFileFolderPopup";
    }


}
