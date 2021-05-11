package chn.bhmc.dms.par.pmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ItemClassService;
import chn.bhmc.dms.par.pmm.vo.ItemClassSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 부품등급 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. 07. 26
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.26         In Bo Shim            최초 생성
 * </pre>
 */

@Controller
public class ItemClassController extends HController {

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
     * 부품등급 정보 서비스
     */
    @Resource(name="itemClassService")
    ItemClassService itemClassService;

    /**
     * 부품등록조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemClass/selectItemClassMain.do", method = RequestMethod.GET)
    public String selectItemClassMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        commonCodeSearchVO.setsLangCd(langCd);
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        model.addAttribute("spyrCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));

        //차종 , 중고차-자사-차종
        model.addAttribute("modelCdList", carInfoService.selectModelListsByCondition(carInfoSearchVO));
        //useYnList
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        return "/par/pmm/itemClass/selectItemClassMain";

    }

    /**
     * 부품등급 정보를 수정한다.
     * @param saveVO - 저장 할 ItemMasterSendVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemClass/updateItemClassProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateItemClassProcedure() throws Exception
    {
        ItemClassSearchVO seachVO = new ItemClassSearchVO();
        seachVO.setsDlrCd(LoginUtil.getDlrCd());

        itemClassService.updateItemClassProcedure(seachVO);

        return true;
    }

}
