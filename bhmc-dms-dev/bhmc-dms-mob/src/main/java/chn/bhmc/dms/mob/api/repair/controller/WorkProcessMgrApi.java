package chn.bhmc.dms.mob.api.repair.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
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
import chn.bhmc.dms.mob.api.repair.service.RepairLtsModelMappingService;
import chn.bhmc.dms.mob.api.repair.service.RepairRepairOrderService;
import chn.bhmc.dms.mob.api.repair.service.RepairSystemConfigInfoService;
import chn.bhmc.dms.mob.api.repair.service.RepairWorkAssignService;
import chn.bhmc.dms.mob.api.repair.vo.LtsModelSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.RepairOrderSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.WorkAssignSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import chn.bhmc.dms.ser.ro.service.WorkPauseService;
import chn.bhmc.dms.ser.ro.service.WorkProcessService;
import chn.bhmc.dms.ser.ro.vo.WorkPauseVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessSaveVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping({"/api/repair/workProcessMgr"})
@Api("维修进度相关")
public class WorkProcessMgrApi extends HController
{

  @Autowired
  RepairRepairOrderService RepairRepairOrderService;

  @Autowired
  RepairCommonCodeService RepairCommonCodeService;

  @Autowired
  RepairLtsModelMappingService RepairLtsModelMappingService;

  @Autowired
  RepairSystemConfigInfoService RepairSystemConfigInfoService;

  @Autowired
  RepairWorkAssignService RepairWorkAssignService;
  
  @Autowired
  WorkProcessService workProcessService;

  @Autowired
  WorkPauseService workPauseService;


  @ApiOperation("维修-维修进度页面跳转URL")
  @ResponseBody
  @RequestMapping(value={"/selectWorkProcessMgrMain.do"}, method={RequestMethod.GET})
  public BaseJSON selectWorkProcessMgrMain(Model model)
    throws Exception
  {
    BaseJSON baseJSON = new BaseJSON();
    String langCd = LocaleContextHolder.getLocale().getLanguage();

    MobLoginVO mobLoginVO = MobUtil.getLoginVO();
    model.addAttribute("userId", mobLoginVO.getUserId());
    model.addAttribute("userNm", mobLoginVO.getUserNm());
    model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
    model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

    model.addAttribute("loginUsrId", LoginUtil.getUserId());
    model.addAttribute("loginUsrNm", LoginUtil.getUserNm());

    String dateFormat = this.RepairSystemConfigInfoService.selectStrValueByKey("dateFormat");
    String sysDate = DateUtil.getDate(dateFormat);
    String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), 5, -30), dateFormat);
    model.addAttribute("toDt", sysDate);
    model.addAttribute("sevenDtBf", sevenDtBf);

    model.addAttribute("roTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

    model.addAttribute("roStatCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));

    model.addAttribute("progressStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));

    model.addAttribute("carWashStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER051", null, langCd));

    model.addAttribute("qtTestStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER052", null, langCd));

    model.addAttribute("paintStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER053", null, langCd));

    model.addAttribute("rpirStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

    model.addAttribute("pauseStatList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER054", null, langCd));

    model.addAttribute("custWaitMthCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));

    model.addAttribute("atqProcTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));

    model.addAttribute("carWashTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));

    model.addAttribute("carDriveReqTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));

    model.addAttribute("useYnCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

    model.addAttribute("qtTestList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));

    model.addAttribute("carDriveReqTpCdList", this.RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));

    baseJSON.setResult(model);
    return baseJSON;
  }

  @ApiOperation("维修-查看维修进度接收列表数据")
  @RequestMapping(value={"/selectRepairOrders.do"}, method={RequestMethod.POST})
  @ResponseBody
  public BaseJSON selectRepairOrders(@RequestBody RepairOrderSearchVO searchVO)
    throws Exception
  {
    BaseJSON baseJSON = new BaseJSON();
    SearchResult result = new SearchResult();

    result.setTotal(this.RepairRepairOrderService.selectRepairOrderByConditionCnt(searchVO));

    if (result.getTotal() != 0L) {
      result.setData(this.RepairRepairOrderService.selectRepairOrderByCondition(searchVO));
    }

    baseJSON.setResult(result);
    return baseJSON;
  }


  @ApiOperation("维修-查看维修信息")
  @RequestMapping(value={"/selectWorkAssignSubLists.do"}, method={RequestMethod.POST})
  @ResponseBody
  public BaseJSON selectWorkAssigns(@RequestBody WorkAssignSearchVO searchVO)
    throws Exception
  {
    BaseJSON baseJSON = new BaseJSON();
    SearchResult result = new SearchResult();
    @SuppressWarnings("rawtypes")
	List list = this.RepairWorkAssignService.selectWorkAssignByCondition(searchVO);

    result.setData(list);
    result.setTotal(list.size());

    baseJSON.setResult(result);
    return baseJSON;
  }

	/**
	 * 注册工作进度信息
	 * 工作进度包含注册/修改/删除的列表
	 * 维修开始/继续/取消/完成
	 */
    @ApiOperation("维修-查看维修信息：维修开始/继续/取消/完成")
	@RequestMapping(value = { "/insertWorkProcess.do"}, method = {RequestMethod.POST})
	@ResponseBody
	public BaseJSON insertWorkProcess(@Validated @RequestBody WorkProcessVO vo) throws Exception{
		BaseJSON baseJSON =new BaseJSON();
	    Map<String, String> result = new HashMap<String, String>();
	    result.put("resultStat",workProcessService.insertWorkProcess(vo));
	    baseJSON.setResult(result);
	    return baseJSON;
	}

	/**
     * 维修暂停
     */
    @ApiOperation("维修-查看维修信息：维修暂停")
    @RequestMapping(value = "/selectPauseCausePopup.do", method = RequestMethod.GET)
    public BaseJSON selectPauseCausePopup(Model model) throws Exception {
    	BaseJSON baseJSON =new BaseJSON();
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //로그인 정보
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        //중지원인
        model.addAttribute("pauseStatList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER054", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 구분코드
        model.addAttribute("distTpList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER950", null, langCd));
        //브랜드 목록
        model.addAttribute("brandCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelList", RepairLtsModelMappingService.selectLtsModelsByCondition(searchVO));
        baseJSON.setResult(model);
        return baseJSON;
    }


    /**
     * 维修暂停确认（需要暂停原因）
     */
    @ApiOperation("维修-查看维修信息")
    @RequestMapping(value = "/insertWorkPauses.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertWorkPauses(@RequestBody List<WorkPauseVO> list) throws Exception{
        workPauseService.insertWorkPauses(list);
        return true;

    }
    
    @ApiOperation("维修-查看维修信息：维修暂停确认（需要暂停原因）")
    @RequestMapping(value = "/updatePauseWorkProcesss.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON updatePauseWorkProcess(@Validated @RequestBody WorkProcessSaveVO saveVO) throws Exception{
    	BaseJSON baseJSON =new BaseJSON();
        workProcessService.updatePauseWorkProcess(saveVO);
        baseJSON.setResultCode(0);
        return baseJSON;

    }




}