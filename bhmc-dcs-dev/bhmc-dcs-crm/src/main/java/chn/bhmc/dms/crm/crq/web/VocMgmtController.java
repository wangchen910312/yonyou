package chn.bhmc.dms.crm.crq.web;

import java.util.List;

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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.crm.crq.service.VocMgmtService;
import chn.bhmc.dms.crm.crq.vo.VocMgmtSaveVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtSearchVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * VOC 관리 컨트롤러
 *
 * @author hyoung jun an
 * @since 2016. 3. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 * </pre>
 */

@Controller
public class VocMgmtController extends HController {

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
     * VOC 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectVocMgmtMain.do", method = RequestMethod.GET)
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

        return "/crm/crq/vocMgmt/selectVocMgmtMain";
    }

    /**
     * VOC 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectVocMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVocMgmts(@RequestBody VocMgmtSearchVO searchVO, Model model) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vocMgmtService.selectVocMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<VocMgmtVO> selectVocMgmtsByCondition = vocMgmtService.selectVocMgmtsByCondition(searchVO);

            // 고객명은 로그인한 SC 고객일경우에만 보인다.
//            for (CampaignVO campaignVO : selectCampaignsByCondition) {
//                if(!LoginUtil.getUserId().equals(campaignVO.getScId())){
//                    campaignVO.setCustNm("***");
//                }
//            }

            result.setData(selectVocMgmtsByCondition);
        }

        return result;

    }

    /**
     * VOC 정보를 저장 한다.
     * @param marketingCampaignVO - VOC 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/insertVocMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertVocMgmts(@Validated(Draft.class) @RequestBody VocMgmtVO vocMgmtVO)throws Exception {

        /*
         * TODO [이인문] SC 아이디 가져오기
         * 로그인 세션에서 영업자인지 체크후 등록시 영업자이면 scId = 아이디 / 아니면 null
         *
         */

        vocMgmtVO.setRegUsrId(LoginUtil.getUserId());
        vocMgmtVO.setUpdtUsrId(LoginUtil.getUserId());

        vocMgmtService.insertVocMgmt(vocMgmtVO);

        return true;
    }

    /**
     * VOC 정보를 저장 한다.
     * @param marketingCampaignVO - VOC 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/updateVocMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateVocMgmts(@Validated(Draft.class) @RequestBody VocMgmtVO vocMgmtVO)throws Exception {

        /*
         * TODO [이인문] SC 아이디 가져오기
         * 로그인 세션에서 영업자인지 체크후 등록시 영업자이면 scId = 아이디 / 아니면 null
         *
         */

        vocMgmtVO.setRegUsrId(LoginUtil.getUserId());
        vocMgmtVO.setUpdtUsrId(LoginUtil.getUserId());

        vocMgmtService.updateVocMgmt(vocMgmtVO);

        return true;
    }

    /**
     * 상태 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectVocTpCdList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVocTpCdList(@RequestBody VocMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(vocMgmtService.selectVocTpCdListByCondition(searchVO));

        return result;
    }

    /**
     * 성코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectSungCdList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSungCdList(@RequestBody VocMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(vocMgmtService.selectSungCdListByCondition(searchVO));

        return result;
    }

    /**
     * 도시코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectCityCdList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCityCdList(@RequestBody VocMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(vocMgmtService.selectCityCdListByCondition(searchVO));

        return result;
    }





    /**
     * VOC활동 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/selectActives.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectActives(@RequestBody VocMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vocMgmtService.selectActivesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vocMgmtService.selectActivesByCondition(searchVO));
        }

        return result;

    }

    /**
     * VOC활동 정보를 등록한다.
     * @param saveVO - VOC활동 등록/수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/crq/vocMgmt/multiActives.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiActives(@Validated @RequestBody VocMgmtSaveVO saveVO) throws Exception {
        vocMgmtService.multiActives(saveVO);
        return true;
    }
}