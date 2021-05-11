/*     */ package chn.bhmc.dms.mob.api.part.controller;
/*     */ 
/*     */ import able.com.web.HController;
/*     */ import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
/*     */ import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
/*     */ import chn.bhmc.dms.core.datatype.SearchResult;
/*     */ import chn.bhmc.dms.core.util.DateUtil;
/*     */ import chn.bhmc.dms.core.util.LoginUtil;
/*     */ import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
/*     */ import chn.bhmc.dms.mob.api.part.service.PartInvcService;
/*     */ import chn.bhmc.dms.mob.api.part.service.PartStorageService;
/*     */ import chn.bhmc.dms.mob.api.part.service.PartSystemConfigInfoService;
/*     */ import chn.bhmc.dms.mob.api.part.service.PartVenderMasterService;
/*     */ import chn.bhmc.dms.mob.api.part.vo.CommonCodeSearchVO;
/*     */ import chn.bhmc.dms.mob.api.part.vo.InvcSearchVO;
/*     */ import chn.bhmc.dms.mob.api.part.vo.StorageSearchVO;
/*     */ import chn.bhmc.dms.mob.api.part.vo.VenderMasterVO;
/*     */ import chn.bhmc.dms.mob.config.BaseJSON;
/*     */ import chn.bhmc.dms.par.pcm.service.InvcService;
/*     */ import chn.bhmc.dms.par.pcm.vo.InvcListVO;
/*     */ import chn.bhmc.dms.par.pcm.vo.InvcVO;
/*     */ import chn.bhmc.dms.sal.veh.service.CarInfoService;
/*     */ import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
/*     */ import io.swagger.annotations.Api;
/*     */ import io.swagger.annotations.ApiOperation;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Date;
/*     */ import java.util.List;
/*     */ import java.util.Locale;
/*     */ import javax.annotation.Resource;
/*     */ import org.springframework.context.i18n.LocaleContextHolder;
/*     */ import org.springframework.stereotype.Controller;
/*     */ import org.springframework.ui.Model;
/*     */ import org.springframework.validation.annotation.Validated;
/*     */ import org.springframework.web.bind.annotation.RequestBody;
/*     */ import org.springframework.web.bind.annotation.RequestMapping;
/*     */ import org.springframework.web.bind.annotation.RequestParam;
/*     */ import org.springframework.web.bind.annotation.ResponseBody;
/*     */ 
/*     */ @Controller
/*     */ @RequestMapping({"/api/part/InvcConfirm"})
/*     */ @Api("采购入库确认")
/*     */ public class InvcConfirmApi extends HController
/*     */ {
/*     */ 
/*     */   @Resource(name="PartSystemConfigInfoService")
/*     */   PartSystemConfigInfoService systemConfigInfoService;
/*     */ 
/*     */   @Resource(name="PartVenderMasterService")
/*     */   PartVenderMasterService venderMasterService;
/*     */ 
/*     */   @Resource(name="PartStorageService")
/*     */   PartStorageService storageService;
/*     */ 
/*     */   @Resource(name="unitInfoService")
/*     */   UnitInfoService unitInfoService;
/*     */ 
/*     */   @Resource(name="carInfoService")
/*     */   CarInfoService carInfoService;
/*     */ 
/*     */   @Resource(name="PartCommonCodeService")
/*     */   PartCommonCodeService commonCodeService;
/*     */ 
/*     */   @Resource(name="PartInvcService")
/*     */   PartInvcService partInvcService;
/*     */ 
/*     */   @Resource(name="invcService")
/*     */   InvcService invcService;
/*     */ 
/*     */   @ApiOperation("采购入库确认(页面加载)")
/*     */   @RequestMapping(value={"/selectReceiveCnfmMain.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
/*     */   @ResponseBody
/*     */   public BaseJSON selectReceiveCnfmMain(Model model, @RequestParam(value="pMobisInvcNo", defaultValue="") String pMobisInvcNo, @RequestParam(value="pBpCd", defaultValue="") String pBpCd, @RequestParam(value="pBpNm", defaultValue="") String pBpNm, @RequestParam(value="pArrvYy", defaultValue="") String pArrvYy, @RequestParam(value="pArrvMm", defaultValue="") String pArrvMm, @RequestParam(value="pArrvDd", defaultValue="") String pArrvDd, @RequestParam(value="pItemDistinCd", defaultValue="") String pItemDistinCd, @RequestParam(value="pInvcDocNo", defaultValue="") String pInvcDocNo)
/*     */     throws Exception
/*     */   {
/* 119 */     String langCd = LocaleContextHolder.getLocale().getLanguage();
/* 120 */     String dateFormat = this.systemConfigInfoService
/* 121 */       .selectStrValueByKey("dateFormat");
/* 122 */     String sysDate = DateUtil.getDate(dateFormat);
/* 123 */     String sevenDtBf = DateUtil.getDate(
/* 124 */       DateUtil.add(new Date(), 5, -30), dateFormat);
/*     */ 
/* 126 */     VenderMasterVO venderMasterVO = new VenderMasterVO();
/* 127 */     venderMasterVO = this.venderMasterService.selectBHMCVenderMaster(
/* 128 */       LoginUtil.getDlrCd());
/*     */ 
/* 130 */     StorageSearchVO storageSearchVO = new StorageSearchVO();
/* 131 */     List storageList = new ArrayList();
/*     */ 
/* 133 */     UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
/* 134 */     List invcUnitList = new ArrayList();
/*     */ 
/* 136 */     storageSearchVO.setsPltCd(LoginUtil.getPltCd());
/* 137 */     storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
/* 138 */     storageSearchVO.setsStrgeSaleAccYn("Y");
/* 139 */     storageList = this.storageService.selectStoragesByCondition(storageSearchVO);
/*     */ 
/* 141 */     unitInfoSearchVO.setsUseYn("Y");
/* 142 */     invcUnitList = this.unitInfoService
/* 143 */       .selectUnitInfosByCondition(unitInfoSearchVO);
/*     */ 
/* 146 */     CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
/*     */ 
/* 148 */     carInfoSearchVO.setUseYn("Y");
/* 149 */     model.addAttribute("carlineCdList", this.carInfoService.selectCarListsByCondition(carInfoSearchVO));
/*     */ 
/* 151 */     if (venderMasterVO != null) {
/* 152 */       model.addAttribute("bpCd", venderMasterVO.getBpCd());
/* 153 */       model.addAttribute("bpNm", venderMasterVO.getBpNm());
/* 154 */       model.addAttribute("bpTp", venderMasterVO.getBpTp());
/*     */     } else {
/* 156 */       model.addAttribute("bpCd", "A10AA001");
/* 157 */       model.addAttribute("bpNm", "BMP");
/* 158 */       model.addAttribute("bpTp", "01");
/*     */     }
/*     */ 
/* 162 */     model.addAttribute("dlrCd", LoginUtil.getDlrCd());
/* 163 */     model.addAttribute("regUsrId", LoginUtil.getUserId());
/* 164 */     model.addAttribute("pltCd", LoginUtil.getPltCd());
/* 165 */     model.addAttribute("invcUnitList", invcUnitList);
/* 166 */     model.addAttribute("invcTpList", this.commonCodeService
/* 167 */       .selectCommonCodesByCmmGrpCd("PAR211", null, langCd));
/* 168 */     model.addAttribute("invcStatList", this.commonCodeService
/* 169 */       .selectCommonCodesByCmmGrpCd("PAR213", null, langCd));
/* 170 */     model.addAttribute("storageList", storageList);
/* 171 */     model.addAttribute("purcOrdTpList", this.commonCodeService
/* 172 */       .selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
/* 173 */     model.addAttribute("prcTpList", this.commonCodeService
/* 174 */       .selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
/* 175 */     model.addAttribute("dlPdcCdList", this.commonCodeService
/* 176 */       .selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
/* 177 */     model.addAttribute("clTpList", this.commonCodeService
/* 178 */       .selectCommonCodesByCmmGrpCd("PAR222", null, langCd));
/* 179 */     model.addAttribute("clTargetTpList", this.commonCodeService
/* 180 */       .selectCommonCodesByCmmGrpCd("PAR221", null, langCd));
/*     */ 
/* 183 */     CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
/* 184 */     abcIndCdSearchVO.setsLangCd(langCd);
/* 185 */     abcIndCdSearchVO.setsCmmGrpCd("PAR108");
/* 186 */     abcIndCdSearchVO.setsUseYn("Y");
/* 187 */     model.addAttribute("abcIndList", this.commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));
/*     */ 
/* 189 */     model.addAttribute("grTpList", this.commonCodeService
/* 190 */       .selectCommonCodesByCmmGrpCd("PAR216", null, langCd));
/*     */ 
/* 196 */     CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
/* 197 */     commonCodeSearchVO.setsCmmGrpCd("PAR121");
/* 198 */     commonCodeSearchVO.setsRemark2("01");
/* 199 */     model.addAttribute("bpTpList", this.commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));
/*     */ 
/* 201 */     model.addAttribute("toDt", sysDate);
/* 202 */     model.addAttribute("sevenDtBf", sevenDtBf);
/* 203 */     model.addAttribute("pMobisInvcNo", pMobisInvcNo);
/* 204 */     model.addAttribute("pItemDistinCd", pItemDistinCd);
/* 205 */     model.addAttribute("pBpCd", pBpCd);
/* 206 */     model.addAttribute("pBpNm", pBpNm);
/* 207 */     model.addAttribute("pArrvYy", pArrvYy);
/* 208 */     model.addAttribute("pArrvMm", pArrvMm);
/* 209 */     model.addAttribute("pArrvDd", pArrvDd);
/* 210 */     model.addAttribute("pInvcDocNo", pInvcDocNo);
/*     */ 
/* 213 */     BaseJSON baseJSON = new BaseJSON();
/* 214 */     baseJSON.setResult(model.asMap());
/* 215 */     return baseJSON;
/*     */   }
/*     */ 
/*     */   @ApiOperation("采购入库确认(列表数据)")
/*     */   @RequestMapping(value={"/selectInvcItems.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
/*     */   @ResponseBody
/*     */   public BaseJSON selectInvcItems(@RequestBody InvcSearchVO searchVO)
/*     */     throws Exception
/*     */   {
/* 229 */     SearchResult result = new SearchResult();
/* 230 */     searchVO.setsDlrCd(LoginUtil.getDlrCd());
/* 231 */     result.setTotal(this.partInvcService.selectInvcsByConditionCnt(searchVO));
/*     */ 
/* 233 */     if (result.getTotal() != 0L) {
/* 234 */       result.setData(this.partInvcService.selectInvcsByCondition(searchVO));
/*     */     }
/*     */ 
/* 238 */     BaseJSON baseJSON = new BaseJSON();
/* 239 */     baseJSON.setResult(result);
/* 240 */     return baseJSON;
/*     */   }
/*     */ 
/*     */   @ApiOperation("采购入库确认(明细数据)")
/*     */   @RequestMapping(value={"/selectReceiveItemByCondition.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
/*     */   @ResponseBody
/*     */   public BaseJSON selectReceiveItemByCondition(@RequestBody InvcSearchVO searchVO)
/*     */     throws Exception
/*     */   {
/* 254 */     SearchResult result = new SearchResult();
/*     */ 
/* 256 */     searchVO.setsDlrCd(LoginUtil.getDlrCd());
/*     */ 
/* 258 */     result.setTotal(this.partInvcService.selectReceiveItemByConditionCnt(searchVO));
/*     */ 
/* 260 */     if (result.getTotal() != 0L) {
/* 261 */       result.setData(this.partInvcService.selectReceiveItemByCondition(searchVO));
/*     */     }
/* 263 */     BaseJSON baseJSON = new BaseJSON();
/* 264 */     baseJSON.setResult(result);
/* 265 */     return baseJSON;
/*     */   }
/*     */ 
/*     */   @ApiOperation("根据入库单号查询装箱单明细数据")
/*     */   @RequestMapping(value={"/selectReceiveCnfmItemByInvcKey.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
/*     */   @ResponseBody
/*     */   public BaseJSON selectReceiveCnfmItemByInvcKey(@RequestBody InvcSearchVO searchVO)
/*     */     throws Exception
/*     */   {
/* 278 */     SearchResult result = new SearchResult();
/*     */ 
/* 281 */     searchVO.setsDlrCd(LoginUtil.getDlrCd());
/*     */ 
/* 283 */     result.setData(this.partInvcService.selectReceiveCnfmItemByInvcKey(searchVO));
/*     */ 
/* 286 */     BaseJSON baseJSON = new BaseJSON();
/* 287 */     baseJSON.setResult(result);
/* 288 */     return baseJSON;
/*     */   }
/*     */ 
/*     */   @ApiOperation("更新装箱单状态  确定 =》 入库等待")
/*     */   @RequestMapping(value={"/updateReceiveRgst.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
/*     */   @ResponseBody
/*     */   public BaseJSON updateReceiveRgst(@Validated @RequestBody InvcListVO invcListVO)
/*     */     throws Exception
/*     */   {
/* 301 */     InvcVO invcVO = invcListVO.getInvcVO();
/* 302 */     List list = invcListVO.getInvcItemList();
/*     */ 
/* 304 */     InvcVO updated = this.invcService.updateReceiveRgst(invcVO, list);
/*     */ 
/* 306 */     updated.setResultYn(true);
/*     */ 
/* 308 */     BaseJSON baseJSON = new BaseJSON();
/* 309 */     baseJSON.setResult(updated);
/* 310 */     return baseJSON;
/*     */   }
/*     */ 
/*     */   @ApiOperation("确认入库")
/*     */   @RequestMapping(value={"/insertReceiveCnfm.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
/*     */   @ResponseBody
/*     */   public BaseJSON insertReceiveCnfm(@Validated @RequestBody InvcListVO invcListVO)
/*     */     throws Exception
/*     */   {
/* 323 */     InvcVO invcVO = invcListVO.getInvcVO();
/* 324 */     List list = invcListVO.getInvcItemList();
/*     */ 
/* 326 */     InvcVO updated = this.invcService.updateReceiveCnfm(invcVO, list);
/*     */ 
/* 328 */     updated.setResultYn(true);
/*     */ 
/* 330 */     BaseJSON baseJSON = new BaseJSON();
/* 331 */     baseJSON.setResult(updated);
/* 332 */     return baseJSON;
/*     */   }
/*     */ }

/* Location:           C:\Users\Watermark89\AppData\Local\Temp\7zO4AA13389\
 * Qualified Name:     chn.bhmc.dms.mob.api.part.controller.InvcConfirmApi
 * JD-Core Version:    0.6.2
 */