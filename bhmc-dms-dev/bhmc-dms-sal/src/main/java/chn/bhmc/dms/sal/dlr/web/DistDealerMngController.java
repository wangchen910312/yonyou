package chn.bhmc.dms.sal.dlr.web;


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
import chn.bhmc.dms.sal.dlr.service.DistDealerMngService;
import chn.bhmc.dms.sal.dlr.vo.DistDealerSearchVO;
import chn.bhmc.dms.sal.dlr.vo.DistDealerVO;



/**
 * 지역딜러(사무소)관리
 *
 * @author Kim yewon
 * @since 2016. 5. 25
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.25           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/dlr/distDlr")
public class DistDealerMngController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 지역딜러(사무소)관리 서비스
     */
    @Resource(name="distDealerMngService")
    DistDealerMngService distDealerMngService;


    /**
     * 지역딜러(사무소)관리 - 사무소  Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectDistDealerMngMain.do", method = RequestMethod.GET)
    public String selectDistDealerMngMain(Model model) throws Exception {

        //조건기간구분 SAL027
        model.addAttribute("dutyCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM027", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/dlr/distDlr/selectDistDealerMngMain";
    }


    /**
     * 지역딜러(사무소)관리 - 사무소 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    @RequestMapping(value = "/selectDistDealerMng.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDistDealerMng(@RequestBody DistDealerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(distDealerMngService.selectDistDealerMngByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(distDealerMngService.selectDistDealerMngByCondition(searchVO));
        }

        return result;
    }



    /**
     * 지역딜러(사무소)관리 - 딜러 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    @RequestMapping(value = "/selectDealer.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealer(@RequestBody DistDealerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(distDealerMngService.selectDealerByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(distDealerMngService.selectDealerByCondition(searchVO));
        }

        return result;
    }



    /**
     * 지역딜러(사무소)관리 - 딜러 정보 저장.
     * @param saveVO - 지역딜러(사무소)관리 - 딜러 저장할 내용 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/saveDistDealer.do", method = RequestMethod.POST)
    public @ResponseBody boolean saveDistDealer(@RequestBody DistDealerVO vo) throws Exception {

        distDealerMngService.saveDistDealer(vo);

        return true;

    }



}
