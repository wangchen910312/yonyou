package chn.bhmc.dms.crm.cso.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.SalesOpptFailMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 판매기회 실패관리 컨트롤러
 *
 * @author in moon lee
 * @since 2016.03.11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.22         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/cso/salesOpptFailMgmt")
@Controller
public class SalesOpptFailMgmtController extends HController {

    /**
     * 판매기회 실패관리 서비스
     */
    @Resource(name="salesOpptFailMgmtService")
    SalesOpptFailMgmtService salesOpptFailMgmtService;

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOpptMgmtService")
    SalesOpptMgmtService salesOpptMgmtService;

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
    * 판매기회 실패관리 메인 화면을 출력한다.
    * 4.4.10.001-01
    * @return
    */
    @RequestMapping(value = "/selectSalesOpptFailMgmtMain.do", method = RequestMethod.GET)
    public String selectSalesOpptFailMgmtMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        model.addAttribute("failTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM220", null, langCd));            // 실패유형
        model.addAttribute("failCau1CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM221", null, langCd));          // 실패1급원인
        model.addAttribute("failCau2CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM222", null, langCd));          // 실패2급원인
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));             // 등록차량 브랜드

        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계
        model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM213", null, langCd));       // 판매기회출처
        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM212", null, langCd));           // 성공확률
        model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM219", null, langCd));          // 전출상태

        return "/crm/cso/salesOpptFailMgmt/selectSalesOpptFailMgmtMain";

    }

    /**
     * 판매기회 실패관리 목록 데이터를 조회한다.
     * 4.4.10.001-01
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptFailMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptFailMgmts(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        if(searchVO.getsStartRegDt() != null || searchVO.getsEndRegDt() != null ){

            int year;
            int month;
            int day;

            // TODO[이인문] 시작일 / 종료일이 바껴서 들어오는경우 자동 처리.
            if(searchVO.getsStartRegDt() == searchVO.getsEndRegDt()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsStartRegDt());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )
            }else if(searchVO.getsEndRegDt() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsEndRegDt());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )
            }
        }
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        // 판매기회 실패 상태 코드 set / CRM215
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(salesOpptMgmtService.selectSalesOpptMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOpptMgmtService.selectSalesOpptMgmtsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 판매기회 실패관리 상세 정보를 조회한다.
     * 4.4.10.001-01
     * @param TestDriveResvSearchVO searchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptFailMgmtByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SalesOpptMgmtVO selectSalesOpptFailMgmtByKey(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

        // TODO[이인문] 로그인 SC/ 권한 이랑 파라미터SC 권한 체크 ( 아무나 get방식으로 param 보내서 조회 하면 안되니까.. )

        SalesOpptMgmtVO vo = salesOpptMgmtService.selectSalesOpptMgmtByKey(searchVO);
        return vo;

    }

    /**
     * 판매기회 실패관리 상세 목록 데이터를 조회한다.
     * 4.4.10.001-01
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptFailDetlMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptFailDetlMgmts(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesOpptFailMgmtService.selectSalesOpptFailDetlMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOpptFailMgmtService.selectSalesOpptFailDetlMgmtsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 판매기회 실패조회 메인 화면을 출력한다.
     * 4.4.10.002-01
     * @return
     */
//    @RequestMapping(value = "/selectSalesOpptFailMain.do", method = RequestMethod.GET)
//    public String selectSalesOpptFailMain(Model model) throws Exception {
//
//        // 차종
//        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
//        carInfoSearchVO.setUseYn("Y");                       // 사용여부
//        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
//
//        model.addAttribute("failTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM220", null, langCd));            // 실패유형
//        model.addAttribute("failCau1CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM221", null, langCd));          // 실패1급원인
//        model.addAttribute("failCau2CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM222", null, langCd));          // 실패2급원인
//        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));             // 등록차량 브랜드
//
//        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계
//        model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM213", null, langCd));       // 판매기회출처
//        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM212", null, langCd));           // 성공확률
//        model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM219", null, langCd));          // 전출상태
//
//        return "/crm/cso/salesOpptFailMgmt/selectSalesOpptFailMain";
//
//    }

    /**
     * 판매기회 실패 목록 데이터를 조회한다.
     * 4.4.10.002-01
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
//    @RequestMapping(value = "/selectSalesOpptFails.do", method = RequestMethod.POST)
//    @ResponseBody
//    public SearchResult selectSalesOpptFails(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {
//
//        SearchResult result = new SearchResult();
//
//        /******************************************
//         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
//         ******************************************/
//        Calendar startCal = Calendar.getInstance();
//        if(searchVO.getsStartRegDt() != null || searchVO.getsEndRegDt() != null ){
//
//            int year;
//            int month;
//            int day;
//
//            // TODO[이인문] 시작일 / 종료일이 바껴서 들어오는경우 자동 처리.
//            if(searchVO.getsStartRegDt() == searchVO.getsEndRegDt()){
//                // 시작일 = 종료일 동일한경우
//                startCal.setTime(searchVO.getsStartRegDt());
//                year = startCal.get(Calendar.YEAR);
//                month = startCal.get(Calendar.MONTH);
//                day = startCal.get(Calendar.DATE);
//                startCal.set(year, month, day+1, 00, 00, 00);
//                searchVO.setsEndRegDt(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )
//            }else if(searchVO.getsEndRegDt() != null){
//                // 종료일이 있는경우
//                Calendar endCal = Calendar.getInstance();
//                endCal.setTime(searchVO.getsEndRegDt());
//                year = endCal.get(Calendar.YEAR);
//                month = endCal.get(Calendar.MONTH);
//                day = endCal.get(Calendar.DATE);
//                endCal.set(year, month, day+1, 00, 00, 00);
//                searchVO.setsEndRegDt(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )
//            }
//        }
//        /******************************************
//         *** 날짜 검색 조건 종료 ***********************
//         ******************************************/
//
//        result.setTotal(salesOpptMgmtService.selectSalesOpptMgmtsByConditionCnt(searchVO));
//
//        if(result.getTotal() != 0){
//
//            result.setData(salesOpptMgmtService.selectSalesOpptMgmtsByCondition(searchVO));
//        }
//
//        return result;
//    }

    /**
     * 판매기회 실패 상세 정보를 조회한다.
     * 4.4.10.002-01
     * @param TestDriveResvSearchVO searchVO
     * @return
     */
//    @RequestMapping(value = "/selectSalesOpptFailByKey.do", method = RequestMethod.POST)
//    @ResponseBody
//    public SalesOpptMgmtVO selectSalesOpptFailByKey(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {
//
//        // TODO[이인문] 로그인 SC/ 권한 이랑 파라미터SC 권한 체크 ( 아무나 get방식으로 param 보내서 조회 하면 안되니까.. )
//
//        SalesOpptMgmtVO vo = salesOpptMgmtService.selectSalesOpptMgmtByKey(searchVO);
//        return vo;
//
//    }


    /**
     * 판매기회 실패 상세 목록 데이터를 조회한다.
     * 4.4.10.002-01
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
//    @RequestMapping(value = "/selectSalesOpptFailDetls.do", method = RequestMethod.POST)
//    @ResponseBody
//    public SearchResult selectSalesOpptFailDetls(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {
//
//        SearchResult result = new SearchResult();
//
//        result.setTotal(salesOpptFailMgmtService.selectSalesOpptFailDetlMgmtsByConditionCnt(searchVO));
//
//        if(result.getTotal() != 0){
//
//            result.setData(salesOpptFailMgmtService.selectSalesOpptFailDetlMgmtsByCondition(searchVO));
//        }
//
//        return result;
//    }

}