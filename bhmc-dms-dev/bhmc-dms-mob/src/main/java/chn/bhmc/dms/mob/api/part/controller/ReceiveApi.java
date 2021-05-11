package chn.bhmc.dms.mob.api.part.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.part.service.PartCarInfoService;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.service.PartInvcService;
import chn.bhmc.dms.mob.api.part.service.PartStorageService;
import chn.bhmc.dms.mob.api.part.service.PartSystemConfigInfoService;
import chn.bhmc.dms.mob.api.part.service.PartUnitInfoService;
import chn.bhmc.dms.mob.api.part.service.PartVenderMasterService;
import chn.bhmc.dms.mob.api.part.vo.InvcSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageVO;
import chn.bhmc.dms.mob.api.part.vo.UnitInfoSearchVO;
import chn.bhmc.dms.mob.api.part.vo.UnitInfoVO;
import chn.bhmc.dms.mob.api.part.vo.VenderMasterVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import chn.bhmc.dms.par.pcm.service.InvcService;
import chn.bhmc.dms.par.pcm.vo.InvcVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobInvcController.java
 * @Description : 모바일입고 Controller
 * @author JongHee Lim
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.     JongHee Lim     최초 생성
 * </pre>
 */

@Controller
@RequestMapping("/api/part/Receive")
@Api("采购入库")
public class ReceiveApi extends HController {

    /**
     * 송장 서비스
     */
    @Resource(name="PartInvcService")
    PartInvcService PartInvcService;
    
    @Resource(name="invcService")
    InvcService invcService;

    /**
     * 거래처 서비스
     */
    @Resource(name="PartVenderMasterService")
    PartVenderMasterService PartVenderMasterService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="PartCommonCodeService")
    PartCommonCodeService PartCommonCodeService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="PartUnitInfoService")
    PartUnitInfoService PartUnitInfoService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="PartCarInfoService")
    PartCarInfoService PartCarInfoService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="PartStorageService")
    PartStorageService PartStorageService;

    @Resource(name="PartSystemConfigInfoService")
    PartSystemConfigInfoService PartSystemConfigInfoService;


    
    
    /**
     * 송장관리 메인 화면을 출력한다.
     * 待入库清单
     * @return
     */
    @ApiOperation("待入库清单跳转页面")
    @RequestMapping(value = "/selectInvcList", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON selectInvcList(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = PartSystemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = PartVenderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> invcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = PartStorageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        invcUnitList = PartUnitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",           LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",        LoginUtil.getUserId());
        model.addAttribute("pltCd",           LoginUtil.getPltCd());
        model.addAttribute("invcUnit",        invcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("prcTpList",       PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("invcTpList",      PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd));
        model.addAttribute("invcStatList",    PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, langCd));
        model.addAttribute("dlPdcCdList",     PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("vatCdList",       PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR215", null, langCd));
        model.addAttribute("trsfTpList",      PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcOrdTpList",   PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("dlPdcCdList",     PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        
        BaseJSON baseJSON = new BaseJSON();
		baseJSON.setResult(model);
		return baseJSON;
     

    }

    
    /**
     * 송장확정을 위한 송장 정보 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * 待入库列表数据
     * @return
     */
    @ApiOperation("待入库清单列表数据")
    @RequestMapping(value = "/selectInvcItems", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectInvcItems(@RequestBody InvcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(PartInvcService.selectInvcsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(PartInvcService.selectInvcsByCondition(searchVO));
        }
        
        BaseJSON baseJSON = new BaseJSON();
		baseJSON.setResult(result);
		return baseJSON;
        
    }
    
    
    /**
     * 송장 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * 待入库清单详细确认
     * @return
     */
    @ApiOperation("待入库清单确认列表")
    @RequestMapping(value = "/selectInvcItemByKey", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectInvcItemByKey(@RequestBody InvcSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setData(PartInvcService.selectInvcItemByKey(searchVO));
        
        BaseJSON baseJSON = new BaseJSON();
		baseJSON.setResult(result);
		return baseJSON;

    }
    
    /**
     * 송장 도착일자 설정 팝업 화면을 출력한다.
     * 准备入库页面
     * @return
     * @throws Exception
     */
    @ApiOperation("准备入库页面")
    @RequestMapping(value = "/setInvoiceArriveDtPopup", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON setInvoiceArriveDtPopup(Model model) throws Exception {

    		BaseJSON baseJSON = new BaseJSON();
		
		return baseJSON;
    }

   
    
    /**
     * 송장문서를 확정한다.
     * 准备入库（更新）
     * @return
     */
    @ApiOperation("待入库清单确认准备入库")
    @RequestMapping(value = "/updateInvcCnfm", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON updateInvcCnfm(@Validated @RequestBody InvcVO invcVO)  throws Exception {

        invcVO.setRegUsrId(LoginUtil.getUserId());
        invcVO.setDlrCd(LoginUtil.getDlrCd());

        int result = invcService.updateInvcCnfm(invcVO);
        
        BaseJSON baseJSON = new BaseJSON();
		baseJSON.setResult(result);
		return baseJSON;
    }
    
//    /**
//     * key에 의한 송장 정보를 조회한다.
//     * @param searchVO - 조회조건을 포함하는 InvcSearchVO
//     * @return
//     */
//    @ApiOperation("准备入库后查询")
//    @RequestMapping(value = "/selectInvcByKey", method = RequestMethod.POST)
//    @ResponseBody
//    public InvcVO selectInvcByKey(@RequestBody InvcVO searchVO) throws Exception
//    {
//        searchVO.setDlrCd(LoginUtil.getDlrCd());
////        int result = PartInvcService.selectInvcByKey(searchVO);
////        BaseJSON baseJSON = new BaseJSON();
////        baseJSON.setResult(result);
////        return baseJSON;
//        
//        return  PartInvcService.selectInvcByKey(searchVO);
//    }


//    /**
//     * 모바일입고 부품 상세 [조회]
//     */
//    //@RequestMapping(value = "/mob/par/pcm/invc/selectReceiveItemByInvcItemBarcode", method = RequestMethod.POST)
//    @RequestMapping(value = "/selectReceiveItemByInvcItemBarcode.do", method = RequestMethod.POST)
//    @ResponseBody
//    @ApiOperation("配件详情查询")
//    public BaseJSON selectReceiveItemByInvcItemBarcode(@RequestBody InvcSearchVO searchVO)  throws Exception  {
//        InvcItemVO invcItemVO = new InvcItemVO();
//        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
//        VenderMasterVO venderMasterVO = new VenderMasterVO();
//        venderMasterVO = PartVenderMasterService.selectBHMCVenderMaster(mobLoginVO.getDlrCd());
//        searchVO.setsBpCd(venderMasterVO.getBpCd());
//        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
//        invcItemVO = PartInvcService.selectReceiveItemByInvcItemBarcode(searchVO);
//        BaseJSON json = new BaseJSON();
//        json.setResult(invcItemVO);
//        return json;
//    }


//    /**
//     * 송장확정을 위한 송장 정보 데이타를 조회한다.
//     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
//     * @return
//     */
//    @RequestMapping(value = "/selectInvcItems.do", method = RequestMethod.POST)
//    @ResponseBody
//    @ApiOperation("入库确认查询（主）")
//    public BaseJSON selectInvcItems(@RequestBody InvcSearchVO searchVO) throws Exception
//    {
//        SearchResult result = new SearchResult();
//        searchVO.setsDlrCd(LoginUtil.getDlrCd());
//        result.setTotal(PartInvcService.selectInvcsByConditionCnt(searchVO));
//
//        if(result.getTotal() != 0){
//            result.setData(PartInvcService.selectInvcsByCondition(searchVO));
//        }
//
//        BaseJSON json = new BaseJSON();
//        json.setResult(result);
//
//        return json;
//    }





}
