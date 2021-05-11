package chn.bhmc.dms.par.ism.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.service.IssueReqTechManService;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailBorrowSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailSaveVO;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterItemService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IssueInnerController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.     In Bo Shim     최초 생성
 * </pre>
 */
@Controller
public class IssueBorrowController extends HController {

    /**
     * 구매요청 서비스
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    /**
     * 구매요청상세 서비스
     */
    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

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
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 부번별 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterItemService")
    BinLocationMasterItemService binLocationMasterItemService;

    /**
     * 거래처 관리 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * SA 서비스
     */
    @Resource(name="issueReqTechManService")
    IssueReqTechManService issueReqTechManService;

    /**
     * ROLL Mapping User 서비스
     */
    @Resource(name="roleMappingService")
    RoleMappingService roleMappingService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
     * 정비차용 작업 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqServiceWorkBorrowMain.do", method = RequestMethod.GET)
    public String selectIssueReqServiceWorkBorrowMain(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
        VatInfoVO vatInfoVO = new VatInfoVO();
        int vatInfoCnt = 0;

        vatInfoSearchVO.setsVatId("V01");
        vatInfoSearchVO.setsVatTypeCd("ALL");

        vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

        if(vatInfoCnt == 1){
            vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
        }else{
            vatInfoVO.setVatApplyRate(0.16);
        }

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        // 공통코드 : 위탁서 유형(RO)
        List<CommonCodeVO> parGiTpList = new ArrayList<CommonCodeVO>();
        CommonCodeVO commonCodeVO = commonCodeService.selectCommonCodeByKey("PAR301", "RO");
        if(commonCodeVO != null){
            parGiTpList.add(commonCodeVO);
        }
        model.addAttribute("parGiTpList", parGiTpList);
        // 공통코드 : 위탁서 유형(부품예약)
        List<CommonCodeVO> parGiTpSrList = new ArrayList<CommonCodeVO>();
        CommonCodeVO commonCodeSrVO = commonCodeService.selectCommonCodeByKey("PAR301" ,"SR");
        if(commonCodeSrVO != null){
            parGiTpSrList.add(commonCodeSrVO);
        }
        model.addAttribute("parGiTpSrList", parGiTpSrList);
        // 공통코드 : 내부운용소분류
        model.addAttribute("etcGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR303", null, langCd));
        // 공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", "Y", langCd));
        //RO상태
        model.addAttribute("roStatusCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 정비차용상태
        model.addAttribute("borrowStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR305", null, langCd));
        // 등록시작일자
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("sysStartDate", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat));
        // 등록종료일자
        model.addAttribute("sysEndDate", DateUtil.getDate(dateFormat));
        // 출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //차종 , 중고차-자사-차종
        model.addAttribute("modelCdList", carInfoService.selectModelListsByCondition(carInfoSearchVO));

        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");
        List<UserVO> recipientUserVOList = roleMappingService.selectUsersByRoleId(sysCd, LoginUtil.getDlrCd(), null, null, "ROLE_RECIPIENT");
        //정비수령자 권한 사용자 리스트.
        model.addAttribute("tecCdList", recipientUserVOList);

        model.addAttribute("langCd", langCd);
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());

        return "/par/ism/issueReq/selectIssueReqServiceWorkBorrowMain";

    }

    /**
     * 부품차용 정보를 저장한다.
     * @param saveVO - 저장 할 IssueReqDetailSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/multiIssueBorrowDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssueBorrowDetails(@RequestBody IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception
    {
        issueReqDetailService.multiIssueReqBorrowDetails(issueReqDetailSaveVO);
        return true;

    }

    /**
     * 부품차용 정보를 출고요청정보로 등록한다.
     * @param issuePartsOutSaveVO - 저장정보를 포함하는 IssuePartsOutSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/insertIssueBorrowDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public IssueReqDetailBorrowSaveVO insertIssueBorrowDetails(@RequestBody IssueReqDetailBorrowSaveVO issueReqDetailBorrowSaveVO) throws Exception{

        issueReqDetailService.insertIssueReqDetailBorrow(issueReqDetailBorrowSaveVO);

        return issueReqDetailBorrowSaveVO;

    }

}
