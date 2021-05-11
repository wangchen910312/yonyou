package chn.bhmc.dms.par.pmm.web;

import java.util.HashMap;
import java.util.Map;

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

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.par.pmm.service.DealerInfoService;
import chn.bhmc.dms.par.pmm.vo.DealerInfoSearchVO;
import chn.bhmc.dms.par.pmm.vo.DealerInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerInfoController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Hyeong Gyuns
 * @since 2017. 7. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 28.     Lee Hyeong Gyun     최초 생성
 * </pre>
 */

@Controller
public class DealerInfoController extends HController {

    /**
     * 딜러정보 서비스
     */
    @Resource(name="dealerInfoService")
    DealerInfoService dealerInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 딜러정보 조회화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/dealerInfo/selectDealerInfoMain.do", method = RequestMethod.GET)
    public String selectDealerInfoMain(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlTypeList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR124", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));

        return "/par/pmm/dealerInfo/selectDealerInfoMain";
    }

    /**
     * 딜러정보 데이터를 조회한다.
     * @return
     */
/*    @RequestMapping(value = "/par/pmm/dealerInfo/selectDealerInfoList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealerInfoList(@RequestBody DealerInfoSearchVO searchVO) throws Exception  {

        SearchResult result = new SearchResult();

        result.setTotal(dealerInfoService.selectDealerInfoListCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(dealerInfoService.selectDealerInfoList(searchVO));
        }

        return result;
    }*/


    /**
     * 딜러 정보를 가져온다.
     * @param searchVO 딜러 조회 조건
     * @return 조회 조건을 만족하는 딜러 정보를 반환한다.
     */
    @RequestMapping(value="/par/pmm/dealerInfo/selectDealerInfoList.do",  method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectDealerInfoList(@RequestBody DealerInfoSearchVO searchVO) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();

        //딜러정보
        DealerInfoVO dealerInfoVO = dealerInfoService.selectDealerInfoList(searchVO);

        result.put("dealer", dealerInfoVO);

        return result;
    }

}
