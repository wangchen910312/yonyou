package chn.bhmc.dms.sal.acc.web;


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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.acc.service.AccessoryMngService;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngSaveVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngVO;
import chn.bhmc.dms.sal.cnt.service.ContractReService;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;



/**
 * 경품판매관리
 *
 * @author Kim Jin Suk
 * @since 2016. 6. 29
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.06.29           Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/acc/accessoryMng")
public class AccessoryMngController extends HController {

    /**
     * 경품판매관리 서비스
     */
    @Resource(name="accessoryMngService")
    private AccessoryMngService accessoryMngService;

    /**
     * 계약 서비스
     */
    @Resource(name="contractReService")
    private ContractReService contractReService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * Bay관리 : 서비스 담당자
     */
    @Resource(name="bayManageService")
    BayManageService bayManageService;


    /**
     * 경품판매관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAccessoryMngMain.do", method = RequestMethod.GET)
    public String selectAccessoryMngMain(Model model,
            @RequestParam(value="accessoryMngNo",    required = false, defaultValue="") String accessoryMngNo
    ) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 현재일자 DateUtil
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);

        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        //int day = cal.get(Calendar.DATE);
        //cal.set(year, month, day+1, 00, 00, 00);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);

        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
            cal.set(year, month, lastDay, 00, 00, 00);
        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);

        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), dateFormat);
        //String threeMonthBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), dateFormat);
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);
        model.addAttribute("lastDay", lastDate);
        model.addAttribute("nextMonthDay", nextMonthDay);



        //경품업무유형 : SAL158
        model.addAttribute("goodsTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL158", null, langCd));

        //용품상태 SAL185
        model.addAttribute("goodsStatDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL185", null, langCd));

        // 브랜드 COM019
        model.addAttribute("carBrandDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 납부방식 : SAL012
        model.addAttribute("ioTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL012", null, langCd));

        // 공통코드 : 부품출고요청상태
        //model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302"));

        // 할인레벨 SAL156
        model.addAttribute("dcLvlCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL156", null, langCd));

        //서비스고문
        BayManageSearchVO searchVO = new BayManageSearchVO();
        searchVO.setsBayNo("C01");
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("serviceAdList", bayManageService.selectBayDetailsByCondition(searchVO));

        model.addAttribute("accessoryMngNo", accessoryMngNo);

        return "/sal/acc/accessoryMng/selectAccessoryMngMain";
    }

    /**
     * 차종에 따른 모델조회
     */
    @RequestMapping(value = "/selectModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModel(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        //searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectModelListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectModelListsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 차종과 모델에 따른 OCN조회
     */
    @RequestMapping(value = "/selectOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOcn(@RequestBody CarInfoSearchVO searchVO) throws Exception{

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectOcnListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectOcnListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 외장색조회
     */
    @RequestMapping(value = "/selectExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectExtColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectExtColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectExtColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 내장색조회
     */
    @RequestMapping(value = "/selectIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIntColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectIntColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectIntColorListsByCondition(searchVO));
        }
        return result;
    }


    /**
     * 경품정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAccessoryMngSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryMngSearch(@RequestBody AccessoryMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(accessoryMngService.selectAccessoryMngsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(accessoryMngService.selectAccessoryMngsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 경품정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAccessoryMngItemSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryMngItemSearch(@RequestBody AccessoryMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(accessoryMngService.selectAccessoryMngItemsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(accessoryMngService.selectAccessoryMngItemsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/multiAccessoryMng.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiAccessoryMng(@Validated @RequestBody AccessoryMngSaveVO saveVO) throws Exception {
        saveVO.getGoodsMainVO().setDlrCd(LoginUtil.getDlrCd());
        return accessoryMngService.multiAccessoryMngs(saveVO);
    }

    /**
     * 경품정보팝업 호출
     * @param model
     * @return
     */
    @RequestMapping(value = "/selectGoodsItemSearchPopup.do", method = RequestMethod.GET)
    public String selectfincEstimatePopup(Model model) throws Exception{

        // 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //구매단가유형 : PAR131
        model.addAttribute("prcTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, LocaleContextHolder.getLocale().getLanguage()));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 창고
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        // 품목구분
        //model.addAttribute("itemDstinList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101"));


        return "/sal/acc/accessoryMng/selectGoodsItemSearchPopup";
    }

    /**
     * 품목팝업 정보(판매단가용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectItemSalePrcPopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemSalePrcPopupByCondition(@RequestBody ContractReSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(contractReService.selectItemSalePrcPopupByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(contractReService.selectItemSalePrcPopupByCondition(searchVO));
        }
        return result;
    }

    /**
     * 용품 출고요청
     */
    @RequestMapping(value = "/applyReq.do", method = RequestMethod.POST)
    @ResponseBody
    public String applyReq(@RequestBody AccessoryMngSaveVO saveVO)  throws Exception  {
        saveVO.getGoodsMainVO().setDlrCd(LoginUtil.getDlrCd());
        return accessoryMngService.applyReq(saveVO);
    }

    /**
     * 용품 출고취소
     */
    @RequestMapping(value = "/applyCancel.do", method = RequestMethod.POST)
    @ResponseBody
    public String applyCancel(@RequestBody AccessoryMngSearchVO searchVO)  throws Exception  {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return accessoryMngService.applyCancel(searchVO);
    }

    /**
     * 용품 할인레벨을 조회한다.
     */
    @RequestMapping(value = "/selectDlrGoodsDcLevel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDlrGoodsDcLevel(@RequestBody AccessoryMngSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        List<AccessoryMngVO> list = accessoryMngService.selectDlrGoodsDcLevel(searchVO);

        result.setTotal(list.size());
        if(result.getTotal() != 0){
            result.setData(list);
        }
        return result;
    }

}
