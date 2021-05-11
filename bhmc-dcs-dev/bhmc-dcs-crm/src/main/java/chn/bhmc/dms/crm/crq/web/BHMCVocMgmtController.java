package chn.bhmc.dms.crm.crq.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.crm.crq.service.VocMgmtService;
import chn.bhmc.dms.crm.crq.vo.VocMgmtSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * BHMC VOC 관리 컨트롤러
 *
 * @author In moon Lee
 * @since 2016.05.06.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.06         In moon Lee            최초 생성
 * </pre>
 */
@RequestMapping(value = "/crm/crq/BHMCVoc")
@Controller
public class BHMCVocMgmtController extends HController {

    /**
     * VOC관리 서비스
     */
    @Resource(name="vocMgmtService")
    VocMgmtService vocMgmtService;

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
     *
     * TODO 20160517 메뉴삭제됨. 추후 삭제.
     *
     * BHMC VOC 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectBHMCVocMgmtMain.do", method = RequestMethod.GET)
    public String selectVocMgmtMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("crm601List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM601", null, langCd));  //VOC 불만의 원인
        model.addAttribute("crm602List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM602", null, langCd));  //VOC 접수출처
        model.addAttribute("crm603List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM603", null, langCd));  //우선순위코드
        model.addAttribute("crm604List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM604", null, langCd));  //VOC 유형
        model.addAttribute("crm605List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM605", null, langCd));  //1급 SUB 유형
        model.addAttribute("crm606List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM606", null, langCd));  //2급 SUB 유형
        model.addAttribute("crm607List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM607", null, langCd));  //3급 SUB 유형
        model.addAttribute("crm608List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd));  //VOC 성향
        model.addAttribute("crm615List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM615", null, langCd));  //활동 획득 경로 코드
        model.addAttribute("crm616List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM616", null, langCd));  //처리시한 코드
        model.addAttribute("crm620List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM620", null, langCd));  //승급 원인 코드
        model.addAttribute("crm621List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM621", null, langCd));  //불만 만족도 코드
        model.addAttribute("crm622List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM622", null, langCd));  //자료배송상태
        model.addAttribute("crm030List",   commonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));  //고객 및 연계인 관계

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //성코드
        VocMgmtSearchVO vocMgmtSearchVO = new VocMgmtSearchVO();
        model.addAttribute("sungCdInfo", vocMgmtService.selectSungCdListByCondition(vocMgmtSearchVO));

        return "/crm/crq/BHMCVoc/selectBHMCVocMgmtMain";
    }

}