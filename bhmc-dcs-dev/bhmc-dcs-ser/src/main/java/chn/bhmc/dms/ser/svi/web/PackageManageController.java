package chn.bhmc.dms.ser.svi.web;

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
import chn.bhmc.dms.ser.svi.service.PackageManageService;
import chn.bhmc.dms.ser.svi.vo.PackageItemSaveVO;
import chn.bhmc.dms.ser.svi.vo.PackageMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.PackageSaveVO;

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
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

	/**
	 * package 메인
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/ser/svi/packageManage/selectPackageMain.do", method=RequestMethod.GET)
	public String selectPackageMain(Model model) throws Exception {

	     //품목구분
        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, LocaleContextHolder.getLocale().getLanguage()));

	    model.addAttribute("dlrCd", LoginUtil.getDlrCd());
		return "/ser/svi/packageManage/selectPackageMain";

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
     * package  정보를 등록한다.
     * @param saveVO - package 공임  등록/수정/삭제 목록을 포함하는 packageLtsSaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/package/multiPackages.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPackages(@Validated @RequestBody PackageSaveVO packageSaveVO) throws Exception{
        packageManageService.multiPackages(packageSaveVO);
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
    public boolean multiItemPackages(@Validated @RequestBody PackageItemSaveVO packageItemSaveVO) throws Exception{
        packageManageService.multiItemPackages(packageItemSaveVO);
        return true;

    }


    /**
     * Parts package 메인
     * @param
     * @return
     */
    @RequestMapping(value = "/ser/svi/packageManage/selectPartsPackageMain.do", method=RequestMethod.GET)
    public String selectPartsPackageMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //품목구분
        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        //사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        return "/ser/svi/packageManage/selectPartsPackageMain";

    }

}