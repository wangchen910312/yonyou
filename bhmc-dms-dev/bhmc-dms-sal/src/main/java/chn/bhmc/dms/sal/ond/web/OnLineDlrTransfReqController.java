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
import chn.bhmc.dms.sal.ond.service.OnLineDlrTransfReqService;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfReqSaveVO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfReqSearchVO;

/**
 * 전상운송신청
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
@RequestMapping(value = "/sal/ond/onLineDlrTransfReq")
public class OnLineDlrTransfReqController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 전상운송신청 서비스
     */
    @Resource(name="onLineDlrTransfReqService")
    OnLineDlrTransfReqService onLineDlrTransfReqService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 전상운송신청 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectOnLineDlrTransfReqMain.do", method = RequestMethod.GET)
    public String selectVehicleObtainReqMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);
        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDay", sysDate);
        model.addAttribute("sevenDayBf", sevenDtBf);

        OnLineDlrTransfReqSearchVO searchVO = new OnLineDlrTransfReqSearchVO();
        searchVO.setsUseYn("Y");
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        //차종
        model.addAttribute("ondCarLineCdInfo", onLineDlrTransfReqService.selectOndCarListsByCondition(searchVO));

        //운송가능지
        model.addAttribute("ondRcvDlrCdInfo", onLineDlrTransfReqService.selectOndRecevDlrListsByCondition(searchVO));

        //심사결과상태
        model.addAttribute("reqStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL207", "Y", langCd));

        return "/sal/ond/onLineDlrTransfReq/selectOnLineDlrTransfReqMain";
    }

    /**
     * 전상운송신청 목록 데이터를 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOnLineDlrTransfReq.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleObtainReq(@RequestBody OnLineDlrTransfReqSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setTotal(onLineDlrTransfReqService.selectOnLineDlrTransfReqCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(onLineDlrTransfReqService.selectOnLineDlrTransfReq(searchVO));
        }

        return result;
    }

    /**
     * 전상운송신청 모델을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOndModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOndModelListsByCondition(@RequestBody OnLineDlrTransfReqSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setData(onLineDlrTransfReqService.selectOndModelListsByCondition(searchVO));

        return result;
    }

    /**
     * 전상운송신청 OCN을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOndOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOndOcnListsByCondition(@RequestBody OnLineDlrTransfReqSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setData(onLineDlrTransfReqService.selectOndOcnListsByCondition(searchVO));

        return result;
    }

    /**
     * 전상운송신청 배기등급을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOndExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOndExtClrListsByCondition(@RequestBody OnLineDlrTransfReqSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setData(onLineDlrTransfReqService.selectOndExtClrListsByCondition(searchVO));

        return result;
    }

    /**
     * 전상운송신청 배기등급목록을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectFscpRegGrade.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOndFscpRegGradeListsByCondition(@RequestBody OnLineDlrTransfReqSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setData(onLineDlrTransfReqService.selectOndFscpRegGradeListsByCondition(searchVO));

        return result;
    }

    /**
     * 전상운송신청 내색을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOndIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOndIntClrListsByCondition(@RequestBody OnLineDlrTransfReqSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUsrId(LoginUtil.getUserId());

        SearchResult result = new SearchResult();

        result.setData(onLineDlrTransfReqService.selectOndIntClrListsByCondition(searchVO));

        return result;
    }

    /**
     * 전상운송신청 저장
     */
    @RequestMapping(value = "/saveOnLineDlrTransfReq.do", method = RequestMethod.POST)
    public @ResponseBody boolean saveVehicleObtainReq(@RequestBody OnLineDlrTransfReqSaveVO saveVO) throws Exception {

        onLineDlrTransfReqService.saveOnLineDlrTransfReq(saveVO);

        return true;
    }

    /**
     * 전상운송신청 폐기
     */
    @RequestMapping(value = "/deleteScrapOnLineDlrTransfReq.do", method = RequestMethod.POST)
    public @ResponseBody boolean deleteScrapOnLineDlrTransfReq(@RequestBody OnLineDlrTransfReqSaveVO saveVO) throws Exception {

        onLineDlrTransfReqService.deleteScrapOnLineDlrTransfReq(saveVO);

        return true;
    }
}
