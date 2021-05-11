package chn.bhmc.dms.mis.tss.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mis.tss.service.TargetSalemanStatusService;
import chn.bhmc.dms.mis.tss.vo.TargetSalemanStatusSearchVO;


/**
 * <pre>
 * [딜러사] 판매고문 실적현황
 * </pre>
 *
 * @ClassName   : TargetSalemanStatusController.java
 * @Description : [딜러사] 판매고문 실적현황
 * @author chibeom.song
 * @since 2016. 10. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 23.     chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class TargetSalemanStatusController extends HController {

    /**
     * [딜러사] 판매고문 실적현황 서비스
     */
    @Resource(name="targetSalemanStatusService")
    TargetSalemanStatusService targetSalemanStatusService;

    /**
     * [딜러사] 판매고문 실적현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tss/selectTargetSalemanStatusMain.do", method = RequestMethod.GET)
    public String selectTargetSalemanStatusMain(TargetSalemanStatusSearchVO searchVO, Model model) throws Exception {

        return "/mis/tss/selectTargetSalemanStatusMain";
    }

    /**
     * [제조사] 년간 목표 등록  목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tss/selectTargetSalemanStatusGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetSalemanStatusGrid(@RequestBody TargetSalemanStatusSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetSalemanStatusService.selectTargetSalemanStatusGridCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetSalemanStatusService.selectTargetSalemanStatusGrid(searchVO));
        }

        return result;

    }

}
