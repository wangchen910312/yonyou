package chn.bhmc.dms.crm.crq.web;

import java.util.List;

import javax.annotation.Resource;

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

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.crm.crq.service.VocMgmtService;
import chn.bhmc.dms.crm.crq.vo.VocActiveSaveVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtSearchVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtVO;
import chn.bhmc.dms.crm.crq.vo.VocTpCdSummeryVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * VOC 관리 컨트롤러
 *
 * @author hyoung jun an
 * @since 2016. 3. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 * </pre>
 */

@Controller
public class VocMgmtController extends HController {

    /**
     * VOC관리 서비스
     */
    @Resource(name="vocMgmtService")
    VocMgmtService vocMgmtService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * 시스템 설정 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * VOC 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectVocMgmtMain.do", method = RequestMethod.GET)
    public String selectVocMgmtMain(Model model
            , @RequestParam(value="callTelNo", defaultValue="") String callTelNo
            , @RequestParam(value="vocNo", defaultValue="") String vocNo
                ) throws Exception {

        model.addAttribute("callTelNo", callTelNo);
        model.addAttribute("vocNo", vocNo);

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("vocTpCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM604", null, langCd));               //VOC유형코드            / VOC_TP_CD
        model.addAttribute("vocStatCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM624", null, langCd));               //VOC상태코드            / VOC_STAT_CD
        model.addAttribute("tendCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM609", null, langCd));                //성향코드                  / TEND_CD
        model.addAttribute("acptSrcCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM602", null, langCd));             //접수출처코드           / ACPT_SRC_CD
        model.addAttribute("activeGainPathCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM615", null, langCd));      //활동 획득 경로 코드  / ACTIVE_GAIN_PATH_CD
        model.addAttribute("cmplCauCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM601", null, langCd));             //불만원인코드           / CMPL_CAU_CD
        model.addAttribute("prorCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM623", null, langCd));                //우선순위코드           / PROR_CD
        model.addAttribute("procLmtCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM616", null, langCd));             //처리시한 코드          / PROC_LMT_CD
        model.addAttribute("pmoCauCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM620", null, langCd));              //승급 원인 코드         / PMO_CAU_CD
        model.addAttribute("vocTpSub1CdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM605", null, langCd));           //VOC유형하위1코드   / VOC_TP_SUB1_CD

        model.addAttribute("crm030List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));  //고객 및 연계인 관계

        model.addAttribute("activeStatCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM625", null, langCd));       //VOC 활동 상태         / ACTIVE_STAT_CD
        model.addAttribute("activeTpCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM626", null, langCd));         //VOC 활동 유형         / ACTIVE_TP_CD
        model.addAttribute("activeTpSubCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM627", null, langCd));      //VOC 활동 SUB 유형 / ACTIVE_TP_SUB_CD


        model.addAttribute("cmplStsfNmList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM628", null, langCd));      //문의만족도 / CMPL_STSF_NM

        model.addAttribute("sendCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM629", null, langCd));      //발송상태/ SEND_CD
        model.addAttribute("salesActiveSrcCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM630", null, langCd));      //영업활동정보출처 / SALES_ACTIVE_SRC_CD

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //성코드
        VocMgmtSearchVO vocMgmtSearchVO = new VocMgmtSearchVO();
        model.addAttribute("sungCdInfo", vocMgmtService.selectSungCdListByCondition(vocMgmtSearchVO));

        String mngScIdCtrl = "N";
        if (viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10277", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);

        model.addAttribute("loginUserId", LoginUtil.getUserId());
        model.addAttribute("loginUserNm", LoginUtil.getUserNm());
        model.addAttribute("loginDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("loginDlrNm", LoginUtil.getDlrNm());

        model.addAttribute("sysDate", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")+" "+systemConfigInfoService.selectStrValueByKey("timeFormat")));

        return "/crm/crq/vocMgmt/selectVocMgmtMain";
    }

    /**
     * VOC 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectVocMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVocMgmts(@RequestBody VocMgmtSearchVO searchVO, Model model) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
       
        if(searchVO.getsRegStartDt() != null || searchVO.getsRegEndDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsRegStartDt() == searchVO.getsRegEndDt()){
                // 시작일 = 종료일 동일한경우
            	Calendar startStartCal = Calendar.getInstance();
                startStartCal.setTime(searchVO.getsRegStartDt());
                year = startStartCal.get(Calendar.YEAR);
                month = startStartCal.get(Calendar.MONTH);
                day = startStartCal.get(Calendar.DATE);
                startStartCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegEndDt(startStartCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsRegEndDt() != null){
                // 종료일이 있는경우
                Calendar startEndCal = Calendar.getInstance();
                startEndCal.setTime(searchVO.getsRegEndDt());
                year = startEndCal.get(Calendar.YEAR);
                month = startEndCal.get(Calendar.MONTH);
                day = startEndCal.get(Calendar.DATE);
                startEndCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegEndDt(startEndCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }
        
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        result.setTotal(vocMgmtService.selectVocMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            List<VocMgmtVO> selectVocMgmtsByCondition = vocMgmtService.selectVocMgmtsByCondition(searchVO);
            result.setData(selectVocMgmtsByCondition);
        }

        return result;

    }

    /**
     * VOC 정보를 저장 한다.
     * @param marketingCampaignVO - VOC 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/insertVocMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public String insertVocMgmts(@Validated(Draft.class) @RequestBody VocMgmtVO vocMgmtVO)throws Exception {

        vocMgmtVO.setRegUsrId(LoginUtil.getUserId());
        vocMgmtVO.setUpdtUsrId(LoginUtil.getUserId());
        return vocMgmtService.insertVocMgmt(vocMgmtVO);
    }

    /**
     * VOC 정보를 저장 한다.
     * @param marketingCampaignVO - VOC 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/updateVocMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateVocMgmts(@Validated(Draft.class) @RequestBody VocMgmtVO vocMgmtVO)throws Exception {

        vocMgmtVO.setRegUsrId(LoginUtil.getUserId());
        vocMgmtVO.setUpdtUsrId(LoginUtil.getUserId());

        vocMgmtService.updateVocMgmt(vocMgmtVO);

        return true;
    }

    /**
     * VOC 유형 / 1급 SUB 유형 / 2급 SUB 유형에 따른 상태 조회(값 셋팅시에만 사용함)
     * SUB 유형 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectVocTpSubCdList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVocTpSubCdList(@RequestBody VocMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(vocMgmtService.selectVocTpSubCdListByCondition(searchVO));

        return result;
    }

    /**
     * 성코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectSungCdList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSungCdList(@RequestBody VocMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(vocMgmtService.selectSungCdListByCondition(searchVO));

        return result;
    }

    /**
     * 도시코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectCityCdList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCityCdList(@RequestBody VocMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(vocMgmtService.selectCityCdListByCondition(searchVO));

        return result;
    }

    /**
     * VOC활동 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectActives.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectActives(@RequestBody VocMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vocMgmtService.selectActivesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vocMgmtService.selectActivesByCondition(searchVO));
        }

        return result;

    }
    
    /**
     * 服务请求管理增加下载功能 add by fengdequan
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectActivesCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectActivesCnt(@RequestBody VocMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vocMgmtService.selectActivesByConditionCnt(searchVO));

        return result;

    }

    /**
     * 상태를 변경한다.
     * @param marketingCampaignVO - VOC 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/updateVocStatCd.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateVocStatCd(@Validated(Modify.class) @RequestBody VocMgmtVO vocMgmtVO)throws Exception {

        vocMgmtService.updateVocStatCd(vocMgmtVO);

        return true;
    }


    /**
     * VOC활동 정보를 등록한다.
     * @param saveVO - VOC활동 등록/수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/multiActives.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiActives(@Validated @RequestBody VocActiveSaveVO saveVO) throws Exception {
        vocMgmtService.multiActives(saveVO);
        return true;
    }

    /**
     * VOC 상세 정보를 조회한다.
     * @param VocMgmtSearchVO - VOC_NO, DLR_CD
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectVocMgmtByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public VocMgmtVO selectCustomerCareMgmtByKey(@RequestBody VocMgmtSearchVO searchVO) throws Exception {

        VocMgmtVO vo = vocMgmtService.selectVocMgmtByKey(searchVO);
        return vo;

    }

    /**
     * VOC 엑셀Export 수량 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectVocMgmtsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectVocMgmtsExcelExportCnt(@RequestBody VocMgmtSearchVO searchVO, Model model) throws Exception {

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startStartCal = Calendar.getInstance();
        if(searchVO.getsRegStartDt() != null || searchVO.getsRegEndDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsRegStartDt() == searchVO.getsRegEndDt()){
                // 시작일 = 종료일 동일한경우
                startStartCal.setTime(searchVO.getsRegStartDt());
                year = startStartCal.get(Calendar.YEAR);
                month = startStartCal.get(Calendar.MONTH);
                day = startStartCal.get(Calendar.DATE);
                startStartCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegEndDt(startStartCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsRegEndDt() != null){
                // 종료일이 있는경우
                Calendar startEndCal = Calendar.getInstance();
                startEndCal.setTime(searchVO.getsRegEndDt());
                year = startEndCal.get(Calendar.YEAR);
                month = startEndCal.get(Calendar.MONTH);
                day = startEndCal.get(Calendar.DATE);
                startEndCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegEndDt(startEndCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/
        return vocMgmtService.selectVocMgmtsByConditionCnt(searchVO);

    }

    /**
     * VOC 요약정보 조회 ( 진행중인 상태의 전체 목록 / 검색조건이랑 상관없음 )
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectVocTpCdSummeryCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public VocTpCdSummeryVO selectVocTpCdSummeryCnt(@RequestBody VocMgmtSearchVO searchVO) throws Exception {

        VocTpCdSummeryVO vocTpCdSummeryVO = vocMgmtService.selectVocTpCdSummeryCnt(searchVO);
        return vocTpCdSummeryVO;

    }

}