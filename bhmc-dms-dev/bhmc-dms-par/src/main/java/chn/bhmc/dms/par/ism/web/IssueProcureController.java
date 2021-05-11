package chn.bhmc.dms.par.ism.web;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.par.ism.service.IssueEtcService;

import chn.bhmc.dms.par.ism.vo.IssueEtcItemVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcListVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcVO;

import chn.bhmc.dms.cmm.sci.service.UnitInfoService;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IssueProcureController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Haegun Jung
 * @since 2017. 8. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 22.     Haegun Jung     최초 생성
 * </pre>
 */
@Controller
public class IssueProcureController extends HController{
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    @Resource(name="issueEtcService")
    IssueEtcService issueEtcService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
     * 조달출고(외부출고) 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueProcureMain.do", method = RequestMethod.GET)
    public String selectIssueProcureMain(Model model,@RequestParam(value="pIssueEtcNo", defaultValue="") String pIssueEtcNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate     = DateUtil.getDate(dateFormat);
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

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
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("unitCdList",       unitCdList);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("pIssueEtcNo",      pIssueEtcNo);
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("giReasonCdList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR401", null, langCd));
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());

        return "/par/ism/issueProcure/selectIssueProcureMain";
    }

    /**
     * 기타(조달)출고를 확정한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issue/createIssueProcure.do", method = RequestMethod.POST)
    @ResponseBody
    public IssueEtcVO createIssueProcure(@Validated @RequestBody IssueEtcListVO issueEtcListVO)  throws Exception {

        IssueEtcVO issueEtcVO = new IssueEtcVO();
        issueEtcVO = issueEtcListVO.getIssueEtcVO();
        List<IssueEtcItemVO> list = issueEtcListVO.getIssueEtcItemList();

        issueEtcVO.setRegUsrId(LoginUtil.getUserId());
        issueEtcVO.setDlrCd(LoginUtil.getDlrCd());
        issueEtcVO.setPltCd(LoginUtil.getPltCd());
        issueEtcVO.setRegDt(new Date());

        //기타출고
        issueEtcVO = issueEtcService.createIssueEtcCnfm(list, issueEtcVO);
        //interface logic
        boolean infSuccess = issueEtcService.insertIssueProcureToIf(list, issueEtcVO);

        if(infSuccess){
            issueEtcVO.setResultYn(true);
        }else{
            issueEtcVO.setResultYn(false);
            //출고취소
            issueEtcService.cancelIssueEtc(list, issueEtcVO);
        }
        return issueEtcVO;
    }
}
