package chn.bhmc.dms.mob.api.repair.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mob.api.repair.service.RepairCommonCodeService;
import chn.bhmc.dms.mob.api.repair.service.RepairRepairOrderService;
import chn.bhmc.dms.mob.api.repair.vo.RepairOrderSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobWorkHistoryController.java
 * @Description : RO작업이력 현황
 * @author JongHee Lim
 * @since 2016. 5. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 2.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
@Api("维修-服务接待-维修委托查询 ")
@RequestMapping(value = "/api/repair/workHistory")
public class WorkHistoryApi extends HController {

    @Autowired
    RepairRepairOrderService RepairRepairOrderService;

    @Autowired
    RepairCommonCodeService RepairCommonCodeService;

    @ApiOperation("维修委托加载页面")
    @ResponseBody
    @RequestMapping(value="/selectWorkHistoryMain.do", method = RequestMethod.GET)
    public BaseJSON selectWorkHistoryMain(Model model) throws Exception {
    	BaseJSON  baseJSON = new BaseJSON();
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

       //RO유형
       model.addAttribute("roTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
       //RO상태
       model.addAttribute("roStatCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
       //품질검사
       model.addAttribute("qtTestList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));
       // 공통코드 : 고객대기방식유형
       model.addAttribute("custWaitMthCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));
       // 공통코드 : 고품처리유형
       model.addAttribute("atqProcTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));
       // 공통코드 : 차량세차유형
       model.addAttribute("carWashTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));
       // 공통코드 : 차량시승요청유형
       model.addAttribute("carDriveReqTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));

       //진행상태
       model.addAttribute("progressStatList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));

       model.addAttribute("lbrTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

     //부품수령상태
       model.addAttribute("partRcvCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER037", null, langCd));
       baseJSON.setResult(model);
       return baseJSON;

    }

    /**
     * RO접수 현황 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @ApiOperation("维修委托查询")
    @RequestMapping(value="/selectRepairOrdersList.do",  method = RequestMethod.POST)
    public @ResponseBody BaseJSON selectRepairOrdersList(@RequestBody RepairOrderSearchVO searchVO) throws Exception {
        BaseJSON  baseJ = new BaseJSON();
        SearchResult result = new SearchResult();
        try {
        	 result.setTotal(RepairRepairOrderService.selectRepairOrderListByConditionCnt(searchVO));
             if(result.getTotal() != 0){
                 result.setData(RepairRepairOrderService.selectRepairOrderListByCondition(searchVO));
             }
             baseJ.setResult(result);
		} catch (Exception e) {
			 baseJ.setResultCode(1);
			 baseJ.setResultMsg("失败");
			e.printStackTrace();
		}
        return baseJ;

    }


}
