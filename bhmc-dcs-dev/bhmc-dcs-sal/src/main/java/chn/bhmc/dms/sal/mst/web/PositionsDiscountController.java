package chn.bhmc.dms.sal.mst.web;

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
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.mst.service.PositionsDiscountService;
import chn.bhmc.dms.sal.mst.vo.PositionsDiscountAmtVO;
import chn.bhmc.dms.sal.mst.vo.PositionsDiscountSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PositionsDiscountController
 * @Description : 직책별 할인금액 관리 Controller
 * @author Bong
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.       Bong                최초 생성
 *  2016. 9. 07.    Kim Jin Suk        테이블 변경으로 수정.
 * </pre>
 */
@Controller
@RequestMapping(value = "/sal/mst/positionsDiscount")
public class PositionsDiscountController extends HController {
    /**
     * 직책별 할인금액 관리 서비스
     */
    @Resource(name="positionsDiscountService")
    PositionsDiscountService positionsDiscountService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차종 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 직책별 할인금액 관리 View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectPositionsDiscountMain.do", method = RequestMethod.GET)
    public String selectPositionsDiscountConditionMain(Model model) throws Exception {

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        //차종 콤보 조회
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, LocaleContextHolder.getLocale().getLanguage()));

        // 물류 서비스 평가 SAL030
        //model.addAttribute("dstbSerEvalInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL030", null, langCd));

        return "/sal/mst/positionsDiscount/selectPositionsDiscountMain";
    }

    /**
     * 차종에 따른 모델조회
     */
    @RequestMapping(value = "/selectModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModel(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectModelListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectModelListsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 차종과 모델에 따른 OCN조회
     */
    @RequestMapping(value = "/selectOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOcn(@RequestBody CarInfoSearchVO searchVO) throws Exception{

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectOcnListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectOcnListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 할인금액 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PositionsDiscountSearchVO
     * @return
     */
    @RequestMapping(value = "/selectPositionsDiscountAmt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPositionsDiscountAmtCondition(@RequestBody PositionsDiscountSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(positionsDiscountService.selectPositionsDiscountAmtConditionCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(positionsDiscountService.selectPositionsDiscountAmtCondition(searchVO));  //Result, Search
        }

        return result;
    }


    /**
     * 할인금액 등록 및 수정 처리를 한다.
     * @param saveVO - 수정 목록을 포함하는 PositionsDiscountSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/multiPositionsDiscountAmt.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPositionsDiscountAmt(@Validated @RequestBody BaseSaveVO<PositionsDiscountAmtVO> saveVO) throws Exception {
        positionsDiscountService.multiPositionsDiscountAmt(saveVO);
        return true;
    }
}
