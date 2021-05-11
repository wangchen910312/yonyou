package chn.bhmc.dms.sal.btc.web;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.sal.btc.service.SecondDealerService;
import chn.bhmc.dms.sal.btc.vo.SecondDealerSearchVO;
import chn.bhmc.dms.sal.btc.vo.SecondDealerVO;

/**
 *
 * 2급딜러
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.14         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/btc/secondDealer")
public class SecondDealerController extends HController {

    /**
     * 2급딜러 서비스
     */
    @Resource(name="secondDealerService")
    private SecondDealerService secondDealerService;


    /**
     * 2급딜러 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSecondDealerMain.do", method = RequestMethod.GET)
    public String selectSecondDealerMain(Model model) throws Exception {
        return "/sal/btc/secondDealer/selectSecondDealerMain";
    }

    /**
     * 2급딜러 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectSecondDealerSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSecondDealerSearch(@RequestBody SecondDealerSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(secondDealerService.selectSecondDealersByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(secondDealerService.selectSecondDealersByCondition(searchVO));
        }
        return result;
    }


    /**
     * 딜러 정보를 가져온다.
     * @param searchVO 딜러 조회 조건
     * @return 조회 조건을 만족하는 딜러 정보를 반환한다.
     */
    @RequestMapping(value="/selectSecondDealer.do",  method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectSecondDealer(@RequestBody SecondDealerSearchVO searchVO) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();
        List<SecondDealerVO> groupDealerList = new ArrayList<SecondDealerVO>();

        //딜러정보
        SecondDealerVO dealerVO = secondDealerService.selectDealerByKey(searchVO.getsLv2DlrCd());

        //동일그룹 딜러목록
        if(StringUtils.isNoneBlank(dealerVO.getDlrGrpCd())){
            SecondDealerSearchVO dealerGroupSearchVO = new SecondDealerSearchVO();
            dealerGroupSearchVO.setsDlrGrpCd(dealerVO.getDlrGrpCd());
            groupDealerList = secondDealerService.selectDealersByCondition(searchVO);
        }

        result.put("dealer", dealerVO);
        result.put("groupDealerList", groupDealerList);

        return result;

    }


    /**
     * 딜러 정보를 수정한다.
     * @param saveVO - 딜러정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/updateSecondDealer.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSecondDealer(@Validated @RequestBody SecondDealerVO saveVO) throws Exception {
        secondDealerService.updateDealer(saveVO);
        return true;
    }


    /**
     * 2급딜러조회 팝업
     */
    @RequestMapping(value = "/selectSecondDealerSearchPopup.do", method = RequestMethod.GET)
    public String selectSecondDealerSearchPopup(Model model) throws Exception{
        return "/sal/btc/secondDealer/selectSecondDealerSearchPopup";
    }




}
