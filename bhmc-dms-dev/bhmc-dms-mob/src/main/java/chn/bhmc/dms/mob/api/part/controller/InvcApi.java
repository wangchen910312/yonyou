package chn.bhmc.dms.mob.api.part.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.part.service.PartBinLocationMasterService;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.service.PartInvcService;
import chn.bhmc.dms.mob.api.part.service.PartStorageService;
import chn.bhmc.dms.mob.api.part.service.PartSystemConfigInfoService;
import chn.bhmc.dms.mob.api.part.service.PartVenderMasterService;
import chn.bhmc.dms.mob.api.part.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.InvcSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageVO;
import chn.bhmc.dms.mob.api.part.vo.VenderMasterVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/api/part/Invc")
@Api("采购入库汇总")
public class InvcApi {
	 /**
     * 송장 서비스
     */
    @Resource(name="PartInvcService")
    PartInvcService partInvcService;

    /**
     * 거래처 서비스
     */
    @Resource(name="PartVenderMasterService")
    PartVenderMasterService partVenderMasterService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="PartCommonCodeService")
    PartCommonCodeService partCommonCodeService;

   
 
    /**
     * 창고 관리 서비스
     */
    @Resource(name="PartStorageService")
    PartStorageService partStorageService;


    /**
     * 로케이션 서비스
     */
    @Resource(name="PartBinLocationMasterService")
    PartBinLocationMasterService partBinLocationMasterService;

    @Resource(name="PartSystemConfigInfoService")
    PartSystemConfigInfoService partSystemConfigInfoService;

	/**
     * 입고현황 화면을 출력한다.
     * @return
     */
    @ApiOperation("采购入库汇总(页面加载)")
    @RequestMapping(value="/selectReceiveCnfmDetailList.do", method = RequestMethod.GET)
    @ResponseBody
    public BaseJSON selectReceiveCnfmDetailList(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = partSystemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        //공급업체
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = partVenderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        //입고창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = partStorageService.selectStoragesByCondition(storageSearchVO);

        // 창고 하위 2단계 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLvlId(2);

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

        model.addAttribute("giTwoLocCdList", partBinLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        model.addAttribute("dlrCd",           LoginUtil.getDlrCd());
        model.addAttribute("storageList",     storageList);
        model.addAttribute("dlPdcCdList",     partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("invcTpList",      partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd));
        model.addAttribute("invcStatList",    partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, langCd));
        // 거래처유형 공통코드정보 조회.
        model.addAttribute("bpTpList",        partCommonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, langCd));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        BaseJSON baseJSON =new BaseJSON();
        baseJSON.setResult(model);
        return baseJSON;
    }
    
    /**
     * 부품입고집계 정보를 조회한다.
     * 采购汇总
     * @param searchVO - 조회조건을 포함하는 InvcSearchVO
     * @return
     */
    @ApiOperation("采购汇总")
    @RequestMapping(value = "/selectReceivesByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectReceivesByCondition(@RequestBody InvcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(partInvcService.selectReceivesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partInvcService.selectReceivesByCondition(searchVO));
        }
        BaseJSON baseJSON = new BaseJSON();
        baseJSON.setResult(result);
        return baseJSON;
    }
    
    /**
     * 부품입고집계 정보를 조회한다.
     * 采购汇总
     * @param searchVO - 조회조건을 포함하는 InvcSearchVO
     * @return
     */
    @ApiOperation("采购汇总")
    @RequestMapping(value = "/selectReceivesSumByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectReceivesSumByCondition(@RequestBody InvcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setData(partInvcService.selectReceivesSumByCondition(searchVO));
        BaseJSON baseJSON = new BaseJSON();
        baseJSON.setResult(result);
        return baseJSON;
    }
    
    /**
     * 부품별 입고현황 화면을 조회한다.
     * 明细
     * @param searchVO - 조회조건을 포함하는 InvcSearchVO
     * @return
     */
    @ApiOperation("采购明细")
    @RequestMapping(value = "/selectReceiveCnfmListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectReceiveCnfmListByCondition(@RequestBody InvcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(partInvcService.selectReceiveCnfmListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partInvcService.selectReceiveCnfmListByCondition(searchVO));
        }
        BaseJSON baseJSON = new BaseJSON();
        baseJSON.setResult(result);
        return baseJSON;
    }

}
