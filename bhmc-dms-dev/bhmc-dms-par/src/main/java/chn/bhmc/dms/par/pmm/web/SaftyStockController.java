package chn.bhmc.dms.par.pmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.SafetyStockSettingService;
import chn.bhmc.dms.par.pmm.service.SafetyStockWeightService;
import chn.bhmc.dms.par.pmm.vo.SaftyStockSearchVO;
import chn.bhmc.dms.par.pmm.vo.SaftyStockSettingSaveVO;
import chn.bhmc.dms.par.pmm.vo.SaftyStockSettingVO;

/**
 * SaftyStock Controller
 *
 * @author In Bo Shim
 * @since 2016. 05. 02.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 02.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class SaftyStockController extends HController {

    /**
     * 안전재고산출 파라미터 서비스
     */
    @Resource(name="safetyStockSettingService")
    SafetyStockSettingService safetyStockSettingService;

    /**
     * 안전재고산출 가중치 서비스
     */
    @Resource(name="safetyStockWeightService")
    SafetyStockWeightService safetyStockWeightService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 안전재고산출 파라미터 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/safetyStock/selectSafetyStockParameterMain.do", method = RequestMethod.GET)
    public String selectVenderMasterMain(Model model) throws Exception {

        return "/par/pmm/safetyStock/selectSafetyStockParameterMain";
    }

    /**
     * 안전재고산출 파라미터 데이타를 추가한다.
     * @param venderMasterVO - 안전재고산출 파라미터 데이타 VO
     * @return 성공 유무
     */
    @RequestMapping(value = "/par/pmm/safetyStock/insertSafetyStockParameters.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSafetyStockParameters(@Validated @RequestBody SaftyStockSettingVO saftyStockSettingVO) throws Exception
    {
        safetyStockSettingService.insertSafetyStockSetting(saftyStockSettingVO);

        return true;
    }

    /**
     * 안전재고산출 파라미터 데이타를 수정한다.
     * @param venderMasterVO - 안전재고산출 파라미터 데이타 VO
     * @return 성공 유무
     */
    @RequestMapping(value = "/par/pmm/safetyStock/updateSafetyStockParameters.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSafetyStockParameters(@Validated @RequestBody SaftyStockSettingVO saftyStockSettingVO) throws Exception
    {
        safetyStockSettingService.updateSafetyStockSetting(saftyStockSettingVO);

        return true;
    }

    /**
     * 안전재고산출 파라미터 데이타를 가져온다.
     * @param venderMasterVO - 안전재고산출 파라미터 데이타 VO
     * @return 성공 유무
     */
    @RequestMapping(value = "/par/pmm/safetyStock/selectSafetyStockParameterSingleByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SaftyStockSettingVO selectSafetyStockParameterByKey(@RequestBody SaftyStockSearchVO searchVO) throws Exception
    {

        SaftyStockSettingVO saftyStockSettingVO = new SaftyStockSettingVO();

        saftyStockSettingVO = safetyStockSettingService.selectSafetyStockSettingSingleByKey(searchVO);

        if(saftyStockSettingVO == null){
            saftyStockSettingVO = new SaftyStockSettingVO();
        }

        return saftyStockSettingVO;
    }

    /**
     * 안전재고산출 파라미터 데이타를 추가/수정한다.
     * @param venderMasterVO - 안전재고산출 파라미터 데이타 VO
     * @return 성공 유무
     */
    @RequestMapping(value = "/par/pmm/safetyStock/multiSafetyStockParameters.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSafetyStockParameters(@Validated @RequestBody SaftyStockSettingVO saftyStockSettingVO) throws Exception
    {
        safetyStockSettingService.multiSafetyStockSetting(saftyStockSettingVO);

        return true;
    }

    /**
     * 안전재고산출 파라미터 데이타를 추가/수정한다.
     * @param venderMasterVO - 안전재고산출 파라미터 데이타 VO
     * @return 성공 유무
     */
    @RequestMapping(value = "/par/pmm/safetyStock/multiSafetyStockInfoes.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSafetyStockInfoes(@Validated @RequestBody SaftyStockSettingSaveVO saftyStockSettingSaveVO) throws Exception
    {
        safetyStockSettingService.multiSafetyStockSettingInfo(saftyStockSettingSaveVO);

        return true;
    }


    /**
     * 안전재고산출 가중치 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SaftyStockSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/safetyStock/selectSafetyStockWeights.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSafetyStockWeights(@RequestBody SaftyStockSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());

        if(safetyStockWeightService.selectSafetyStockWeightsByConditionCnt(searchVO) == 0){
            SaftyStockSettingVO saftyStockSettingVO = new SaftyStockSettingVO();
            saftyStockSettingVO.setStdDmndPrid(searchVO.getsStdDmndPrid());
            safetyStockSettingService.multiSafetyStockSetting(saftyStockSettingVO);
        }

        result.setTotal(safetyStockWeightService.selectSafetyStockWeightsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(safetyStockWeightService.selectSafetyStockWeightsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 안전재고산출 계산 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/safetyStock/selectSafetyStockCalculateMain.do", method = RequestMethod.GET)
    public String selectSafetyStockCalculateMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        return "/par/pmm/safetyStock/selectSafetyStockCalculateMain";
    }

    /**
     * 안전재고관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/safetyStock/selectSafetyStockManageMain.do", method = RequestMethod.GET)
    public String selectSafetyStockManageMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        return "/par/pmm/safetyStock/selectSafetyStockManageMain";
    }

    /**
     * 안전재고조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/safetyStock/selectSafetyStockMain.do", method = RequestMethod.GET)
    public String selectSafetyStockMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        return "/par/pmm/safetyStock/selectSafetyStockMain";
    }
}
