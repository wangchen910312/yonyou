package chn.bhmc.dms.mob.api.repair.controller;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.repair.service.RepairCommonCodeService;
import chn.bhmc.dms.mob.api.repair.service.RepairServiceReceiveService;
import chn.bhmc.dms.mob.api.repair.service.RepairServiceReceiveDetailService;
import chn.bhmc.dms.mob.api.repair.service.RepairSystemConfigInfoService;
import chn.bhmc.dms.mob.api.repair.vo.ServiceReceiveSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


@RestController
@RequestMapping("/api/repair/serviceReceive")
@Api("维修-结算收款-服务收款查询相关功能接口")
public class ServiceReceiveApi extends HController {

     /**
     * 공통코드 관리 서비스
     */
	@Autowired
    RepairCommonCodeService RepairCommonCodeService;

    @Autowired
    RepairServiceReceiveService RepairServiceReceiveService;

    @Autowired
    RepairSystemConfigInfoService RepairSystemConfigInfoService;

    @Autowired
    RepairServiceReceiveDetailService RepairServiceReceiveDetailService;



    /**
     * 维修-结算收款-服务收款查询url跳转
     */
    @ApiOperation("维修-结算收款-服务收款查询的页面url跳转")
    @ResponseBody
    @RequestMapping(value="/selectServiceReceiveMain.do", method = RequestMethod.GET)
    public BaseJSON  selectServiceReceiveMain(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());


        String dateFormat = RepairSystemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat);
        String oneMonthDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt",sysDate);
        model.addAttribute("sevenDtBf",sevenDtBf);
        model.addAttribute("oneMonthDtBf",oneMonthDtBf);


      //RO유형
        model.addAttribute("roTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //수납상태
        model.addAttribute("receiveCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER070", null, langCd));
        //영수증유형
        model.addAttribute("rcptTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        //지불방식
        //model.addAttribute("paymMthCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        //지불기한
        model.addAttribute("paymPridCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
       //시스탬일자
       model.addAttribute("sysDate", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
       //청산완료여부
       model.addAttribute("paymYnList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

       //model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/rcv/serviceReceive/baseJsp/selectServiceReceiveMain.jsp");
       baseJSON.setResult(model);
       return baseJSON;

    }

    /**
     * 维修-结算收款-服务收款查询列表详细
     */
    @ApiOperation("维修-结算收款-服务收款查询列表详细")
    @RequestMapping(value = "/selectServiceReceiveStatus.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectServiceReceiveStatus(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();
        result.setTotal(RepairServiceReceiveService.selectServiceReceiveStatusByConditionCnt(searchVO));
         if(result.getTotal() != 0){
            result.setData(RepairServiceReceiveService.selectServiceReceiveStatusByCondition(searchVO));
        }

        baseJSON.setResult(result);
        return baseJSON;

    }
    
    /**
     * 维修-结算收款-服务收款实收金额总金额
     */
    @ApiOperation("维修-结算收款-服务收款实收金额总金额")
    @RequestMapping(value = "/selectServiceReceiveAmouts.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectServiceReceiveAmouts(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON =new BaseJSON();
        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);
        String aumouts = RepairServiceReceiveService.selectServiceReceiveAmouts(searchVO);
        baseJSON.setResult(aumouts);
        return baseJSON;

    }

    /**
     * 付款信息
     */
    @ApiOperation("付款信息")
    @RequestMapping(value="/selectServiceReceiveDetailsHist.do",  method = RequestMethod.POST)
    public @ResponseBody BaseJSON selectServiceReceiveDetailsHist(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON =new BaseJSON();
        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();

        result.setTotal(RepairServiceReceiveDetailService.selectServiceReceiveDetailsHistByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(RepairServiceReceiveDetailService.selectServiceReceiveDetailsHistByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;

    }
}
