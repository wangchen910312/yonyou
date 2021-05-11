package chn.bhmc.dms.crm.css.web;

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
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionScoreMngController.java
 * @Description : 만족도조사 낮은점수 처리 관리
 * @author Kim Hyun Ho
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Controller
public class SatisFactionScoreMngController extends HController {
    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * 만족도 관리 서비스
     */
    @Resource(name="satisFactionManageService")
    SatisFactionManageService satisFactionManageService;

    /**
     * 만족도결과(대상자) 서비스
     */
    @Resource(name="satisFactionMobileResultService")
    SatisFactionMobileResultService satisFactionMobileResultService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 만족도조사 낮은점수 처리관리 > 만족도조사 낮은점수 처리관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionScoreMng/selectSatisFactionScoreMngMain.do", method = RequestMethod.GET)
    public String selectSatisFactionScoreMngMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //만족도 조사 유형
        List<CommonCodeVO> stsfIvstMthCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM091", null, langCd);
        model.addAttribute("stsfIvstMthCdList", stsfIvstMthCdList);

        //만족도 조사 수단
        List<CommonCodeVO> stsfIvstExpdCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM092", null, langCd);
        model.addAttribute("stsfIvstExpdCdList", stsfIvstExpdCdList);

        //만족도 조사 타입
        List<CommonCodeVO> stsfIvstTpCdList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM094", null, langCd);
        model.addAttribute("stsfIvstTpCdList", stsfIvstTpCdList);

        model.addAttribute("sysDateExcelNm", DateUtil.getDate("yyyyMMddHHmm"));     // 엑셀 이름에 날짜지정할때 하이픈(-)이 들어가면 안됨. 그래서 날짜포맷 임시로 지정함

        return "/crm/css/satisFactionScoreMng/selectSatisFactionScoreMngMain";
    }

    /**
     * 만족도조사 낮은점수 처리관리 > 만족도 조사 낮은점수 처리관리 목록을 조회한다.
     * @param searchVO - 만족도 조사결과 현황 SatisFactionMobileResultSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionScoreMng/selectSatisFactionScoreMngs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSatisFactionPresents(@RequestBody SatisFactionMobileResultSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();


        result.setTotal(satisFactionMobileResultService.selectSatisFactionPresentsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(satisFactionMobileResultService.selectSatisFactionPresentsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 만족도조사 낮은점수 처리관리 > 만족도 조사 낮은점수 관리 처리
     * @param resultVO - 만족도 조사결과 현황 SatisFactionMobileResultVO
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionScoreMng/updateVocResult.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateVocResult(@RequestBody SatisFactionMobileResultVO resultVO)throws Exception {
        int result = 0;

        //[TODO]만족도조사 낮은점수 처리를 한다.
        result = satisFactionMobileResultService.updateVocResult(resultVO);

        return result;
    }


    /**
     * 만족도조사 낮은점수 처리관리 > 만족도 조사 낮은점수 처리관리 목록 엑셀Export 수량 데이터를 조회한다.
     * @param searchVO - 만족도 조사결과 현황 SatisFactionMobileResultSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionScoreMng/selectSatisFactionScoreMngsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectSatisFactionScoreMngsExcelExportCnt(@RequestBody SatisFactionMobileResultSearchVO searchVO)throws Exception {
        //[TODO]VOC요청 여부가 "Y" 인 것만 조회( 만족도조사결과와 만졷고 조사 낮은점수 처리관리 쿼리 같이 사용함)
        searchVO.setsVocYn("Y");
        return satisFactionMobileResultService.selectSatisFactionPresentsByConditionCnt(searchVO);
    }


}
