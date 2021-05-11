package chn.bhmc.dms.par.cpm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.LeaveItemService;
import chn.bhmc.dms.par.cpm.vo.LeaveItemSearchVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * LeaveItemController Controller
 *
 * @author In Bo Shim
 * @since 2016. 05. 24.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 24.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class LeaveItemController {

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
     * 방치품 선정 서비스
     */
    @Resource(name="leaveItemService")
    LeaveItemService leaveItemService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 방치품 선정 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cpm/leaveItem/selectLeaveItemMain.do", method = RequestMethod.GET)
    public String selectLeaveItemMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String frDt = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -6), dateFormat);

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);


        //품목구분 공통코드정보 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//UseYn
        model.addAttribute("carLineList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
        model.addAttribute("toDt", sysDate);
        model.addAttribute("frDt", frDt);
        model.addAttribute("storageList", storageList);

        //로그인 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/par/cpm/leaveItem/selectLeaveItemMain";
    }

    /**
     * 선방치품 선정 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LeaveItemSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/leaveItem/selectLeaveItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLeaveItems(@RequestBody LeaveItemSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());

        result.setTotal(leaveItemService.selectLeaveItemsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(leaveItemService.selectLeaveItemsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 선방치품 선정 목록 데이터를 처리한다.
     * @param searchVO - 조회 조건을 포함하는 LeaveItemSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/leaveItem/multiLeaveItems.do", method = RequestMethod.POST)
    @ResponseBody
    public void multiLeaveItems(@RequestBody BaseSaveVO<LeaveItemVO> saveVO
            ,HttpServletRequest request) throws Exception{

        leaveItemService.multiLeaveItem(saveVO);

    }

    @RequestMapping(value = "/par/cpm/leaveItem/updateLeaveItemsAll.do", method = RequestMethod.POST)
    @ResponseBody
    public void multiLeaveItems(@RequestBody LeaveItemVO leaveItemVO
            ,HttpServletRequest request) throws Exception{

        leaveItemVO.setDlrCd(LoginUtil.getDlrCd());
        leaveItemService.updateLeaveItemAll(leaveItemVO);

    }


}
