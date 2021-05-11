package chn.bhmc.dms.dply.cmm.web;

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
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.dply.cmm.service.DplyCmmService;
import chn.bhmc.dms.dply.cmm.vo.CmmPrtySaveVO;
import chn.bhmc.dms.dply.cmm.vo.CmmPrtyVO;
import chn.bhmc.dms.dply.cmm.vo.DplyCmmSearchVO;
import chn.bhmc.dms.dply.cmm.vo.SimulationServerSaveVO;
import chn.bhmc.dms.dply.cmm.vo.SimulationServerVO;
import chn.bhmc.dms.dply.cmm.vo.SyncMessageTemplateSaveVO;
import chn.bhmc.dms.dply.cmm.vo.SyncMessageTemplateVO;
import chn.bhmc.dms.dply.spec.service.SpecMngService;
import chn.bhmc.dms.dply.spec.vo.RepositorySaveVO;
import chn.bhmc.dms.dply.spec.vo.RepositoryVO;
import chn.bhmc.dms.dply.spec.vo.SpecBundleSaveVO;
import chn.bhmc.dms.dply.spec.vo.SpecBundleVO;
import chn.bhmc.dms.dply.spec.vo.SpecMngSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BasicInfoMngController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 6. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 21.     Cheol Man Oh     최초 생성
 * </pre>
 */

@Controller
public class BasicInfoMngController extends HController {
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
     * SPEC 등록 관리 서비스
     */
    @Resource(name="specMngService")
    SpecMngService specMngService;

    /**
     * SyncCommandSendReceive 조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/mng/selectBasicInfoMngMain.do", method = RequestMethod.GET)
    public String selectNotificationHistoryMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        SpecMngSearchVO specMngSearchVO = new SpecMngSearchVO();
        model.addAttribute("repositoryDS", specMngService.selectRepository(specMngSearchVO));

        // 형상관리 PROPERTY LIST
        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        // Notification Type
        model.addAttribute("notificationTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM033", null, langCd));

        // REPOSITORY 작업명령어코드
        model.addAttribute("repositoryOperCmdTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM042", null, langCd));


        return "/dply/cmm/mng/selectBasicInfoMngMain";
    }

    /**
     * 시스템Property 정보를 조회한다
     * @param searchVO - 조회 조건을 포함하는 DplyCmmSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/cmm/mng/selectCmmPrtyList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCmmPrtyList(@RequestBody DplyCmmSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<CmmPrtyVO> list = null;

        list = dplyCmmService.selectCmmPrtyList(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    // 시스템Property 신규 등록, 수정
    @RequestMapping(value = "/dply/cmm/mng/multiCmmPrty.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiCmmPrty(@RequestBody CmmPrtySaveVO saveVO) throws Exception {
        return dplyCmmService.multiCmmPrty(saveVO);

    }

    /**
     * REPOSITORY 정보를 조회한다
     * @param searchVO - 조회 조건을 포함하는 DplyCmmSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/cmm/mng/selectRepository.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRepository(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<RepositoryVO> list = null;

        list = specMngService.selectRepository(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    // Repository 생성, 수정, 삭제
    @RequestMapping(value = "/dply/cmm/mng/multiRepository.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiRepository(@RequestBody RepositorySaveVO saveVO) throws Exception {
        return specMngService.multiRepository(saveVO);
    }


    /**
     * Message Template 정보를 조회한다
     * @param searchVO - 조회 조건을 포함하는 DplyCmmSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/cmm/mng/selectMessageTemplate.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMessageTemplate(@RequestBody DplyCmmSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<SyncMessageTemplateVO> list = null;

        HashMap<String, String> map = new HashMap<String, String>();

        list = dplyCmmService.selectMessageTemplateByCondition(map);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    // Message Template 신규 등록, 수정
    @RequestMapping(value = "/dply/cmm/mng/multiMessageTemplate.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiMessageTemplate(@RequestBody SyncMessageTemplateSaveVO saveVO) throws Exception {
        return dplyCmmService.multiMessageTemplate(saveVO);

    }

    /**
     * Virtual DMS Profile 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DplyCmmSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/cmm/mng/selectSimulationServer.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSimulationServer(@RequestBody DplyCmmSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<SimulationServerVO> list = null;

        HashMap<String, String> map = new HashMap<String, String>();

        list = dplyCmmService.selectSimulationServer(map);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    // Virtual DMS Profile 신규 등록, 수정
    @RequestMapping(value = "/dply/cmm/mng/multiSimulationServer.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiSimulationServer(@RequestBody SimulationServerSaveVO saveVO) throws Exception {
        return dplyCmmService.multiSimulationServer(saveVO);

    }

    /**
     * APP 정보를 조회한다
     * @param searchVO - 조회 조건을 포함하는 DplyCmmSearchVO
     * @return
     */
    @RequestMapping(value = "/dply/cmm/mng/selectAppInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAppInfo(@RequestBody SpecMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<SpecBundleVO> list = null;

        list = specMngService.selectAppInfo(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    // APP정보  생성, 수정, 삭제
    @RequestMapping(value = "/dply/cmm/mng/multiAppInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiAppInfo(@RequestBody SpecBundleSaveVO saveVO) throws Exception {
        return specMngService.multiAppInfo(saveVO);
    }


}
