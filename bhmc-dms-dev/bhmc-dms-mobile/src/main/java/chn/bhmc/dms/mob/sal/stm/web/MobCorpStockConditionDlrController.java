package chn.bhmc.dms.mob.sal.stm.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.sal.stm.vo.CorpStockConditionSearchVO;

import chn.bhmc.dms.sal.stm.service.CorpStockConditionService;

import chn.bhmc.dms.sal.stm.service.CorporateAvailabilityService;

import chn.bhmc.dms.sal.stm.vo.CorporateAvailabilitySearchVO;

import chn.bhmc.dms.core.datatype.SearchResult;

import chn.bhmc.dms.sal.veh.service.CarInfoService;

import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 공장가용자원 현황
 *
 * @author HG
 * @since 2017. 2. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.02.17         HG              최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/sal/stm/corpStockConditionDlr")
public class MobCorpStockConditionDlrController extends HController {
    
     /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;
    
    /**
     * 법인재고현황 서비스
     */
    @Resource(name="corporateAvailabilityService")
    CorporateAvailabilityService corporateAvailabilityService;
    
       /**
      /**
     * 법인재고현황(전략오더) - DB 조회. : 변경요청.
     */
    @Resource(name="corpStockConditionService")
    private CorpStockConditionService corpStockConditionService;

    @RequestMapping(value = "/selectCorpStockConditionDlrMain.do", method = RequestMethod.GET)
    public String selectCorPorateAvailabilityMain(Model model) throws Exception {
        
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        
                //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/mob/sal/stm/corpStockConditionDlr/selectCorpStockConditionDlrMain";
    }
    
    @RequestMapping(value = "/selectCorpStockConditionDlrList.do", method = RequestMethod.GET)
    public String selectCorPorateAvailabilityList(Model model) throws Exception {

        return "/mob/sal/stm/corpStockConditionDlr/selectCorpStockConditionDlrList";
    }
    /*
    @RequestMapping(value = "/selectCorpStockConditionDlr.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCorpStockConditionDlr(@RequestBody CorporateAvailabilitySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        //result.setData(corporateAvailabilityService.selectCorporateAvailabilityByCondition(searchVO));
        result.setData(corpStockConditionService.selectCorpStockConditionsByCondition(searchVO));
        
        return result;
    }
    */
    @RequestMapping(value = "/selectCorpStockConditionDlr.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCorpStockConditionDlr(@RequestBody CorpStockConditionSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(corpStockConditionService.selectCorpStockConditionsByConditionCnt(searchVO));
        result.setData(corpStockConditionService.selectCorpStockConditionsByCondition(searchVO));
        return result;
    }

}
