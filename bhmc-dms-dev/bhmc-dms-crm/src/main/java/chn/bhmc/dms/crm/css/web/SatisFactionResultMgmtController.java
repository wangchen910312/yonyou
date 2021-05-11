package chn.bhmc.dms.crm.css.web;

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

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtSearchVO;

/**
 * 만족도조사 결과관리 컨트롤러
 *
 * @author Kim Hyun Ho
 * @since 2016. 03. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.11         LEE Kyo Jin            최초 생성
 * </pre>
 */


@Controller
public class SatisFactionResultMgmtController extends HController {


    /**
     * 만족도조사결과관리 서비스
     */
    @Resource(name="satisFactionResultMgmtService")
    SatisFactionResultMgmtService satisFactionResultMgmtService;

    /**
     * BHMC 만족도조사 결과 > BHMC 만족도조사 결과 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionResultManage/selectSatisFactionResultMgmtMain.do", method = RequestMethod.GET)
    public String selectSatisFactionResultMgmtMain(Model model) throws Exception {

        return "/crm/css/satisFactionResultManage/selectSatisFactionResultMgmtMain";
    }

    /**
     * BHMC 만족도조사 결과 > BHMC 만족도조사 결과 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 SatisFactionResultMgmtSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionResultManage/selectSatisFactionResultMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSatisFactionResultMgmt(@RequestBody SatisFactionResultMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if (searchVO.getsRegDtFrom() != null || searchVO.getsRegDtTo() != null) {
            Calendar startCal = Calendar.getInstance();
            Calendar endCal = Calendar.getInstance();

            int year;
            int month;
            int day;

            // 시작일
            startCal.setTime(searchVO.getsRegDtFrom());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsRegDtFrom(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsRegDtTo());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsRegDtTo(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        result.setTotal(satisFactionResultMgmtService.selectSatisFactionResultMgmtByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(satisFactionResultMgmtService.selectSatisFactionResultMgmtByCondition(searchVO));
        }

        return result;
    }

    /**
     * BHMC 만족도조사 결과 > BHMC 만족도조사 결과  > 상세 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 SatisFactionResultDtlMgmtSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionResultManage/selectSatisFactionResultDtlMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public SatisFactionResultDtlMgmtVO selectSatisFactionResultDtlMgmt(@RequestBody SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception {

        /**
         * columnList : 헤더 조회
         * dataSet    : 데이터 조회
         */
        SatisFactionResultDtlMgmtVO result = new SatisFactionResultDtlMgmtVO();
        result.setTotal(satisFactionResultMgmtService.selectSatisFactionResultDtlMgmtByConditionCnt(searchVO) );

        if (result.getTotal() != 0) {
            Map<String, List> map = satisFactionResultMgmtService.selectSatisFactionResultDtlDataSetMgmtByCondition(searchVO);

            result.setData( map.get("dataSet") );
            result.setColumnList( map.get("columnList") );
        }

        return result;
    }

}