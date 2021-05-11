package chn.bhmc.dms.mob.sal.cmm.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.sal.cnt.service.ProgressStsService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;

/**
 * Sale 공통 컨트롤러
 *
 * @author Sung Sin Park
 * @since 2016. 4. 22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 4. 22         Park Sung sin            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/sal/cmm")
public class MobSalesCommonController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 계약품의현황 서비스
     */
    @Resource(name="progressStsService")
    ProgressStsService progressStsService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 위치 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 차량마스터 서비스
     */
    @Resource(name="vehicleMasterService")
    VehicleMasterService vehicleMasterService;



    /**
     * 계약조회 팝업 (계약품의현황 동일)
     * @param model
     * @return
     * @throws Exception
     */
/*    @RequestMapping(value = "/selectProgressStsPopup.do", method = RequestMethod.GET)
    public String selectProgressStsPopup(Model model) throws Exception{
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), "yyyy-MM-dd");
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부

        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("toDay",     sysDate);
        model.addAttribute("oneDay",    oneDay);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("contractTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003"));        //계약유형
        model.addAttribute("contractStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002"));    //계약상태

        return "/sal/cmm/selectProgressStsPopup";
    }*/

    /**
     * 계약품위현황 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
/*    @RequestMapping(value = "/selectProgressSts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectProgressSts(@RequestBody ContractSearchVO searchVO) throws Exception {
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());

        SearchResult result = new SearchResult();
        result.setTotal(progressStsService.selectProgressStsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(progressStsService.selectProgressStsByCondition(searchVO));
        }

        return result;
    }*/


    /**
     * 차량마스터 조회 팝업
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectVehicleMasterPopup.do", method = RequestMethod.GET)
    public String selectVehicleMasterPopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 딜러코드
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());

        //차량상태 SAL001
        model.addAttribute("carStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));
        //차량보유상태 SAL149
        model.addAttribute("ownStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL149", null, langCd));

        // 재고유형 SAL074
        model.addAttribute("stockTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL074", null, langCd));

        // 회사차구분 SAL053 / 2016.04.21 kimyewon 추가
        model.addAttribute("cmpCarDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd));

        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        // 위치
        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        model.addAttribute("locDSList", binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));

        return "/mob/sal/cmm/selectVehicleMasterPopup";
    }

    /**
     * 차량마스터 조회 팝업 목록
     * @return
     */
    @RequestMapping(value = "/selectVehicleMasterListPopup.do", method = RequestMethod.GET)
    public String selectVehicleMasterListPopup(Model model)  throws Exception  {


        return "/mob/sal/cmm/selectVehicleMasterListPopup";
    }


    /**
     * 차량마스터 조회 팝업 목록 데이터
     * @return
     */

    @RequestMapping(value = "/selectVehicleMasterSts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleMasterSts(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(vehicleMasterService.selectVehicleMasterStsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleMasterService.selectVehicleMasterStsByCondition(searchVO));
        }
        return result;
    }

}
