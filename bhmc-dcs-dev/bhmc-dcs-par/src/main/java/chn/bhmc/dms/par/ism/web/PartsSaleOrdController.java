package chn.bhmc.dms.par.ism.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.par.ism.service.PartsSaleOrdService;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.veh.service.CarInfoService;

/**
 * 부품판매관리 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 2. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 15.     Ju Won Lee      최초 생성
 * </pre>
 */
@Controller
public class PartsSaleOrdController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 부품판매 관리 서비스
     */
    @Resource(name="partsSaleOrdService")
    PartsSaleOrdService partsSaleOrdService;


    /**
     * 부품판매 집계 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrdStatusSummary.do", method = RequestMethod.GET)
    public String selectPartsSaleOrdStatusSummary(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList        = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList  = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        //storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("itemDstinList",   commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("unitCdList",      unitCdList);
        model.addAttribute("custTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR321", null, langCd));
        model.addAttribute("ordStatCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR323", null, langCd));
        model.addAttribute("saleTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR322", null, langCd));
        model.addAttribute("storageList",     storageList);
        // 공통코드 : RO상태
        model.addAttribute("roStatCdList",    commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));


        return "/par/ism/issue/selectPartsSaleOrdStatusSummary";

    }

    /**
     * 부품판매화면 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectPartsSaleOrds.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsSaleOrds(@RequestBody PartsSaleOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        result.setTotal(partsSaleOrdService.selectPartsSaleOrdByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partsSaleOrdService.selectPartsSaleOrdByCondition(searchVO));
        }

        return result;
    }
}
