package chn.bhmc.dms.sal.svi.web;

import java.util.Calendar;
import java.util.Date;
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
import chn.bhmc.dms.cmm.sci.vo.FileItemVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.svi.service.GroupSalesReviewService;
import chn.bhmc.dms.sal.svi.vo.GroupSalesReviewSaveVO;
import chn.bhmc.dms.sal.svi.vo.GroupSalesReviewSearchVO;
import chn.bhmc.dms.sal.svo.service.GroupSalesApplicationService;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationSearchVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;



/**
 * 집단 판매신청
 *
 * @author Bong
 * @since 2016. 3. 08.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.08         Bong              최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/svi/groupSalesReview")
public class GroupSalesReviewController extends HController {

    /**
     * 집단판매 신청 서비스
     */
    @Resource(name="groupSalesApplicationService")
    private GroupSalesApplicationService groupSalesApplicationService;


    /**
     * 집단판매 심사 서비스
     */
    @Resource(name="groupSalesReviewService")
    private GroupSalesReviewService groupSalesReviewService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;


    /**
     * 판매-공통 서비스
     */
    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;



    /**
     * 집단판매신청 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectGroupSalesReviewMain.do", method = RequestMethod.GET)
    public String selectGroupSalesReviewMain(Model model) throws Exception{


        String langCd = LocaleContextHolder.getLocale().getLanguage();

//        model.addAttribute("strDlrCd", LoginUtil.getDlrCd());

        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);
        model.addAttribute("usrId", LoginUtil.getUserId());

        // 상태 SAL184
        model.addAttribute("approveCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL184", null, langCd));

        // 항목 SAL151
        model.addAttribute("atcDstinCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL151", null, langCd));

        // 심사여부 (SAL145)
        model.addAttribute("evalYnInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL145", null, langCd));

        // 딜러지역 (SAL146)
        model.addAttribute("distCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL146", null, langCd));

        // 합격여부 SAL148
        model.addAttribute("evalRsltYnInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL148", null, langCd));

        //사업부
        //model.addAttribute("sdptList", salesCommonService.selectDealerSdpt(new DealerSearchVO()));

        //전체 사무소
        model.addAttribute("officeList", salesCommonService.selectAllDealerOffice(LoginUtil.getUserId()));

        //사용여부
        model.addAttribute("fileUseYn", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));


        //차종 콤보 조회
        VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();
        vehicleSearchVO.setUseYn("Y");

        model.addAttribute("carLineCdInfo", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));


        //로그인 사용자 심사단계
        String dlrCd = LoginUtil.getDlrCd();
        String usrId = LoginUtil.getUserId();
        String wrkDstinCd = "01";
        model.addAttribute("usrEvalGrade", salesCommonService.selectUserEvalGrade(dlrCd,usrId,wrkDstinCd));
        model.addAttribute("wrkDstinCd", wrkDstinCd);


        //로그인된 USER의 심사등급을 조회.

        return "/sal/svi/groupSalesReview/selectGroupSalesReviewMain";
    }

    /**
     * 법인 - 집단판매 신청 정보 조회 (Grid)
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectGroupSalesReview.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGroupSalesReview(@RequestBody GroupSalesReviewSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsLoginUsrId(LoginUtil.getUserId());

        result.setTotal(groupSalesReviewService.selectGroupSalesReviewByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(groupSalesReviewService.selectGroupSalesReviewByCondition(searchVO));
        }

        return result;
    }


    /**
     * 집단판매신청된 차량 상세를 조회한다.
     * @param searchVO -
     * @return
     */
    @RequestMapping(value = "/selectDetlVehPop.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDetlVehPop(@RequestBody GroupSalesReviewSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(groupSalesReviewService.selectDetlVehPopByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(groupSalesReviewService.selectDetlVehPopByCondition(searchVO));
        }
        return result;
    }

    /**
     * 법인 - 집단판매 신청 상세정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectGroupSlaesReviewDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGroupSlaesReviewDetail(@RequestBody GroupSalesApplicationVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setData(groupSalesApplicationService.selectGroupSalesApplicationDetailByCondition(searchVO));

        return result;
    }

    /**
     * 법인 - 집단판매 신청 상세정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectGroupSlaesReviewDtl.do", method = RequestMethod.POST)
    @ResponseBody
    public GroupSalesApplicationVO selectGroupSlaesReviewDtl(@RequestBody GroupSalesApplicationSearchVO searchVO) throws Exception {

        return groupSalesApplicationService.selectGroupSalesApplicationDetailByKey(searchVO);
    }

    /**
     * 법인 - 집단판매 신청 차량상세정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectGroupSalesReviewDetVeh.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGroupSlaesReviewDetailVeh(@RequestBody GroupSalesApplicationSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setData(groupSalesApplicationService.selectGroupSalesApplicationDetVehByCondition(searchVO));

        return result;
    }

    /**
     * 법인 - 집단판매 신청 차량 심사정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectGroupSalesReviewDetJdg.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGroupSalesReviewDetJdg(@RequestBody GroupSalesApplicationSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setData(groupSalesApplicationService.selectGroupSalesApplicationDetJdgByCondition(searchVO));

        return result;
    }

    /**
     * 법인 - 집단 판매신청 저장/수정
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/saveGroupSalesReview.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean saveGroupSalesReview(@Validated @RequestBody GroupSalesReviewSaveVO saveVO) throws Exception {

        groupSalesReviewService.saveGroupSalesReview(saveVO);
        return true;
    }

    /**
     * 첨부문서 번호로 등록된 파일 목록을 조회한다.
     * @param fileDocNo 첨부문서번호
     * @return 파일 목록 , method = RequestMethod.POST
     */
    @RequestMapping(value = "/selectGroupSalesFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGroupSalesFileByCondition(@RequestBody GroupSalesReviewSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        List<FileItemVO> list  = groupSalesReviewService.selectGroupSalesFileByCondition(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }



    /**
     * 공통 엑셀 다운로드
     * @param params
     * @return
     * @throws Exception
     */
    /*
    @RequestMapping(value = "/cmm/sci/excelDownload.do", method = RequestMethod.GET)
    public ModelAndView excelDownload(@RequestParam HMap params) throws Exception {

        //TODO[한강석] 다국어 처리 필요
        //서비스 체크
        if (!params.containsKey("beanName")) {
            log.error("서비스 정보가 없습니다.");
            throw new BizException("서비스 정보가 없습니다.");
        } else if (!params.containsKey("templateFile")) {
            log.error("템플릿 정보가 없습니다.");
            throw new BizException("템플릿 정보가 없습니다.");
        } else if (!params.containsKey("fileName")) {
            log.error("파일명이 없습니다.");
            throw new BizException("파일명이 없습니다.");
        }

        String beanName = (String)params.get("beanName");
        String templateFile = (String)params.get("templateFile");
        String fileName = (String)params.get("fileName");

        Object bean = WebAppContext.getApplicationContext().getBean(beanName);

        if(bean instanceof JxlsSupport == false) {
            log.error("JxlsSupport 인터페이스 구현 클래스가 아닙니다.");
            throw new BizException("JxlsSupport 인터페이스 구현 클래스가 아닙니다.");
        }

        JxlsSupport jxlsSupport = (JxlsSupport)bean;

        Context context = new Context();
        jxlsSupport.initJxlsContext(context, params);

        String destFolderPath = WebContext.getInitParameter("JXLS_TEMP_FOLDER") + "/" + DateUtil.getDate("yyyyMMdd");
        FileUtils.mkdir(new File(destFolderPath), true);

        InputStream is = this.getClass().getResourceAsStream("/excelTemplate/" + templateFile);
        OutputStream os = new FileOutputStream(WebContext.getInitParameter("JXLS_TEMP_FOLDER") + "/" + fileName);
        File destFile = new File(destFolderPath + "/" + fileName);

        try {
            is = this.getClass().getResourceAsStream("/excelTemplate/" + templateFile);
            os = new FileOutputStream(destFile);

            JxlsHelper.getInstance().processTemplate(is, os, context);
        } catch(Exception e) {
            log.error(e.getMessage(), e);
            throw new BizException("엑셀데이터 변환에 실패하였습니다.");
        } finally {
            try { is.close(); }catch(IOException e){}
            try { os.close(); }catch(IOException e){}
        }

        DownloadVO downloadVO = new DownloadVO();
        downloadVO.setFileName(fileName);
        downloadVO.setFilePath(destFile.getAbsolutePath());
        downloadVO.setFileSize(destFile.length());

        ModelAndView mav = new ModelAndView("downloadView");
        mav.addObject("FILE_INFO", downloadVO);

        return mav;
    }
*/
}
