package chn.bhmc.dms.sal.orm.web;


import javax.annotation.Resource;

import able.com.util.fmt.DateUtil;
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
import chn.bhmc.dms.sal.orm.service.MaintainOrderQueryResultsService;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderQueryResultsSearchVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderQueryResultsVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;

/**
 * 오더유지 결과조회
 *
 * @author Bong
 * @since 2016. 4. 22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.22         Bong            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/orm/maintainOrderQueryResults")
public class MaintainOrderQueryResultsController extends HController {

    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 금융 상품 관리 서비스
     */
    @Resource(name="maintainOrderQueryResultsService")
    MaintainOrderQueryResultsService maintainOrderQueryResultsService;

    /**
     * 오더유지 및 조회 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectMaintainOrderQueryResultsMain.do", method = RequestMethod.GET)
    public String selectMaintainOrderQueryResultsMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("sysDate", DateUtil.dateToSqlDate(maintainOrderQueryResultsService.selectSysDt()) );

        //주문유형(오더유형)
        model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, langCd));

        // 위약오더 상태 SAL022
        model.addAttribute("ptyOrdStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL022", null, langCd));

        // 책임구분 SAL023
        model.addAttribute("stockCauCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL023", null, langCd));

        // 발생원인 SAL025
        model.addAttribute("causesCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL025", null, langCd));


        //차종 콤보 조회
        VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();
        vehicleSearchVO.setUseYn("Y");
        model.addAttribute("carLineCdInfo", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));

        return "/sal/orm/maintainOrderQueryResults/selectMaintainOrderQueryResultsMain";
    }



    /**
     * 오더유지 결과조회 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MaintainOrderQueryResultsSearchVO
     * @return
     */
    @RequestMapping(value = "/selectMaintainOrderQueryResults.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMaintainOrderQueryResults(@RequestBody MaintainOrderQueryResultsSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(maintainOrderQueryResultsService.selectMaintainOrderQueryResultsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(maintainOrderQueryResultsService.selectMaintainOrderQueryResultsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 오더유지 결과조회 상세정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MaintainOrderQueryResultsVO
     * @return
     */
    @RequestMapping(value = "/selectMaintainOrderQueryResultsDet.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMaintainOrderQueryResultsDet(@RequestBody MaintainOrderQueryResultsVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        if(searchVO.getDlrCd() == null || "".equals(searchVO.getDlrCd())){
            searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        }

        result.setData(maintainOrderQueryResultsService.selectMaintainOrderQueryResultsDetByCondition(searchVO));

        return result;
    }


}
