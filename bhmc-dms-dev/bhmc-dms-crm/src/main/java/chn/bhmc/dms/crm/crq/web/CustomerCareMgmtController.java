package chn.bhmc.dms.crm.crq.web;

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

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.tmp.service.MessageTemplateService;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateSearchVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.crm.cmm.service.CrmTargExtractService;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO;
import chn.bhmc.dms.crm.crq.service.CustomerCareMgmtService;
import chn.bhmc.dms.crm.crq.vo.CustomerCareSearchVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareVO;

/**
 * 고객케어 컨트롤러
 *
 * @author in moon lee
 * @since 2016.05.02.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.02         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/crq/customerCare")
@Controller
public class CustomerCareMgmtController extends HController {

    /**
     * 고객케어 관리 서비스
     */
    @Resource(name="customerCareMgmtService")
    CustomerCareMgmtService customerCareMgmtService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 메시지템플릿 관리 서비스
     */
    @Resource(name="messageTemplateService")
    MessageTemplateService messageTemplateService;

    /**
     * 마케팅 캠페인 서비스
     */
    @Resource(name="crmTargExtractService")
    CrmTargExtractService crmTargExtractService;

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 고객케어 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCustomerCareMgmtMain.do", method = RequestMethod.GET)
    public String selectCustomerCareMgmtMain(Model model ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("activeTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM101", null, langCd));     // 고객케어 유형코드 ( CRM101 )

        MessageTemplateSearchVO searchVO = new MessageTemplateSearchVO();
        searchVO.setsMesgTmplTp(MessageTemplateVO.MESG_TMPL_TP_SMS);
        searchVO.setsMesgTmplGrpTp("02");      // CRM 에서 사용하는 문자 템플릿은 sMesgTmplGrpTp : 02 조회 조건 필수! 추후 다른 파트에서 사용하려면 수정해야함
        model.addAttribute("smsTemplateList", messageTemplateService.selectMessageTemplatesByCondition(searchVO));     // SMS 템플릿

        model.addAttribute("custExtrTermCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM501", null, langCd));     // 고객추출조건명

        CrmTargExtractSearchVO searchVO2 = new CrmTargExtractSearchVO();
        model.addAttribute("custExtrTermCdListTmp", crmTargExtractService.selectCrmTargExtractMastersByCondition(searchVO2));  //고객추출조건명

        model.addAttribute("sysDate", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));


        return "/crm/crq/customerCare/selectCustomerCareMgmtMain";
    }

    /**
     * 고객케어 관리 목록 데이터를 조회한다.
     * @param CustomerCareSearchVO - 판매고문, 시작월, 종료월
     * @return
     */
    @RequestMapping(value = "/selectCustomerCareMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustomerCareMgmts(@RequestBody CustomerCareSearchVO searchVO) throws Exception {

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startStartCal = Calendar.getInstance();
        if(searchVO.getsStartStartDt() != null || searchVO.getsStartEndDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsStartStartDt() == searchVO.getsStartEndDt()){
                // 시작일 = 종료일 동일한경우
                startStartCal.setTime(searchVO.getsStartStartDt());
                year = startStartCal.get(Calendar.YEAR);
                month = startStartCal.get(Calendar.MONTH);
                day = startStartCal.get(Calendar.DATE);
                startStartCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsStartEndDt(startStartCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsStartEndDt() != null){
                // 종료일이 있는경우
                Calendar startEndCal = Calendar.getInstance();
                startEndCal.setTime(searchVO.getsStartEndDt());
                year = startEndCal.get(Calendar.YEAR);
                month = startEndCal.get(Calendar.MONTH);
                day = startEndCal.get(Calendar.DATE);
                startEndCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsStartEndDt(startEndCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        SearchResult result = new SearchResult();

        result.setTotal(customerCareMgmtService.selectCustomerCareMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(customerCareMgmtService.selectCustomerCareMgmtsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 고객케어 상세 정보를 조회한다.
     * @param CustomerCareSearchVO - 고객케어번호
     * @return
     */
    @RequestMapping(value = "/selectCustomerCareMgmtByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public CustomerCareVO selectCustomerCareMgmtByKey(@RequestBody CustomerCareSearchVO searchVO) throws Exception {

        CustomerCareVO vo = customerCareMgmtService.selectCustomerCareMgmtByKey(searchVO);
        return vo;

    }

    /**
     * 고객케어 스케줄 정보를 저장 한다.
     * @param CustomerCareVO - 고객케어 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiCustomerCareMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiCustomerCareMgmts(@Validated @RequestBody CustomerCareVO salesActiveVO)throws Exception {

        // 고객케어관리에서 등록후 고객케어 번호를 return
        int custCareSeq;
        custCareSeq = customerCareMgmtService.multiCustomerCareMgmts(salesActiveVO);
        return custCareSeq;

    }

    /**
     * 고객케어 정보를 삭제 한다.
     * @param CustomerCareSearchVO - custCareSeq(고객케어번호)
     * @return 삭제 수량
     */
    @RequestMapping(value = "/deleteCustomerCareMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteCustomerCareMgmt(@RequestBody CustomerCareSearchVO searchVO)throws Exception {

        // 고객케어관리에서 등록후 고객케어 번호를 return
        int resultCnt = 0 ;
        resultCnt = customerCareMgmtService.deleteCustomerCareMgmt(searchVO);
        return resultCnt;

    }

    /**
     * 고객케어실행 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCustomerCareRunMain.do", method = RequestMethod.GET)
    public String selectCustomerCareRunMain(Model model ) throws Exception {

        model.addAttribute("sysDate", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));
        model.addAttribute("activeTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM101", null, LocaleContextHolder.getLocale().getLanguage()));     // 고객케어 유형코드 ( CRM101 )
        model.addAttribute("receiveRsltCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM064", null, LocaleContextHolder.getLocale().getLanguage()));     // SMS발송결과

        return "/crm/crq/customerCare/selectCustomerCareRunMain";
    }


    /**
     * 고객케어 실행 목록 데이터를 조회한다.
     * @param CustomerCareSearchVO - 판매고문, 시작월, 종료월
     * @return
     */
    @RequestMapping(value = "/selectCustomerCareRuns.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustomerCareRunRuns(@RequestBody CustomerCareSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(customerCareMgmtService.selectCustomerCareMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(customerCareMgmtService.selectCustomerCareMgmtsByCondition(searchVO));
        }

        return result;

    }


    /**
     * 대상자 고객을 추출한다.
     * @param marketingCampaignVO - 마케팅 캠페인 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/selectTargetExtractSave.do", method = RequestMethod.POST)
    @ResponseBody
    public String selectTargetExtractSave(@RequestBody CustomerCareVO customerCareVO)throws Exception {

        return customerCareMgmtService.selectTargetExtractSave(customerCareVO);


    }



}