package chn.bhmc.dms.sal.inc.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.inc.service.IncPackageService;
import chn.bhmc.dms.sal.inc.vo.IncPackageSaveVO;
import chn.bhmc.dms.sal.inc.vo.IncPackageSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncPackageVO;

/**
 * 보험패키지관리 컨트롤러
 *
 * @author Kim JIN SUK
 * @since 2017. 2. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일              수정자                수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.03          Kim JIN SUK         최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/inc/incPackage")
public class IncPackageController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 보험패키지 서비스
     */
    @Resource(name="incPackageService")
    IncPackageService incPackageService;

    /**
     * 보험패키지관리  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectIncPackageMain.do", method = RequestMethod.GET)
    public String selectIncPackageMain(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //보험유형 SAL019+SAL088
        List<CommonCodeVO> incTpList = new ArrayList<CommonCodeVO>();
        incTpList.addAll(commonCodeService.selectCommonCodesByCmmGrpCd("SAL019", null, langCd));
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL088", null, langCd)){if(StringUtils.isBlank(vo.getRemark1())){incTpList.add(vo);}}
        model.addAttribute("incTpList", incTpList);

        // 3자보험유형 - 금액
        model.addAttribute("threeIncTpAmtList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL197", null, langCd));

        return "/sal/inc/incPackage/selectIncPackageMain";
    }


    /**
     * 보험패키지관리  메인목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IncJoinInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectIncPackage.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncPackage(@RequestBody IncPackageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(incPackageService.selectIncPackagesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(incPackageService.selectIncPackagesByCondition(searchVO));
        }

        return result;

    }

    // 보험패키지관리 서브목록을 조회한다.
    @RequestMapping(value = "/selectIncDetailPackage.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncDetailPackage(@RequestBody IncPackageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(incPackageService.selectIncDetailPackagesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(incPackageService.selectIncDetailPackagesByCondition(searchVO));
        }

        return result;

    }

    // 보험패키지 header 생성 팝업
    @RequestMapping(value = "/selectIncPackageHeaderCreatePopup.do", method = RequestMethod.GET)
    public String selectIncPackageHeaderCreatePopup(Model model) throws Exception{
        return "/sal/inc/incPackage/selectIncPackageHeaderCreatePopup";
    }

    /**
     * 보험패키지Header를 생성한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/multiIncPackageHeaderSave.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiIncPackageHeaderSave(@RequestBody IncPackageVO saveVO) throws Exception {
        return incPackageService.multiIncPackageHeaderSave(saveVO);
    }


    // 보험패키지Header를 삭제한다.



    // 보험패키지 Detail을 저장한다.

    @RequestMapping(value = "/multiIncPackageDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiIncPackageDetail(@Validated @RequestBody IncPackageSaveVO saveVO) throws Exception {
        return incPackageService.multiIncPackageDetail(saveVO);
    }






}
