package chn.bhmc.dms.sal.stm.web;


import java.util.List;
import java.util.Map;

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
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.stm.service.StrOrdOcnBlockingService;
import chn.bhmc.dms.sal.stm.vo.StrOrdOcnBlockingSearchVO;
import chn.bhmc.dms.sal.stm.vo.StrOrdOcnBlockingVO;
import chn.bhmc.dms.sal.stm.vo.StrOrdOcnBlockingViewVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 전략오더OCN블러킹
 *
 * @author Kim Jin Suk
 * @since 2016. 7. 25
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.26          Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/stm/strOrdOcnBlocking")
public class StrOrdOcnBlockingController extends HController {

    /**
     * 전략오더OCN블러킹
     */
    @Resource(name="strOrdOcnBlockingService")
    StrOrdOcnBlockingService strOrdOcnBlockingService;

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
     * 전략오더OCN블러킹 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStrOrdOcnBlockingMain.do", method = RequestMethod.GET)
    public String selectStrOrdOcnBlockingMain(Model model) throws Exception {

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //model.addAttribute("columnList", "");

        return "/sal/stm/strOrdOcnBlocking/selectStrOrdOcnBlockingMain";
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
     * 전략오더OCN블러킹 조회
     * @param searchVO
     * @return
     */
    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/selectStrOrdOcnBlockingSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public StrOrdOcnBlockingViewVO selectStrOrdOcnBlockingSearch(@RequestBody StrOrdOcnBlockingSearchVO searchVO) throws Exception {

        /**
         * columnList : 전략오더OCN블러킹-헤더 조회
         * dataSet    : 전략오더OCN블러킹 조회
         */
        Map<String, List> map = strOrdOcnBlockingService.selectStrOrdOcnBlockingsByCondition(searchVO);

        StrOrdOcnBlockingViewVO result = new StrOrdOcnBlockingViewVO();

        result.setTotal(strOrdOcnBlockingService.selectStrOrdOcnBlockingsByConditionCnt(searchVO) );
        result.setData( map.get("dataSet") );
        result.setColumnList( map.get("columnList") );

        return result;
    }

    /**
     * 전략오더OCN블러킹 저장
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/multiStrOrdOcnBlockings.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiStrOrdOcnBlockings(@RequestBody Map<?,?> saveVO) throws Exception {
        return strOrdOcnBlockingService.multiStrOrdOcnBlockings(saveVO);
    }

    /**
     * 딜러 - 딜러 복사
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/strOrdOcnBlockingDlrCopys.do", method = RequestMethod.POST)
    @ResponseBody
    public int strOrdOcnBlockingDlrCopys(@RequestBody StrOrdOcnBlockingVO saveVO) throws Exception {
        return strOrdOcnBlockingService.strOrdOcnBlockingDlrCopys(saveVO);
    }

    /**
     * 전체딜러 복사
     */
    @RequestMapping(value = "/strOrdOcnBlockingAllDlrCopys.do", method = RequestMethod.POST)
    @ResponseBody
    public int strOrdOcnBlockingAllDlrCopys(@RequestBody Map<String,String> saveVO) throws Exception {
        return strOrdOcnBlockingService.strOrdOcnBlockingAllDlrCopys(saveVO);
    }

}
