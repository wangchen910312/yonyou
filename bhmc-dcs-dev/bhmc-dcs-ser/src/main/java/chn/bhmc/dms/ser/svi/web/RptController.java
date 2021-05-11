package chn.bhmc.dms.ser.svi.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.BossSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.CastleSearchVO;
import chn.bhmc.dms.cmm.cmp.service.CastleService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.cmm.cmp.vo.DivisionSearchVO;
import chn.bhmc.dms.cmm.cmp.service.DivisionService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RptController.java
 * @Description : 레포트 관리 컨트롤러
 * @author Ki Hyun Kwon
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

@Controller
public class RptController extends HController{

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사업부 관리 서비스
     */
    @Resource(name="divisionService")
    DivisionService divisionService;

    /**
     * 성시 관리 서비스
     */
    @Resource(name="castleService")
    CastleService castleService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
    * PreCheck 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/ser/rpt/selectSerPreCheckReport.do")
   public String selectSerPreCheckReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );
       
       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       //服务数量报表 增加经销商表增加区域经理查看权限  贾明 2018-9-20 start
       model.addAttribute("userId", LoginUtil.getUserId());
       model.addAttribute("userNm", LoginUtil.getUserNm());
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       DealerSearchVO searchVO = new DealerSearchVO();
       searchVO.setsCsAreaCcbzId(LoginUtil.getUserId());
       int valeCnt = dealerService.selectDealerListByConditionCnt(searchVO);
       if(valeCnt > 0){
    	   model.addAttribute("regManJud", "Y");// 是否是区域经理，Y：是 N：否
       }else {
    	   model.addAttribute("regManJud", "N"); // 是否是区域经理，Y：是 N：否
    	   searchVO.setsCsAreaCcbzId(""); 
       }
      //服务数量报表 增加经销商表增加区域经理查看权限  贾明 2018-9-20 end
       
      //服务数量报表针对大区主任(部门科长)能查询该部门全部区域经理的经销商信息 TJX 2020-9-20 start
       //根据id查询是否为大区主任(部门科长)
       BossSearchVO bossVo = new BossSearchVO();
       String userId = LoginUtil.getUserId();
       bossVo = dealerService.selectTskListByCondition(userId);
       model.addAttribute("deptCd", "");
       if(null !=bossVo){
       if(null != bossVo.getDeptCd()) {
    	   if("08".equals(bossVo.getTskCd().trim()) || "科长".equals(bossVo.getTskNm().trim())) {
    		   model.addAttribute("deptCd", bossVo.getDeptCd());
    		   model.addAttribute("regManJud", "N"); // 是否是区域经理，Y：是 N：否
    		   searchVO.setsDeptCd(bossVo.getDeptCd());
        	   searchVO.setsCsAreaCcbzId(""); 
    	   }
       }
       }
     //服务数量报表针对大区主任(部门科长)能查询该部门全部区域经理的经销商信息 TJX 2020-9-20 end
       
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));
       return "/ser/rpt/selectSerPreCheckReport";
   }

   /**
    * 생산액 Value  리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/ser/rpt/selectSerValueReport.do")
   public String selectSerValueReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
     //服务产值报表 增加经销商表增加区域经理查看权限  贾明 2018-9-20 start
       model.addAttribute("userId", LoginUtil.getUserId());
       model.addAttribute("userNm", LoginUtil.getUserNm());
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       DealerSearchVO searchVO = new DealerSearchVO();
       searchVO.setsCsAreaCcbzId(LoginUtil.getUserId());
       int valeCnt = dealerService.selectDealerListByConditionCnt(searchVO);
       if(valeCnt > 0){
    	   model.addAttribute("regManJud", "Y");// 是否是区域经理，Y：是 N：否
       }else {
    	   model.addAttribute("regManJud", "N"); // 是否是区域经理，Y：是 N：否
    	   searchVO.setsCsAreaCcbzId(""); 
       }
      //服务产值报表 增加经销商表增加区域经理查看权限  贾明 2018-9-20 end
     //服务产值报表针对大区主任(部门科长)能查询该部门全部区域经理的经销商信息 TJX 2020-9-20 start
       //根据id查询是否为大区主任(部门科长)
       BossSearchVO bossVo = new BossSearchVO();
       String userId = LoginUtil.getUserId();
       bossVo = dealerService.selectTskListByCondition(userId);
       model.addAttribute("deptCd", "");
      if(null != bossVo){
       if(null != bossVo.getDeptCd()) {
    	   if("08".equals(bossVo.getTskCd().trim()) || "科长".equals(bossVo.getTskNm().trim())) {
    		   model.addAttribute("deptCd", bossVo.getDeptCd());
    		   model.addAttribute("regManJud", "N"); // 是否是区域经理，Y：是 N：否
    		   searchVO.setsDeptCd(bossVo.getDeptCd());
        	   searchVO.setsCsAreaCcbzId(""); 
    	   }
        }
       }
     //服务产值报表针对大区主任(部门科长)能查询该部门全部区域经理的经销商信息 TJX 2020-9-20 end
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       return "/ser/rpt/selectSerValueReport";
   }


   /**
    * RO 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/ser/rpt/selectSerRoReport.do")
   public String selectSerRoReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
       //服务效率报表 增加经销商表增加区域经理查看权限  贾明 2018-9-20 start
       model.addAttribute("userId", LoginUtil.getUserId());
       model.addAttribute("userNm", LoginUtil.getUserNm());
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       DealerSearchVO searchVO = new DealerSearchVO();
       searchVO.setsCsAreaCcbzId(LoginUtil.getUserId());
       int valeCnt = dealerService.selectDealerListByConditionCnt(searchVO);
       if(valeCnt > 0){
    	   model.addAttribute("regManJud", "Y");// 是否是区域经理，Y：是 N：否
       }else {
    	   model.addAttribute("regManJud", "N"); // 是否是区域经理，Y：是 N：否
    	   searchVO.setsCsAreaCcbzId(""); 
       }
      //服务效率报表 增加经销商表增加区域经理查看权限  贾明 2018-9-20 end
       //服务效率报表针对大区主任(部门科长)能查询该部门全部区域经理的经销商信息 TJX 2020-9-20 start
       //根据id查询是否为大区主任(部门科长)
       BossSearchVO bossVo = new BossSearchVO();
       String userId = LoginUtil.getUserId();
       bossVo = dealerService.selectTskListByCondition(userId);
       model.addAttribute("deptCd", "");
      if(null != bossVo){
       if(null != bossVo.getDeptCd()) {
    	   if("08".equals(bossVo.getTskCd().trim()) || "科长".equals(bossVo.getTskNm().trim())) {
    		   model.addAttribute("deptCd", bossVo.getDeptCd());
    		   model.addAttribute("regManJud", "N"); // 是否是区域经理，Y：是 N：否
    		   searchVO.setsDeptCd(bossVo.getDeptCd());
        	   searchVO.setsCsAreaCcbzId(""); 
    	   }
       }
      }
     //服务效率报表针对大区主任(部门科长)能查询该部门全部区域经理的经销商信息 TJX 2020-9-20 end
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       return "/ser/rpt/selectSerRoReport";
   }


   /**
    * 수리 Fix 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/ser/rpt/selectSerFixReport.do")
   public String selectSerFixReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
     //维修类型报表 增加经销商表增加区域经理查看权限  贾明 2018-9-20 start
       model.addAttribute("userId", LoginUtil.getUserId());
       model.addAttribute("userNm", LoginUtil.getUserNm());
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       DealerSearchVO searchVO = new DealerSearchVO();
       searchVO.setsCsAreaCcbzId(LoginUtil.getUserId());
       int valeCnt = dealerService.selectDealerListByConditionCnt(searchVO);
       if(valeCnt > 0){
    	   model.addAttribute("regManJud", "Y");// 是否是区域经理，Y：是 N：否
       }else {
    	   model.addAttribute("regManJud", "N"); // 是否是区域经理，Y：是 N：否
    	   searchVO.setsCsAreaCcbzId(""); 
       }
      //维修类型报表 增加经销商表增加区域经理查看权限  贾明 2018-9-20 end
     //维修类型报表针对大区主任(部门科长)能查询该部门全部区域经理的经销商信息 TJX 2020-9-20 start
       //根据id查询是否为大区主任(部门科长)
       BossSearchVO bossVo = new BossSearchVO();
       String userId = LoginUtil.getUserId();
       bossVo = dealerService.selectTskListByCondition(userId);
       model.addAttribute("deptCd", "");
      if(null != bossVo){
       if(null != bossVo.getDeptCd()) {
    	   if("08".equals(bossVo.getTskCd().trim()) || "科长".equals(bossVo.getTskNm().trim())) {
    		   model.addAttribute("deptCd", bossVo.getDeptCd());
    		   model.addAttribute("regManJud", "N"); // 是否是区域经理，Y：是 N：否
    		   searchVO.setsDeptCd(bossVo.getDeptCd());
        	   searchVO.setsCsAreaCcbzId(""); 
    	   }
       }
      }
     //维修类型报表针对大区主任(部门科长)能查询该部门全部区域经理的经销商信息 TJX 2020-9-20 end
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       return "/ser/rpt/selectSerFixReport";
   }


   /**
    * 수리 시간 FixTime 리포트 화면 메인
    * @param model
    * @throws Exception
    */
   @RequestMapping(value="/ser/rpt/selectSerFixTimeReport.do")
   public String selectSerFixTimeReport(Model model)throws Exception{

       //String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       String sysDate = DateUtil.getDate(dateFormat);

       model.addAttribute("toDt", sysDate);
       model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

       model.addAttribute("divisionList", divisionService.selectDivisionList());
       CastleSearchVO castleSearchVO = new CastleSearchVO();
       model.addAttribute("sungList", castleService.selectSungList(castleSearchVO));
      //其他业务报表 增加经销商表增加区域经理查看权限  贾明 2018-9-20 start
       model.addAttribute("userId", LoginUtil.getUserId());
       model.addAttribute("userNm", LoginUtil.getUserNm());
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       DealerSearchVO searchVO = new DealerSearchVO();
       searchVO.setsCsAreaCcbzId(LoginUtil.getUserId());
       int valeCnt = dealerService.selectDealerListByConditionCnt(searchVO);
       if(valeCnt > 0){
    	   model.addAttribute("regManJud", "Y");// 是否是区域经理，Y：是 N：否
       }else {
    	   model.addAttribute("regManJud", "N"); // 是否是区域经理，Y：是 N：否
    	   searchVO.setsCsAreaCcbzId(""); 
       }
       //其他业务报表 增加经销商表增加区域经理查看权限  贾明 2018-9-20 end
       //其他业务报表针对大区主任(部门科长)能查询该部门全部区域经理的经销商信息 TJX 2020-9-20 start
       //根据id查询是否为大区主任(部门科长)
       BossSearchVO bossVo = new BossSearchVO();
       String userId = LoginUtil.getUserId();
       bossVo = dealerService.selectTskListByCondition(userId);
       model.addAttribute("deptCd", "");
      if(null != bossVo){
       if(null != bossVo.getDeptCd()) {
    	   if("08".equals(bossVo.getTskCd().trim()) || "科长".equals(bossVo.getTskNm().trim())) {
    		   model.addAttribute("deptCd", bossVo.getDeptCd());
    		   model.addAttribute("regManJud", "N"); // 是否是区域经理，Y：是 N：否
    		   searchVO.setsDeptCd(bossVo.getDeptCd());
        	   searchVO.setsCsAreaCcbzId(""); 
    	   }
       }
      }
     //其他业务报表针对大区主任(部门科长)能查询该部门全部区域经理的经销商信息 TJX 2020-9-20 end
       model.addAttribute("dlrList", dealerService.selectDealerListByCondition(searchVO));

       return "/ser/rpt/selectSerFixTimeReport";
   }

   /**
    * 사무소 목록 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 DivisionSearchVO
    * @return
    */
   @RequestMapping(value = "/ser/rpt/selectOfficeList.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectOfficeListByDivision(@RequestBody DivisionSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       result.setData(divisionService.selectOfficeListByDivision(searchVO));

       return result;
   }

   /**
    * 사무소 목록 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 DivisionSearchVO
    * @return
    */
   @RequestMapping(value = "/ser/rpt/selectSungList.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSungListByOffice(@RequestBody CastleSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       result.setData(castleService.selectSungList(searchVO));

       return result;
   }

   /**
    * 도시 목록 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ZipCodeSearchVO
    * @return
    */
   @RequestMapping(value = "/ser/rpt/selectCityList.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectCityListBySung(@RequestBody CastleSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       result.setData(castleService.selectCityListBySung(searchVO));

       return result;
   }

   /**
    * 딜러 목록 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는
    * @return
    */
   @RequestMapping(value = "/ser/rpt/selectDealerList.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectDealerList(@RequestBody DealerSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       result.setData(dealerService.selectDealerListByCondition(searchVO));

       return result;
   }

}
