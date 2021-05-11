package chn.bhmc.dms.par.pcm.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.pcm.service.PurcRqstService;
import chn.bhmc.dms.par.pcm.vo.PurcRqstSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcRqstVO;

/**
 * 구매요청 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. xx. xx.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class PurcRqstController extends HController {

    /**
     * 구매요청 서비스
     */
    @Resource(name="purcRqstService")
    PurcRqstService purcRqstService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

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


    /**
     * 구매요청 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcRqst/selectPurcRqstMain.do", method = RequestMethod.GET)
    public String selectPurcRqstMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 구매요청유형 조회.
        model.addAttribute("purcReqTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR201", null, langCd));
        // 구매요청상태 공통코드정보 조회.
        model.addAttribute("purcReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR202", null, langCd));

        // 창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        model.addAttribute("strgeCdDs", storageService.selectStoragesByCondition(storageSearchVO));
        // 단위 공통코드정보 조회.
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("prcQtyUnitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        return "/par/pcm/purcRqst/selectPurcRqstMain";

    }

    /**
     * 구매요청 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcRqst/selectPurcRqstes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcRqstes(@RequestBody PurcRqstSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(purcRqstService.selectPurcRqstesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcRqstService.selectPurcRqstesByCondition(searchVO));
        }

        return result;
    }


    /**
     * 위탁서 부품예약 RO 정보를 등록한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcRqst/multiIssueReqDetailPartsRoes.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssueReqDetailPartsRoes(@Validated @RequestBody BaseSaveVO<IssueReqDetailVO> issueReqDetailVO, BindingResult bindingResult) throws Exception
    {
        purcRqstService.multiIssueReqDetailPartsRoes(issueReqDetailVO);
        return true;

    }

    /**
     * 구매오더를 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/pcm/purcRqst/updatePurcRqstCnfmByPurcOrd.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updatePurcRqstCnfmByPurcOrd(@Validated @RequestBody List<PurcRqstVO> list)  throws Exception {


        purcRqstService.updatePurcRqstCnfmByPurcOrd(list);

        return true;
    }

}
