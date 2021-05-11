package chn.bhmc.dms.ser.ro.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.ser.ro.service.PreCheckService;
import chn.bhmc.dms.ser.ro.vo.PreCheckSearchVO;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PreCheckListController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 3.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Controller
public class PreCheckListController  extends HController{

    @Autowired
    PreCheckService preCheckService;

    /**
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 사전점검 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/preCheck/selectPreCheckListMain.do", method = RequestMethod.GET)
    public String selectPreCheckListMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        model.addAttribute("sToDt", sysDate);
        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );
        // 공통코드 : 예약구분
        model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "PC");

        // 공통코드 : 입고점검유형
        model.addAttribute("carAcptTp", commonCodeService.selectCommonCodesByCmmGrpCd("SER911", null, langCd));
        // 공통코드 : 브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 공통코드 : 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 공통코드 : 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 공통코드 : 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 공통코드 : 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 공통코드 : 예약상태
        model.addAttribute("resvStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 견적유형
        model.addAttribute("estTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 기타유형
        model.addAttribute("etcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        // 공통코드 : 성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 공통코드 : 승/상용 구분
        model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));
        // 공통코드 : 사전점검상태
        model.addAttribute("diagStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER023", null, langCd));
        // 공통코드 : 사전점검취소사유
        model.addAttribute("preChkCancReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER024", null, langCd));

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));
        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");  // UseYn
        model.addAttribute("carLineList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        model.addAttribute("dlrCd",  LoginUtil.getDlrCd());

        return "/ser/ro/preCheck/selectPreCheckListMain";

    }

    /**
    *
    * 사전점검  정보 조회
    *
    * @param searchVO - 사전점검  정보 조회
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/ser/ro/preCheck/selectPreCheckListMains.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPreCheckListMains(@RequestBody PreCheckSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(preCheckService.selectPreCheckListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(preCheckService.selectPreCheckListByCondition(searchVO));
        }

        return result;
    }

    /**
     * 사전점검 정보 목록 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreCheckSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/preCheck/selectPreCheckListCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectPreCheckListCnt(@RequestBody PreCheckSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(preCheckService.selectPreCheckListByConditionCnt(searchVO));
        return result;
    }


}
