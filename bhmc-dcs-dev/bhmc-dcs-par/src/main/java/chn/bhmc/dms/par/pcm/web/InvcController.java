package chn.bhmc.dms.par.pcm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.service.VatInfoService;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.service.InvcService;
import chn.bhmc.dms.par.pcm.vo.InvcSearchVO;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;

/**
 * 구매오더 관리 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 02. 04.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 04.     Ju Won Lee      최초 생성
 * </pre>
 */
@Controller
public class InvcController extends HController {

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
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;


    /**
     * 로케이션 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 송장 서비스
     */
    @Resource(name="invcService")
    InvcService invcService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
     * 송장관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectInvcList.do", method = RequestMethod.GET)
    public String selectInvcList(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        //VenderMasterVO venderMasterVO = new VenderMasterVO();
        //venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> invcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        //storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        invcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        /*if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{*/
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        //}

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",           LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",        LoginUtil.getUserId());
        model.addAttribute("pltCd",           LoginUtil.getPltCd());
        model.addAttribute("invcUnit",        invcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("invcTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd));
        model.addAttribute("invcStatList",    commonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("vatCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR215", null, langCd));
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);


        return "/par/pcm/invc/selectInvcList";

    }

    /**
     * 송장확정을 위한 송장 정보 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectInvcItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvcItems(@RequestBody InvcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        result.setTotal(invcService.selectInvcsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(invcService.selectInvcsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 송장명세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectInvcDetailItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvcDetailItems(@RequestBody InvcSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        result.setTotal(invcService.selectInvcsDetailByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(invcService.selectInvcsDetailByCondition(searchVO));
        }

        return result;

    }

}