package chn.bhmc.dms.ser.wac.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;
import chn.bhmc.dms.cmm.cmp.service.OfficeService;

import chn.bhmc.dms.cmm.cmp.service.DivisionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.wac.service.PwaApproveService;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaApproveController.java
 * @Description : PWA 승인 컨트롤러
 * @author Kwon Ki Hyun
 * @since 2016. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 3.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Controller
public class PwaApproveController extends HController{

    /**
     * PWA 승인 서비스
     */
    @Resource(name="pwaApproveService")
    PwaApproveService pwaApproveService;

    /**
     * 공통코드 관리 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    /**
     * 사업부 관리 서비스
     */
    @Resource(name="divisionService")
    DivisionService divisionService;


    /**
     * 사무소 관리 서비스
     */
    @Resource(name="officeService")
    OfficeService officeService;

    /**
     * LTS Model Mapping
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    /**
    *
    * PWA 승인 화면 메인
    *
    * @param model
    * @return PWA 승인 화면
    * @throws Exception
    */
    @RequestMapping(value="/ser/wac/pwaAppr/selectPwaApproveMain.do")
    public String selectPwaApproveMain(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd") );

        // PWA 유형코드
        model.addAttribute("pwaTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER100", null, langCd));
        // PWA 상태코드
        model.addAttribute("pwaStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER102", null, langCd));
        // 사용여부
        model.addAttribute("pwaCauYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER101", null, langCd));
        // 반송사유코드
        model.addAttribute("returnReasonCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER220", null, langCd));

        model.addAttribute("divisionList", divisionService.selectDivisionList());
        model.addAttribute("officeList",officeService.selectOfficesList());
        return "/ser/wac/pwaAppr/selectPwaApproveMain";

    }

    /**
     *
     * PWA 요청 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
     * @return PWA 요청 목록 데이터
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/pwaAppr/selectPwaApproveMains.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPwaApproveMains(@RequestBody PwaSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();
        result.setTotal(pwaApproveService.selectPwaApproveMainsByConditionCnt(searchVO));

        if(result.getTotal() != 0 ){
            result.setData(pwaApproveService.selectPwaApproveMainsByCondition(searchVO));
        }

        return result;
    }

    /**
     *
     * PWA 상세 정보 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
     * @return PWA 상세 정보 데이터
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/pwaAppr/selectPwaApproveByKey.do", method=RequestMethod.POST)
    @ResponseBody
    public PwaVO selectPwaApproveByKey(@RequestBody PwaSearchVO searchVO)throws Exception{

        return pwaApproveService.selectPwaApproveByKey(searchVO);
    }

    /**
     *
     * PWA 이력 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
     * @return PWA 요청 목록 데이터
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/pwaAppr/selectPwaHistory.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPwaHistory(@RequestBody PwaSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(pwaApproveService.selectPwaHistoryByConditionCnt(searchVO));

        if(result.getTotal() != 0 ){
            result.setData(pwaApproveService.selectPwaHistoryByCondition(searchVO));
        }

        return result;
    }

    /**
     *
     * PWA 공임 정보 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
     * @return PWA 공임  정보 데이터
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/pwaAppr/selectPwaApproveLbrs.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPwaApproveLbrs(@RequestBody PwaSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(pwaApproveService.selectPwaApproveLbrsByConditionCnt(searchVO));

        if(result.getTotal() != 0 ){
            result.setData(pwaApproveService.selectPwaApproveLbrsByCondition(searchVO));
        }

        return result;
    }

   /**
    *
    * PWA 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
    @RequestMapping(value="/ser/wac/pwaAppr/selectPwaApproveParts.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPwaApproveParts(@RequestBody PwaSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(pwaApproveService.selectPwaApprovePartsByConditionCnt(searchVO));

        if(result.getTotal() != 0 ){
            result.setData(pwaApproveService.selectPwaApprovePartsByCondition(searchVO));
        }

        return result;
    }

     /**
     *
     * PWA 요청 정보를 수정한다.
     *
     * @param saveVO - PWA 요청 등록/수정 목록을 포함하는 SaveVO
     * @return bindingResult
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/pwaAppr/updateStatePwaApproves.do", method=RequestMethod.POST)
    @ResponseBody
    public PwaVO updateStatePwaApproves(@Validated @RequestBody PwaVO pwaVO)throws Exception{

        return pwaApproveService.updateStatePwaApproves(pwaVO);
    }

}
