package chn.bhmc.dms.crm.dmm.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipCardService;
import chn.bhmc.dms.crm.dmm.vo.MembershipCardSaveVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipCardSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipCardVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipCardController.java
 * @Description : 멤버십 카드관리 컨트롤러
 * @author Kim Hyun Ho
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Controller
public class MembershipCardController extends HController{

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 멤버십 카드 서비스
     */
    @Resource(name="membershipCardService")
    MembershipCardService membershipCardService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 멤버십카드 등록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipCard/selectMembershipCardMain.do", method = RequestMethod.GET)
    public String selectMembershipCardMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));
        //카드형태
        model.addAttribute("cardFormCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM082", null, langCd));

        return "/crm/dmm/membershipCard/selectMembershipCardMain";
    }

    /**
     * 멤버십카드 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipCard/selectMembershipCards.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipCards(@RequestBody MembershipCardSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(membershipCardService.selectMembershipsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(membershipCardService.selectMembershipsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 멤버십 카드 정보를 등록한다.
     * @param saveVO - 멤버십 카드 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipCard/multiMembershipCards.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiMembershipCards(@Validated @RequestBody MembershipCardSaveVO saveVO) throws Exception {

        membershipCardService.multiMembershipCards(saveVO);
        return true;
    }

    /**
     * 멤버십 카드 정보를 엑셀로 일괄등록한다.
     * @param saveVO - 멤버십 카드 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipCard/selectMembershipCardUploadPopup.do", method = RequestMethod.GET)
    public String selectMembershipCardUploadPopup(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("baseNames", baseNames);
        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));
        //카드형태
        model.addAttribute("cardFormCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM082", null, langCd));

        return "/crm/dmm/membershipCard/selectMembershipCardUploadPopup";
    }

    @RequestMapping(value = "/crm/dmm/membershipCard/insertMembershipCardUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertMembershipCardUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<MembershipCardVO> list = new ArrayList<MembershipCardVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){

            try{
                //ExcelReader<DBMessageSourceVO> excelReader = new ExcelReader<DBMessageSourceVO>(DBMessageSourceVO.class, uploadFile.getInputStream(), 0);
                ExcelReader<MembershipCardVO> excelReader = new ExcelReader<MembershipCardVO>(MembershipCardVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);

                result.setTotal(list.size());
                result.setData(list);

                status.setStep(ExcelUploadStatus.COMPLETED);
            }catch(ExcelDataBindingException e){
                log.error(e.getMessage(), e);
                status.addError(e.getRowNo(), e.getColNo(), e.getFieldValue(), e.getMessage());
            }catch(Exception e){
                log.error(e.getMessage(), e);
                status.addError(e.getMessage());
            }
        }

        return result;

    }

    /**
     * 멤버십카드 일괄등록 데이터를 저장 한다.
     * @return
     */
    /*@RequestMapping(value = "/crm/dmm/membershipCard/insertMembershipCardSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean uploadSave(@Validated @RequestBody MembershipCardSaveVO membershipCardUploadList) throws Exception {

        membershipCardService.insertMembershipCardSave(membershipCardUploadList.getMembershipCardUploadList() );
        return true;
    }*/
    @RequestMapping(value = "/crm/dmm/membershipCard/insertMembershipCardSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean uploadSave(@Validated @RequestBody MembershipCardSaveVO membershipCardUploadList) throws Exception {

        membershipCardService.insertMembershipCardSave(membershipCardUploadList.getMembershipCardUploadList() );
        return true;
    }

    /**
     * 멤버십 카드 정보를 조회하는 팝업을 연다.
     * @param saveVO - 멤버십 카드 정보 조회
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipCard/selectMembershipCardSearchPopup.do", method = RequestMethod.GET)
    public String selectMembershipCardSearchPopup(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));
        //카드형태
        model.addAttribute("cardFormCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM082", null, langCd));

        return "/crm/dmm/membershipCard/selectMembershipCardSearchPopup";
    }

    /**
     * 미사용 포인트 카드 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipCard/selectMembershipCardPopups.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipCardPopups(@RequestBody MembershipCardSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(membershipCardService.selectMembershipCardPopupsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(membershipCardService.selectMembershipCardPopupsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 미사용 포인트/충전 카드 목록에서 하나만을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipCard/selectMembershipCardOne.do", method = RequestMethod.POST)
    @ResponseBody
    public MembershipCardVO selectMembershipCardOne(@RequestBody MembershipCardSearchVO searchVO,HttpServletRequest request) throws Exception {
        MembershipCardVO data = membershipCardService.selectMembershipCardOnesByCondition(searchVO);
        return data;
    }

}
