package chn.bhmc.dms.sal.acc.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.acc.service.AccessoryItemMasterService;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.service.PackageManageService;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;

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
@RequestMapping(value = "/sal/acc/packItem")
public class PackageManageSalesController extends HController {

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
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    /**
     * 용품마스터 서비스-세율
     */
    @Resource(name="accessoryItemMasterService")
    AccessoryItemMasterService accessoryItemMasterService;

    /**
     * Parts package 메인
     * @param
     * @return
     */
    @RequestMapping(value = "/selectPartsPackageMain.do", method=RequestMethod.GET)
    public String selectPartsPackageMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //품목구분
        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        //사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //세율
        model.addAttribute("vatCd", accessoryItemMasterService.selectVATSearch(DateUtil.getDate("yyyyMMdd"), "ALL"));

        return "/sal/acc/packItem/selectPartsPackageMain";
    }

    /**
     * Parts package 메인
     * @param
     * @return
     */
    @RequestMapping(value = "/selectAccPackItemMain.do", method=RequestMethod.GET)
    public String selectAccPackItemMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //품목구분
        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        //사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));

        // 세율
        model.addAttribute("vatCd", accessoryItemMasterService.selectVATSearch(DateUtil.getDate("yyyyMMdd"), "ALL"));

        return "/sal/acc/packItem/selectAccPackItemMain";
    }

}
