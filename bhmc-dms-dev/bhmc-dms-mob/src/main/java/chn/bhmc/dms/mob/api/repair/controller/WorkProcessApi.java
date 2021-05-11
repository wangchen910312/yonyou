package chn.bhmc.dms.mob.api.repair.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.api.repair.service.RepairCommonCodeService;
import chn.bhmc.dms.mob.api.repair.service.RepairRepairOrderService;
import chn.bhmc.dms.mob.api.repair.service.RepairSystemConfigInfoService;
import chn.bhmc.dms.mob.api.repair.vo.RepairOrderSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping({"/api/repair/workProcess"})
@Api("维修-维修管理查询")
public class WorkProcessApi extends HController{

  @Autowired
  RepairRepairOrderService RepairRepairOrderService;

  @Autowired
  RepairCommonCodeService RepairCommonCodeService;

  @Autowired
  RepairSystemConfigInfoService RepairSystemConfigInfoService;


  @ApiOperation("维修-维修管理查询页面URL")
  @ResponseBody
  @RequestMapping(value={"/selectWorkProcessMain.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public BaseJSON selectWorkProcessMain(Model model)
    throws Exception
  {
    BaseJSON baseJSON = new BaseJSON();
    String langCd = LocaleContextHolder.getLocale().getLanguage();

    MobLoginVO mobLoginVO = MobUtil.getLoginVO();
    model.addAttribute("userId", mobLoginVO.getUserId());
    model.addAttribute("userNm", mobLoginVO.getUserNm());
    model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
    model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

    String dateFormat = this.RepairSystemConfigInfoService.selectStrValueByKey("dateFormat");
    String sysDate = DateUtil.getDate(dateFormat);
    String oneMonthDtBf = DateUtil.getDate(DateUtil.add(new Date(), 5, -30), dateFormat);

    model.addAttribute("toDt", sysDate);
    model.addAttribute("oneMonthDtBf", oneMonthDtBf);

    model.addAttribute("roTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

    model.addAttribute("roStatCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));

    model.addAttribute("progressStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));

    model.addAttribute("carWashStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER051", null, langCd));

    model.addAttribute("qtTestList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));

    model.addAttribute("paintStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER053", null, langCd));

    model.addAttribute("rpirStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

    model.addAttribute("pauseStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER054", null, langCd));

    model.addAttribute("custWaitMthCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));

    model.addAttribute("atqProcTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));

    model.addAttribute("carWashTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));

    model.addAttribute("carDriveReqTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));

    baseJSON.setResult(model);
    return baseJSON;
  }

  @ApiOperation("维修-查看维修查询管理状态列表数据")
  @RequestMapping(value={"/selectRepairOrderInfoList.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  @ResponseBody
  public BaseJSON selectRepairOrderInfoList(@RequestBody RepairOrderSearchVO searchVO) throws Exception
  {
    BaseJSON baseJSON = new BaseJSON();
    SearchResult result = new SearchResult();

    result.setTotal(this.RepairRepairOrderService.selectRepairOrderInfoListByConditionCnt(searchVO));

    if (result.getTotal() != 0L) {
      result.setData(this.RepairRepairOrderService.selectRepairOrderInfoListByCondition(searchVO));
    }
    baseJSON.setResult(result);
    return baseJSON;
  }
}