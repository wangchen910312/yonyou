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
import chn.bhmc.dms.mob.api.repair.service.RepairWorkAssignService;
import chn.bhmc.dms.mob.api.repair.vo.RepairOrderSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.WorkAssignSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api("维修-维修派工相关")
@RestController
@RequestMapping({"/api/repair/workAssign"})
public class WorkAssignApi extends HController
{

  @Autowired
  RepairRepairOrderService RepairRepairOrderService;

  @Autowired
  RepairCommonCodeService RepairCommonCodeService;

  @Autowired
  RepairSystemConfigInfoService RepairSystemConfigInfoService;

  @Autowired
  RepairWorkAssignService RepairWorkAssignService;

  @ApiOperation("维修-维修派工页面跳转URL")
  @ResponseBody
  @RequestMapping(value={"/selectWorkAssignMain.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public BaseJSON selectWorkAssignMain(Model model)
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
    String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), 5, -7), dateFormat);
    String thirtyDtBf = DateUtil.getDate(DateUtil.add(new Date(), 5, -30), dateFormat);
    model.addAttribute("toDt", sysDate);
    model.addAttribute("sevenDtBf", sevenDtBf);
    model.addAttribute("thirtyDtBf", thirtyDtBf);

    model.addAttribute("roTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

    model.addAttribute("roStatCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));

    model.addAttribute("qtTestList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));

    model.addAttribute("rpirStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

    model.addAttribute("custWaitMthCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));

    model.addAttribute("atqProcTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));

    model.addAttribute("carWashTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));

    model.addAttribute("carDriveReqTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));

    model.addAttribute("progressStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));

    model.addAttribute("allocStatCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER043", null, langCd));

    baseJSON.setResult(model);
    return baseJSON;
  }

  @ApiOperation("维修-查看维修派工接收列表数据、基本信息")
  @RequestMapping(value={"/selectRepairOrders.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  @ResponseBody
  public BaseJSON selectRepairOrders(@RequestBody RepairOrderSearchVO searchVO) throws Exception {
    BaseJSON baseJSON = new BaseJSON();
    SearchResult result = new SearchResult();
    result.setTotal(this.RepairRepairOrderService.selectRepairOrderByConditionCnt(searchVO));
    if (result.getTotal() != 0L) {
      result.setData(this.RepairRepairOrderService.selectRepairOrderByCondition(searchVO));
    }
    baseJSON.setResult(result);
    return baseJSON;
  }

  @ApiOperation("维修派工-维修信息")
  @RequestMapping(value={"/selectWorkAssigns.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  @ResponseBody
  public BaseJSON selectWorkAssigns(@RequestBody WorkAssignSearchVO searchVO)
    throws Exception
  {
    BaseJSON baseJSON = new BaseJSON();
    SearchResult result = new SearchResult();
    result.setTotal(this.RepairWorkAssignService.selectWorkAssignByConditionCnt(searchVO));
    if (result.getTotal() != 0L) {
      result.setData(this.RepairWorkAssignService.selectWorkAssignByCondition(searchVO));
      baseJSON.setResult(result);
    }

    return baseJSON;
  }
}