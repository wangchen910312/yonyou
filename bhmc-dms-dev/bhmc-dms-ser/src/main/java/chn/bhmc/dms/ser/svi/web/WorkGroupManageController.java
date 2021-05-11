package chn.bhmc.dms.ser.svi.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.WorkGroupManageService;
import chn.bhmc.dms.ser.svi.vo.WorkGroupManageSaveVO;
import chn.bhmc.dms.ser.svi.vo.WorkGroupManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.WorkGroupMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkGroupManageController.java
 * @Description : 소조관리 컨트롤러
 * @author KyungMok Kim
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

@Controller
public class WorkGroupManageController extends HController {

    @Autowired
    WorkGroupManageService workGroupManageService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 소조관리 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/svi/workGroupManage/selectWorkGroupManageMain.do", method = RequestMethod.GET)
    public String selectWorkGroupManageMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //사용여부 목록
        model.addAttribute("wkgrpStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER096", null, langCd));
        
        // 공통코드 : 수리유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        return "/ser/svi/workGroupManage/selectWorkGroupManageMain";

    }

    /**
     * 소조관리 마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return
     */
    @RequestMapping(value="/ser/svi/workGroupManage/selectWorkGroupManages.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectWorkGroupManages(@RequestBody WorkGroupManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(workGroupManageService.selectWorkGroupMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(workGroupManageService.selectWorkGroupMastersByCondition(searchVO));
        }

        return result;

     }

    /**
     * 소조관리 마스터 정보를 등록한다.
     * @param saveVO - WorkGroup관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/workGroupManage/multiWorkGroupMasters.do", method = RequestMethod.POST)
    public @ResponseBody boolean multiWorkGroupManages(@Validated @RequestBody WorkGroupManageSaveVO saveVO, BindingResult bindingResult) throws Exception {

        workGroupManageService.multiWorkGroupMasters(saveVO);

        return true;

    }

    /**
     * 소조 마스터 정보를 가져온다
     * @param saveVO - WorkGroup관리
     * @param bindingResult
     * @return
     */
    @RequestMapping(value="/ser/svi/workGroupManage/selectWorkGroupMasterByKey.do",  method = RequestMethod.POST)
    public @ResponseBody WorkGroupMasterVO selectWorkGroupMasterByKey(@RequestBody WorkGroupManageSearchVO searchVO) throws Exception {

       return workGroupManageService.selectWorkGroupMasterByKey(searchVO);

    }

    /**
     * 소조관리 상세 정보를 등록한다.
     * @param saveVO - 소조관리 상세 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/workGroupManage/multiWorkGroupDetails.do", method = RequestMethod.POST)
    public @ResponseBody boolean multiWorkGroupDetails(@Validated @RequestBody WorkGroupManageSaveVO saveVO) throws Exception {

        workGroupManageService.multiWorkGroupDetails(saveVO);

        return true;

    }

    /**
     * 소조 디테일 리스트
     * @param
     * @return
     */
    @RequestMapping(value="/ser/svi/workGroupManage/selectWorkGroupDetails.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectWorkGroupDetails(@RequestBody WorkGroupManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(workGroupManageService.selectWorkGroupDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(workGroupManageService.selectWorkGroupDetailsByCondition(searchVO));
        }

        return result;

     }
    
    /**
     * 소조관리 상세 정보를 삭제한다.
     * @param saveVO - 소조관리 상세 삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/workGroupManage/deleteWorkGroups.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteWorkGroups(@Validated @RequestBody WorkGroupMasterVO workGroupMasterVO) throws Exception {

        workGroupManageService.deleteWorkGroups(workGroupMasterVO);

        return true;

    }
}
