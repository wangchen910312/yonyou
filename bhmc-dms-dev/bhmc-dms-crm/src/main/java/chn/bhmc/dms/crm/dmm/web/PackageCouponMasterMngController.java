package chn.bhmc.dms.crm.dmm.web;

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
import chn.bhmc.dms.crm.dmm.service.CouponService;
import chn.bhmc.dms.crm.dmm.service.PackageCouponMasterMngService;
import chn.bhmc.dms.crm.dmm.vo.CouponSaveVO;
import chn.bhmc.dms.crm.dmm.vo.CouponSearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngSaveVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponMasterMngController.java
 * @Description : 패키지쿠폰 마스터 관리 컨트롤러
 * @author Kim Hyun Ho
 * @since 2016. 6. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 8.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Controller
public class PackageCouponMasterMngController extends HController {
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 패키지쿠폰 마스터관리 서비스
     */
    @Resource(name="packageCouponMasterMngService")
    PackageCouponMasterMngService packageCouponMasterMngService;

    /**
     * 패키지쿠폰 마스터관리 서비스
     */
    @Resource(name="couponService")
    CouponService couponService;

    /**
     * 패키지쿠폰 마스터 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/packageCouponMasterMng/selectPackageCouponMasterMngMain.do", method = RequestMethod.GET)
    public String selectSatisFactionScoreMngMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("cupnTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM810", null, langCd));        // 쿠폰타입

        return "/crm/dmm/packageCouponMasterMng/selectPackageCouponMasterMngMain";
    }

    /**
     * 패키지쿠폰 마스터 관리 메인 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/packageCouponMasterMng/selectPackageCouponMasterMngs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackageCouponMasterMngs(@RequestBody PackageCouponMasterMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(packageCouponMasterMngService.selectPackageCouponMasterMngsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(packageCouponMasterMngService.selectPackageCouponMasterMngsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 패키지  정보를 등록한다.
     * @param saveVO - 패키지 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/dmm/packageCouponMasterMng/multiPackageCouponMasterMngs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPackageCouponMasterMngs(@Validated @RequestBody PackageCouponMasterMngSaveVO saveVO) throws Exception {

        packageCouponMasterMngService.multiPackageCouponMasterMngs(saveVO);
        return true;
    }


    /**
     * 패키지쿠폰 마스터 관리의 쿠폰 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/packageCouponMasterMng/selectCoupons.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCoupons(@RequestBody CouponSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(couponService.selectCouponsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(couponService.selectCouponsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 쿠폰  정보를 등록한다.
     * @param saveVO - 쿠폰 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/dmm/packageCouponMasterMng/multiCoupons.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCoupons(@Validated @RequestBody CouponSaveVO saveVO) throws Exception {

        couponService.multiCoupons(saveVO);
        return true;
    }

}
