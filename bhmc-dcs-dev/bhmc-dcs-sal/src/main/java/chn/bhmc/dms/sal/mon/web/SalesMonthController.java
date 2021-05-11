package chn.bhmc.dms.sal.mon.web;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.mon.service.SalesMonthService;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSearchVO;

/**
 * @ClassName   : SalesMonthController.java
 * @Description : 自动化月结
 * @author LYY
 * @since 2017. 4. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 4. 17.    KIM JIN SUK            최초 생성
 * </pre>
 */
@Controller
@RequestMapping(value = "/sal/mon/salesMonth")
public class SalesMonthController extends HController {

   @Resource(name="salesMonthService")
   SalesMonthService salesMonthService;
   
   /**
    * 
    */
   @Resource(name="commonCodeService")
   CommonCodeService commonCodeService;
   
   /**
    * 进入主页面
    * @return
    */
   @RequestMapping(value = "/initSalesMonthMain.do", method = RequestMethod.GET)
   public String initSalesMonthMain(Model model) throws Exception {

	   String langCd = LocaleContextHolder.getLocale().getLanguage();

       model.addAttribute("userId", LoginUtil.getUserId());
       model.addAttribute("userNm", LoginUtil.getUserNm());
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

       // 현재일자 DateUtil
       String sysDate = DateUtil.getDate("yyyy-MM-dd");
       String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
       model.addAttribute("toDay", sysDate);
       model.addAttribute("oneDay", oneDay);
       return "/sal/mon/selectSalesMonthMain";
   }
   
   /**
    * 进入DCS自动化月结Tab签
    * @return
    */
   @RequestMapping(value = "/selectDcsSalesMonthMain.do", method = RequestMethod.GET)
   public String selectDcsSalesMonthMain(Model model) throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       model.addAttribute("userId", LoginUtil.getUserId());
       model.addAttribute("userNm", LoginUtil.getUserNm());
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

       // 현재일자 DateUtil
       String sysDate = DateUtil.getDate("yyyy-MM-dd");
       String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
       model.addAttribute("toDay", sysDate);
       model.addAttribute("oneDay", oneDay);

       // 예외처리 요청 사유 코드 SAL153 : FCE_SALE_REQ_REASON_CD
       //model.addAttribute("reqReasonDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL153", null, langCd));

       return "/sal/mon/selectDcsSalesMonthMain";
   }
   
   /**
    * 进入DMS自动化月结Tab签
    * @return
    */
   @RequestMapping(value = "/selectDmsSalesMonthMain.do", method = RequestMethod.GET)
   public String selectDmsSalesMonthMain(Model model) throws Exception {

	   String langCd = LocaleContextHolder.getLocale().getLanguage();

       model.addAttribute("userId", LoginUtil.getUserId());
       model.addAttribute("userNm", LoginUtil.getUserNm());
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

       // 현재일자 DateUtil
       String sysDate = DateUtil.getDate("yyyy-MM-dd");
       String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
       model.addAttribute("toDay", sysDate);
       model.addAttribute("oneDay", oneDay);

       return "/sal/mon/selectDmsSalesMonthMain";
   }

   @RequestMapping(value = "/updateOrderInfoErpToDcs.do", method = RequestMethod.GET)
   @ResponseBody
   public int updateOrderInfoErpToDcs(String month)throws Exception{
       return salesMonthService.updateOrderInfoErpToDcs(month);
   }
   
   /**
    * 查询DCS没有与SAP同步成功的数据
    * @param searchVO
    * @return
    */
   /*@RequestMapping(value = "/selectDcsSalesMonth.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectDcsSalesMonth(@RequestBody NotAssignedOrderSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       result.setTotal(salesMonthService.selectDcsSalesMonthCnt(searchVO));

       if(result.getTotal() != 0){

           result.setData(salesMonthService.selectDcsSalesMonth(searchVO));
       }

       return result;
   }*/

}
