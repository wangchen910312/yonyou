package chn.bhmc.dms.cmm.sci.web;

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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 공통코드 관리 컨트롤러
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
public class CommonCodeController extends HController {

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 공통코드 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/cmm/sci/commonCode/selectCommonCodeMain.do", method=RequestMethod.GET)
    public String selectCommonCodeMain(Model model) throws Exception {
        return "/cmm/sci/commonCode/selectCommonCodeMain";
    }

    /**
    * 공통코드 그룹 목록 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 CommonCodeGroupSearchVO
    * @return
    */
   @RequestMapping(value="/cmm/sci/commonCode/selectCommonCodeGroups.do", method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectCommonCodeGroups(@RequestBody CommonCodeGroupSearchVO searchVO) throws Exception {
       SearchResult result = new SearchResult();
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

       result.setTotal(commonCodeService.selectCommonCodeGroupsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(commonCodeService.selectCommonCodeGroupsByCondition(searchVO));
       }

       return result;
   }

   /**
    * 공통코드 그룹 정보를 저장한다.
    * @param saveVO - 공통코드 그룹 정보 등록/수정/삭제 목록을 포함하는 CommonCodeGroupSaveVO
    * @return
    */
   @RequestMapping(value="/cmm/sci/commonCode/multiCommonCodeGroups.do", method=RequestMethod.POST)
   @ResponseBody
   public boolean multiCommonCodeGroups(@Validated @RequestBody CommonCodeGroupSaveVO saveVO) throws Exception {
       commonCodeService.multiCommonCodeGroups(saveVO);
       return true;
   }

    /**
     * 공통코드 그룹 텍스트 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CommonCodeGroupTxtSearchVO
     * @return
     */
    @RequestMapping(value="/cmm/sci/commonCode/selectCommonCodeGroupTxts.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCommonCodeGroupTxts(@RequestBody CommonCodeGroupTxtSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(commonCodeService.selectCommonCodeGroupTxtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(commonCodeService.selectCommonCodeGroupTxtsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 공통코드 그룹 텍스트 정보를 등록한다.
     * @param saveVO - 공통코드 그룹 텍스트 정보 등록/수정/삭제 목록을 포함하는 CommonCodeGroupTxtSaveVO
     * @return
     */
    @RequestMapping(value="/cmm/sci/commonCode/multiCommonCodeGroupTxts.do", method=RequestMethod.POST)
    @ResponseBody
    public boolean multiCommonCodeGroupTxts(@Validated @RequestBody CommonCodeGroupTxtSaveVO saveVO) throws Exception {
        commonCodeService.multiCommonCodeGroupTxts(saveVO);
        return true;
    }

    /**
     * 공통코드 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CommonCodeSearchVO
     * @return
     */
    @RequestMapping(value="/cmm/sci/commonCode/selectCommonCodes.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCommonCodes(@RequestBody CommonCodeSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        result.setTotal(commonCodeService.selectCommonCodesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(commonCodeService.selectCommonCodesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 공통코드 정보를 등록한다.
     * @param saveVO - 공통코드 정보 등록/수정/삭제 목록을 포함하는 CommonCodeSaveVO
     * @return
     */
    @RequestMapping(value="/cmm/sci/commonCode/multiCommonCodes.do", method=RequestMethod.POST)
    @ResponseBody
    public boolean multiCommonCodes(@Validated @RequestBody CommonCodeSaveVO saveVO) throws Exception {
        commonCodeService.multiCommonCodes(saveVO);
        return true;
    }

    /**
     * 공통코드 그룹 텍스트 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CommonCodeTxtSearchVO
     * @return
     */
    @RequestMapping(value="/cmm/sci/commonCode/selectCommonCodeTxts.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCommonCodeTxts(@RequestBody CommonCodeTxtSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(commonCodeService.selectCommonCodeTxtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(commonCodeService.selectCommonCodeTxtsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 공통코드 텍스트 정보를 등록한다.
     * @param saveVO - 공통코드 텍스트 정보 등록/수정/삭제 목록을 포함하는 CommonCodeTxtSaveVO
     * @return
     */
    @RequestMapping(value="/cmm/sci/commonCode/multiCommonCodeTxts.do", method=RequestMethod.POST)
    @ResponseBody
    public boolean multiCommonCodeTxts(@Validated @RequestBody CommonCodeTxtSaveVO saveVO) throws Exception {
        commonCodeService.multiCommonCodeTxts(saveVO);
        return true;
    }

    /**
     * 공통코드 그룹 텍스트팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/cmm/sci/commonCode/selectCommonCodeGroupTxtPopup.do", method=RequestMethod.GET)
    public String selectCommonCodeGroupTxtPopup(Model model) throws Exception {
        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        return "/cmm/sci/commonCode/selectCommonCodeGroupTxtPopup";
    }

    /**
     * 공통코드 텍스트 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/cmm/sci/commonCode/selectCommonCodeTxtPopup.do", method=RequestMethod.GET)
    public String selectCommonCodeTxtPopup(Model model) throws Exception {
        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        return "/cmm/sci/commonCode/selectCommonCodeTxtPopup";
    }

}
