package chn.bhmc.dms.sal.stm.web;


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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.stm.service.CorpStockConditionDlrService;
import chn.bhmc.dms.sal.stm.service.CorpStockConditionService;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;



/**
 * [딜러]법인재고현황(전략오더)
 *
 * @author Kim Jin Suk
 * @since 2016. 7. 29
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.29          Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/stm/corpStockConditionDlr")
public class CorpStockConditionDlrController extends HController {

    /**
     * [딜러]법인재고현황(전략오더)
     */
    @Resource(name="corpStockConditionDlrService")
    CorpStockConditionDlrService corpStockConditionDlrService;


    /**
     * 법인재고현황(전략오더) - DB 조회. : 변경요청.
     */
    @Resource(name="corpStockConditionService")
    CorpStockConditionService corpStockConditionService;


    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 법인재고현황(전략오더) Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCorpStockConditionDlrMain.do", method = RequestMethod.GET)
    public String selectCorpStockConditionDlrMain(Model model) throws Exception {

        //배기등급 : SAL159
        model.addAttribute("dispGradeDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL159", null, LocaleContextHolder.getLocale().getLanguage()));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/stm/corpStockCondition/selectCorpStockConditionDlrMain";
    }

    /**
     * 차종에 따른 모델조회
     */
    @RequestMapping(value = "/selectModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModel(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        //searchVO.setUseYn("Y");                       // 사용여부

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
     * [딜러]법인재고현황(전략오더) 조회( 인터페이스 조회 )
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectCorpStockConditionDlrSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCorpStockConditionDlrSearch(@RequestBody CorpStockConditionSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(corpStockConditionDlrService.selectCorpStockConditionDlrsByCondition(searchVO));
        return result;
    }


    /**
     * [딜러]법인재고현황(전략오더) 조회 (DB조회)
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectCorpStockConditionDlrSearchs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCorpStockConditionDlrSearchs(@RequestBody CorpStockConditionSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(corpStockConditionService.selectCorpStockConditionsByConditionCnt(searchVO));
        result.setData(corpStockConditionService.selectCorpStockConditionsByCondition(searchVO));
        return result;
    }


}
