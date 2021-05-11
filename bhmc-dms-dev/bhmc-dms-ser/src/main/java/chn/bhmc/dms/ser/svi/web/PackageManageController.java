package chn.bhmc.dms.ser.svi.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;

import chn.bhmc.dms.par.pmm.service.ItemMasterService;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.service.PackageManageService;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;
import chn.bhmc.dms.ser.svi.vo.PackageItemSaveVO;
import chn.bhmc.dms.ser.svi.vo.PackageMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.PackageMasterVO;
import chn.bhmc.dms.ser.svi.vo.PackageSaveVO;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;

/**
 * <pre>
 * package 관리 Controller
 * </pre>
 *
 * @ClassName   : PackageManageController.java
 * @Description : package 관리 Controller
 * @author Yin Xueyuan
 * @since 2016. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 17.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Controller
public class PackageManageController extends HController {

    /**
     * package  서비스
     */
    @Resource(name="packageManageService")
	PackageManageService packageManageService;

    /**
     * 품목마스터 관리 서비스
     */
    @Resource(name="itemMasterService")
    ItemMasterService itemMasterService;

     /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    @Autowired
    RateManageService rateManageService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

	/**
	 * package 메인
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/ser/svi/packageManage/selectPackageMain.do", method=RequestMethod.GET)
	public String selectPackageMain(Model model) throws Exception {

	    String langCd = LocaleContextHolder.getLocale().getLanguage();

	    //품목구분
        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));

	    model.addAttribute("dlrCd", LoginUtil.getDlrCd());

	    LtsModelSearchVO searchVO = new LtsModelSearchVO();
	    model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));

	    // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        //브랜드 목록
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        // 임률코드 정보
       RateManageSearchVO rateSearchVO = new RateManageSearchVO();
       model.addAttribute("rateDs", rateManageService.selectRates(rateSearchVO ));

		return "/ser/svi/packageManage/selectPackageMain";

	}

	/**
	 * package 등록 팝업 메인
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/ser/cmm/popup/selectPackageRegPopup.do", method=RequestMethod.GET)
	public String selectPackageRegPopup(Model model) throws Exception {

	    String langCd = LocaleContextHolder.getLocale().getLanguage();

	    //품목구분
	    model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));

	    model.addAttribute("dlrCd", LoginUtil.getDlrCd());

	    LtsModelSearchVO searchVO = new LtsModelSearchVO();
	    model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));

	    // 수리유형(정비유형)
	    model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

	    // 임률코드 정보
	    RateManageSearchVO rateSearchVO = new RateManageSearchVO();
	    model.addAttribute("rateDs", rateManageService.selectRates(rateSearchVO ));

	    return "/ser/cmm/popup/selectPackageRegPopup";

	}

	/**
	 * package 공임 리스트
	 * @param
	 * @return SearchResult
	 */
	@RequestMapping(value = "/ser/svi/package/selectPackageLtss.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectPackageLtss(@RequestBody PackageMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(packageManageService.selectPackageLtsByConditionCnt(searchVO));
        if(result.getTotal() != 0)
        result.setData(packageManageService.selectPackageLtsByCondition(searchVO));

        return result;

	}
	/**
	 * package PACKAGE 리스트
	 * @param
	 * @return SearchResult
	 */
	@RequestMapping(value = "/ser/svi/package/selectPackages.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectPackages(@RequestBody PackageMasterSearchVO searchVO) throws Exception {

	    SearchResult result = new SearchResult();
	    result.setTotal(packageManageService.selectPackageMasterByConditionCnt(searchVO));
	    if(result.getTotal() != 0)
	        result.setData(packageManageService.selectPackageMasterByCondition(searchVO));

	    return result;

	}

    /**
     * package 부품 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/svi/package/selectPackagePars.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackagePars(@RequestBody PackageMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(packageManageService.selectPackageParByConditionCnt(searchVO));
        if(result.getTotal() != 0)
        result.setData(packageManageService.selectPackageParByCondition(searchVO));

        return result;

    }

    /**
     * package 정보
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/svi/package/selectPackageParSummary.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackageParSummary(@RequestBody PackageMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(packageManageService.selectPackageParSummaryByConditionCnt(searchVO));
        if(result.getTotal() != 0)
            result.setData(packageManageService.selectPackageParSummaryByCondition(searchVO));

        return result;

    }

    /**
     * package  정보를 등록한다.
     * @param saveVO - package 공임  등록/수정/삭제 목록을 포함하는 packageLtsSaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/package/multiPackages.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiPackages(@Validated @RequestBody PackageSaveVO packageSaveVO) throws Exception{

        return packageManageService.multiPackages(packageSaveVO);

    }

    /**
     * package  정보마스터 를 등록한다.
     * @param saveVO - package 공임  등록/수정/삭제 목록을 포함하는 packageLtsSaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/package/insertPackages.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertPackages(@Validated @RequestBody BaseSaveVO<PackageMasterVO> packageMasterListVO) throws Exception{

        packageManageService.insertPackages(packageMasterListVO);

        return true;

    }

    /**
     * parts package  정보를 등록한다.
     * @param saveVO - package 부품 등록/수정/삭제 목록을 포함하는 packageLtsSaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/package/multiItemPackages.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiItemPackages(@Validated @RequestBody PackageItemSaveVO packageItemSaveVO) throws Exception{

        return packageManageService.multiItemPackages(packageItemSaveVO);

    }

    /**
     * parts package  정보를 등록한다.
     * @param saveVO - package 부품 등록/수정/삭제 목록을 포함하는 packageLtsSaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/package/multiItemPartsPackages.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiItemPartsPackages(@Validated @RequestBody PackageItemSaveVO packageItemSaveVO) throws Exception{

        return packageManageService.multiItemPartsPackages(packageItemSaveVO);

    }

    /**
     * package  정보를 삭제한다.
     * @param saveVO - package 삭제 목록을 포함하는 packageLtsSaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/package/deletePackages.do", method = RequestMethod.POST)
    @ResponseBody
    public int deletePackages(@Validated @RequestBody PackageMasterVO packageMasterVO) throws Exception{

        // 부품쪽 부품마스터(PT_0201T), 재고(PT_0301T) 데이터 삭제
        ItemMasterVO itemMasterVO = new ItemMasterVO();
        itemMasterVO.setDlrCd(LoginUtil.getDlrCd());
        itemMasterVO.setRegUsrId(LoginUtil.getUserId());
        itemMasterVO.setSpyrCd("02");
        itemMasterVO.setItemCd(packageMasterVO.getPkgItemCd());
        itemMasterService.deleteLocalItemMaster(itemMasterVO);

        return packageManageService.deletePackages(packageMasterVO);

    }


    /**
     * Parts package 메인
     * @param
     * @return
     */
    @RequestMapping(value = "/ser/svi/packageManage/selectPartsPackageMain.do", method=RequestMethod.GET)
    public String selectPartsPackageMain(Model model) throws Exception {

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

        //품목구분
        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        //사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());
        return "/ser/svi/packageManage/selectPartsPackageMain";

    }

}