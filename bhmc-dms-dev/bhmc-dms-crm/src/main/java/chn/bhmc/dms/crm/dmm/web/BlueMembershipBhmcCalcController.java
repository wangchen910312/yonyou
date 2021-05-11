package chn.bhmc.dms.crm.dmm.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipBhmcCalcService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipBhmcCalcSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipBhmcCalcVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfBaseVO;
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
public class BlueMembershipBhmcCalcController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="blueMembershipBhmcCalcService")
    BlueMembershipBhmcCalcService blueMembershipBhmcCalcService;

    /**
     * 블루멤버십 관리 서비스
     */
    @Resource(name="blueMembershipInterfaceService")
    BlueMembershipInterfaceService blueMembershipInterfaceService;

    /**
     * 블루멤버십 정산 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipCalc/selectBlueMembershipBhmcCalcMain.do", method = RequestMethod.GET)
    public String selectSatisFactionScoreMngMain(Model model) throws Exception {

        return "/crm/dmm/blueMembershipCalc/selectBlueMembershipBhmcCalcMain";
    }

    /**
     * 블루멤버십 정산 정보를 조회 한다.
     * @param blueMembershipCalcSearchVO - 블루멤버십 정산 정보
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipCalc/selectBlueMembershipBhmcCalcs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlueMembershipCalcs(@RequestBody BlueMembershipBhmcCalcSearchVO searchVO)throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(blueMembershipBhmcCalcService.selectBlueMembershipCalcsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(blueMembershipBhmcCalcService.selectBlueMembershipCalcsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 블루멤버십 정산 상세 정보를 조회 한다.
     * @param blueMembershipCalcSearchVO - 블루멤버십 정산 상세 정보
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipCalc/selectBlueMembershipBhmcCalcDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlueMembershipCalcDetails(@RequestBody BlueMembershipBhmcCalcSearchVO searchVO)throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(blueMembershipBhmcCalcService.selectBlueMembershipCalcDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(blueMembershipBhmcCalcService.selectBlueMembershipCalcDetailsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 블루멤버십 정산 상세 정보를 조회 한다.
     * @param blueMembershipCalcSearchVO - 블루멤버십 정산 상세 정보
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipCalc/updateBlueMembershipBhmcCalcAcceptInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateBlueMembershipCalcAcceptInfo(@RequestBody BlueMembershipBhmcCalcVO bhmcCalcVO)throws Exception {

        boolean updtResult = false;

        BlueMembershipBhmcCalcVO detailVO = blueMembershipBhmcCalcService.selectBlueMembershipCalcsByKey(bhmcCalcVO);

        if( detailVO != null){

            String dlrCd = detailVO.getDlrCd();

            BlueMembershipIfCalcAcceptVO acceptVO = new BlueMembershipIfCalcAcceptVO();

            // 정산 상세 목록 가져오기
            BlueMembershipBhmcCalcSearchVO searchVO =  new BlueMembershipBhmcCalcSearchVO();
            searchVO.setsDlrCd(dlrCd);
            searchVO.setsCalcSeq(bhmcCalcVO.getCalcSeq());
            List<BlueMembershipIfCalcPointInfoVO> pointList = blueMembershipBhmcCalcService.selectBlueMembershipPointInfosByCondition(searchVO);

            double occrPointVal = 0;
            double occrPointCost = 0;

            if ( pointList.size() > 0 ) {

                acceptVO.setPointUseList(pointList);

                for (BlueMembershipIfCalcPointInfoVO blueMembershipIfCalcPointInfoVO : pointList) {
                    occrPointVal += Integer.parseInt(blueMembershipIfCalcPointInfoVO.getOccrPointVal());
                    occrPointCost += Double.valueOf(blueMembershipIfCalcPointInfoVO.getOccrPointCost());
                };

            };

            Date calcStartDate = detailVO.getCalcStartDt();
            String calcStartDt = "";
            if ( calcStartDate != null ){
                calcStartDt = DateUtil.getDate(detailVO.getCalcStartDt(),"yyyyMMdd");       // BM 정산시 날짜포맷은 yyyyMMdd로 fix
            }
            Date calcEndDate = detailVO.getCalcStartDt();
            String calcEndDt = "";
            if ( calcEndDate != null ){
                calcEndDt = DateUtil.getDate(detailVO.getCalcEndDt(),"yyyyMMdd");           // BM 정산시 날짜포맷은 yyyyMMdd로 fix
            }

            acceptVO.setDealerId(dlrCd);
            acceptVO.setBeginDate(calcStartDt);
            acceptVO.setEndDate(calcEndDt);
            acceptVO.setIsAgree(bhmcCalcVO.getCalcAcceptYn());
            acceptVO.setComment(bhmcCalcVO.getCalcAcceptYnCont());
            acceptVO.setTotalPoint(String.valueOf(occrPointVal));       // 포인트 합계
            acceptVO.setTotalAmt(String.valueOf(occrPointCost));        // 금액 합계

            BlueMembershipIfBaseVO ifResult = blueMembershipInterfaceService.updateCalcAcceptInfo(acceptVO);

            if (ifResult.getIsSuccess()) {

                // 정산 동의여부 I/F 후 결과 저장.
                bhmcCalcVO.setUpdtUsrId(LoginUtil.getUserId());
                int updateCalcAcceptResult = blueMembershipBhmcCalcService.updateCalcAcceptInfo(bhmcCalcVO);

                if ( updateCalcAcceptResult == 1 ){
                    updtResult = true;
                } else {
                    updtResult = false;
                };

            };

        }

        return updtResult;

    }


    /**
     * 블루멤버십 정산 상세 엑셀Export 수량 데이터를 조회한다.
     * @param BlueMembershipBhmcCalcSearchVO - 정산일련번호
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipCalc/selectBlueMembershipBhmcCalcDetailsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectCustomerCareExtrTargetsExcelExportCnt(@RequestBody BlueMembershipBhmcCalcSearchVO searchVO) throws Exception {
        return blueMembershipBhmcCalcService.selectBlueMembershipCalcDetailsByConditionCnt(searchVO);
    }
}