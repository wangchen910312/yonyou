package chn.bhmc.dms.crm.dmm.web;

import java.util.ArrayList;
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

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCalcAcceptVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCalcPointInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipCalcController.java
 * @Description : 블루멤버십 정산 컨트롤러
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
public class BlueMembershipCalcController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="blueMembershipCalcService")
    BlueMembershipCalcService blueMembershipCalcService;

    /**
     * 블루멤버십 관리 서비스
     */
    @Resource(name="blueMembershipInterfaceService")
    BlueMembershipInterfaceService blueMembershipInterfaceService;

    /**
     * 블루멤버십 정산 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipCalc/selectBlueMembershipCalcMain.do", method = RequestMethod.GET)
    public String selectSatisFactionScoreMngMain(Model model) throws Exception {

        //카드형태
        model.addAttribute("pointCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM802", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/crm/dmm/blueMembershipCalc/selectBlueMembershipCalcMain";
    }

    /**
     * 블루멤버십 정산 정보를 조회 한다.
     * @param blueMembershipCalcSearchVO - 블루멤버십 정산 정보
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipCalc/selectBlueMembershipCalcs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlueMembershipCalcs(@RequestBody BlueMembershipCalcSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        int year;
        int month;
        int day;

        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )kimhh
         ******************************************/
        if(searchVO.getsStartDt() != null || searchVO.getsEndDt() != null ){

            // 시작일
            startCal.setTime(searchVO.getsStartDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = 1;
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsStartDt(startCal.getTime());
            searchVO.setsOccrDtFrom(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsEndDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            //day = endCal.get(Calendar.DATE);
            //day = endCal.get(Calendar.DAY_OF_MONTH);
            day = endCal.getMaximum(Calendar.DAY_OF_MONTH);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsEndDt(endCal.getTime());
            searchVO.setsOccrDtTo(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/


        result.setTotal(blueMembershipCalcService.selectBlueMembershipCalcsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(blueMembershipCalcService.selectBlueMembershipCalcsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 블루멤버십 정산 상세 정보를 조회 한다.
     * @param blueMembershipCalcSearchVO - 블루멤버십 정산 상세 정보
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipCalc/selectBlueMembershipCalcDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlueMembershipCalcDetails(@RequestBody BlueMembershipCalcSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        int year;
        int month;
        int day;

        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )kimhh
         ******************************************/
        //시작일
        startCal.setTime(searchVO.getsOccrDt());
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        day = startCal.get(Calendar.DATE);
        startCal.set(year, month, day, 00, 00, 00);
        searchVO.setsOccrDtFrom(startCal.getTime());

        // 종료일
        endCal.setTime(searchVO.getsOccrDt());
        year = endCal.get(Calendar.YEAR);
        month = endCal.get(Calendar.MONTH);
        day = endCal.get(Calendar.DATE);
        //endCal.get(Calendar.)

        //정산월 선택시 해당정산월의 마지막 날을 Setting하기 위해서 하단부 추가
        endCal.set(year, month,day);
        day = endCal.getActualMaximum(endCal.DAY_OF_MONTH);//해당 정산월의 마지막 날을 조회
        endCal.set(year, month, day, 23, 59, 59);//마지막날 Setting

        searchVO.setsOccrDtTo(endCal.getTime());

        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/


        result.setTotal(blueMembershipCalcService.selectBlueMembershipCalcDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(blueMembershipCalcService.selectBlueMembershipCalcDetailsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 블루멤버십 정산 상세 정보를 조회 한다.
     * @param blueMembershipCalcSearchVO - 블루멤버십 정산 상세 정보
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipCalc/updateBlueMembershipCalcAcceptInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public void updateBlueMembershipCalcAcceptInfo()throws Exception {

        //[TODO]김현주 TEST 임시 개발
        BlueMembershipIfCalcAcceptVO acceptVO = new BlueMembershipIfCalcAcceptVO();
        acceptVO.setDealerId(LoginUtil.getDlrCd());
        acceptVO.setBeginDate("20160401");
        acceptVO.setEndDate("");
        acceptVO.setTotalAmt("3500");
        acceptVO.setTotalPoint("350");
        acceptVO.setIsAgree("Y");
        acceptVO.setComment("");

        List<BlueMembershipIfCalcPointInfoVO> pointList = new ArrayList<BlueMembershipIfCalcPointInfoVO>();
        BlueMembershipIfCalcPointInfoVO pointVO = new BlueMembershipIfCalcPointInfoVO();
//        pointVO.setUserId("fe5a3b9d-755f-4c2d-86c7-66405a2e6159");//Bluemembership ID
//        pointVO.setPhone("18310989221"); //휴대폰 번호
//        pointVO.setIdentityNumber("413026197912247845");//신분증 번호
//        pointVO.setVIN("LBETLBFC2GY122594");//VIN 번호
//        pointVO.setConsumeType("0");//소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기 정비, 8:판금 )
//        pointVO.setConsumePoints("200");//소비 포인트 ( 적립인 경우 값을 0 )
//        pointVO.setTotalCost("5000");//총 비용
//        pointVO.setPointCost("2000");//소비 금액(포인트 대신 결재 비용 )
//        pointVO.setRewardPoints("498");//발생 포인트
        pointVO.setConsumeDate("20161017110724");//소비 시간 (yyyyMMddHHmmss)
        pointList.add(pointVO);

        BlueMembershipIfCalcPointInfoVO pointVO2 = new BlueMembershipIfCalcPointInfoVO();
//        pointVO.setUserId("fe5a3b9d-755f-4c2d-86c7-66405a2e6159");//Bluemembership ID
//        pointVO.setPhone("18310989221"); //휴대폰 번호
//        pointVO.setIdentityNumber("413026197912247845");//신분증 번호
//        pointVO.setVIN("LBETLBFC2GY122594");//VIN 번호
//        pointVO.setConsumeType("0");//소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기 정비, 8:판금 )
//        pointVO.setConsumePoints("150");//소비 포인트 ( 적립인 경우 값을 0 )
//        pointVO.setTotalCost("4626");//총 비용
//        pointVO.setPointCost("1500");//소비 금액(포인트 대신 결재 비용 )
//        pointVO.setRewardPoints("461");//발생 포인트
        pointVO.setConsumeDate("20161017154618");//소비 시간 (yyyyMMddHHmmss)
        pointList.add(pointVO2);

        acceptVO.setPointUseList(pointList);

        blueMembershipInterfaceService.updateCalcAcceptInfo(acceptVO);
        //BlueMembershipIfBaseVO updateCalcAcceptInfo(BlueMembershipIfCalcAcceptVO paramVO);
    }
}
