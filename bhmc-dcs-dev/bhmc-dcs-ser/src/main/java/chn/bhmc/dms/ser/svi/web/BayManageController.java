package chn.bhmc.dms.ser.svi.web;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.BayManageVO;
import chn.bhmc.dms.ser.svi.vo.BayMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayManageController.java
 * @Description : BAY관리 컨트롤러
 * @author KyungMok Kim
 * @since 2016. 1. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 14.   KyungMok Kim     최초 생성
 * </pre>
 */

@Controller
public class BayManageController extends HController {

    @Autowired
    BayManageService bayManageService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    /**
     * Bay 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/svi/bayManage/selectBayManageMain.do", method = RequestMethod.GET)
    public String selectBayManageMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 공통코드 : BAY구분
        model.addAttribute("bayTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 수리유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER901", null, langCd));
        // 공통코드 : BAY 세부구분
        model.addAttribute("bayGrpTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER903", null, langCd));

        //사용여부
        model.addAttribute("userYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SER904", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/ser/svi/bayManage/selectBayManageMain";

    }

    /**
     * Bay관리 마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return
     */
    @RequestMapping(value="/ser/svi/bayManage/selectBayManages.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectBayManages(@RequestBody BayManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(bayManageService.selectBayMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(bayManageService.selectBayMastersByCondition(searchVO));
        }

        return result;

     }

    /**
     * Bay관리 정보를 등록한다.
     * @param saveVO - Bay관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/bayManage/multiBayManages.do", method = RequestMethod.POST)
    public @ResponseBody boolean multiBayManages(@Validated @RequestBody BayManageVO bayManageVO, BindingResult bindingResult) throws Exception {

        bayManageService.multiBayManages(bayManageVO);

        return true;

    }

    /**
     * Bay마스터 정보를 가져온다
     * @param saveVO - Bay관리
     * @param bindingResult
     * @return
     */
    @RequestMapping(value="/ser/svi/bayManage/selectBayMasterByKey.do",  method = RequestMethod.POST)
    public @ResponseBody BayMasterVO selectBayMasterByKey(@RequestBody BayManageSearchVO searchVO) throws Exception {

       return bayManageService.selectBayMasterByKey(searchVO);

    }


    /**
     * Bay디테일 리스트
     * @param
     * @return
     */
    @RequestMapping(value="/ser/svi/bayManage/selectBayDetails.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectBayDetails(@RequestBody BayManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(bayManageService.selectBayDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(bayManageService.selectBayDetailsByCondition(searchVO));
        }

        return result;

     }

    /**
     * Bay 삭제
     * @param
     * @return
     */
    @RequestMapping(value="/ser/svi/workGroupManage/deleteBayManage.do",  method = RequestMethod.POST)
    public @ResponseBody String deleteBayManage(@RequestBody BayMasterVO bayMasterVO) throws Exception {

        bayManageService.deleteBayManage(bayMasterVO);

        return "OK";
     }

}
