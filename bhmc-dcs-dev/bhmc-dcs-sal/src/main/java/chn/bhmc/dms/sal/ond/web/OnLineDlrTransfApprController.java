package chn.bhmc.dms.sal.ond.web;


import java.util.Calendar;
import java.util.Date;

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
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.ond.service.OnLineDlrTransfApprService;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfApprSaveVO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfApprSearchVO;

/**
 * 전상운송심사
 *
 * @author Lee Seungmin
 * @since 2017.03.04
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.03.04         Lee Seungmin       최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/ond/onLineDlrTransfAppr")
public class OnLineDlrTransfApprController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 전상운송심사 서비스
     */
    @Resource(name="onLineDlrTransfApprService")
    OnLineDlrTransfApprService onLineDlrTransfApprService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 전상운송심사 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectOnLineDlrTransfApprMain.do", method = RequestMethod.GET)
    public String selectVehicleObtainReqMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);
        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDay", sysDate);
        model.addAttribute("sevenDayBf", sevenDtBf);

        OnLineDlrTransfApprSearchVO searchVO = new OnLineDlrTransfApprSearchVO();
        searchVO.setsUseYn("Y");
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        //차종
        model.addAttribute("ondCarLineCdInfo", onLineDlrTransfApprService.selectOndCarListsByCondition(searchVO));

        //운송가능지
        model.addAttribute("ondRcvDlrCdInfo", onLineDlrTransfApprService.selectOndRecevDlrListsByCondition(searchVO));

        //심사결과상태
        model.addAttribute("reqStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL207", "Y", langCd));

        return "/sal/ond/onLineDlrTransfAppr/selectOnLineDlrTransfApprMain";
    }

    /**
     * 전상운송심사 목록 데이터를 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOnLineDlrTransfAppr.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleObtainReq(@RequestBody OnLineDlrTransfApprSearchVO searchVO) throws Exception {

        //searchVO.setsDlrCd(LoginUtil.getDlrCd());
        //searchVO.setsUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setTotal(onLineDlrTransfApprService.selectOnLineDlrTransfApprCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(onLineDlrTransfApprService.selectOnLineDlrTransfAppr(searchVO));
        }

        return result;
    }

    /**
     * 전상운송심사 모델을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOndModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOndModelListsByCondition(@RequestBody OnLineDlrTransfApprSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setData(onLineDlrTransfApprService.selectOndModelListsByCondition(searchVO));

        return result;
    }

    /**
     * 전상운송심사 OCN을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOndOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOndOcnListsByCondition(@RequestBody OnLineDlrTransfApprSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setData(onLineDlrTransfApprService.selectOndOcnListsByCondition(searchVO));

        return result;
    }

    /**
     * 전상운송심사 배기등급을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOndExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOndExtClrListsByCondition(@RequestBody OnLineDlrTransfApprSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setData(onLineDlrTransfApprService.selectOndExtClrListsByCondition(searchVO));

        return result;
    }

    /**
     * 전상운송심사 배기등급목록을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectFscpRegGrade.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOndFscpRegGradeListsByCondition(@RequestBody OnLineDlrTransfApprSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setData(onLineDlrTransfApprService.selectOndFscpRegGradeListsByCondition(searchVO));

        return result;
    }

    /**
     * 전상운송심사 내색을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOndIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOndIntClrListsByCondition(@RequestBody OnLineDlrTransfApprSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setData(onLineDlrTransfApprService.selectOndIntClrListsByCondition(searchVO));

        return result;
    }

    /**
     * 전상운송심사 수정내용 저장
     */
    @RequestMapping(value = "/saveOnLineDlrTransfAppr.do", method = RequestMethod.POST)
    public @ResponseBody boolean updateOnLineDlrTransfAppr(@RequestBody OnLineDlrTransfApprSaveVO saveVO) throws Exception {

        onLineDlrTransfApprService.updateOnLineDlrTransfAppr(saveVO);

        return true;
    }

    /**
     * 전상운송심사 심사상태 저장
     */
    @RequestMapping(value = "/updateOnLineDlrTransfApprStatus.do", method = RequestMethod.POST)
    public @ResponseBody boolean updateOnLineDlrTransfApprStatus(@RequestBody OnLineDlrTransfApprSaveVO saveVO) throws Exception {

        onLineDlrTransfApprService.updateOnLineDlrTransfApprStatus(saveVO);

        return true;
    }

}
