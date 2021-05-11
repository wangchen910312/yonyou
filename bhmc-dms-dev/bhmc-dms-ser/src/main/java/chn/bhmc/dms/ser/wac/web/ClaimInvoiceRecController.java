package chn.bhmc.dms.ser.wac.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.wac.service.ClaimInvoiceRecService;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecSettlementSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecSettlementVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceRecController.java
 * @Description : 索赔发票收款Controller
 * @author lixinfei
 * @since 2021. 04. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 13.    lixinfei         索赔发票收款Controller
 * </pre>
 */
@Controller
public class ClaimInvoiceRecController extends HController{

    @Resource(name="claimInvoiceRecService")
    ClaimInvoiceRecService claimInvoiceRecService;

    @Autowired
    CommonCodeService commonCodeService;

    /**
    *
    * 索赔发票收款 页面展示
    *
    * @param model
    * @return String
    * @throws Exception
    *
    */
   @RequestMapping(value="/ser/wac/claimInvoiceRec/selectClaimInvoiceRecMain.do" , method=RequestMethod.GET)
   public String selectClaimInvoiceRecMain(Model model)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();
       model.addAttribute("userId", LoginUtil.getUserId());
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       model.addAttribute("dlrNm", LoginUtil.getDlrNm());

       //SEF006 汇款状态 共同编码
       model.addAttribute("remittanceStateList", commonCodeService.selectCommonCodesByCmmGrpCd("SEF006", null, langCd));

       return "/ser/wac/claimInvoiceRec/selectClaimInvoiceRecMain";

   }

   /**
    *
    * 索赔发票收款 索赔主单 分页查询
    *
    * @param searchVO - ClaimInvoiceRecSettlementSearchVO
    * @return SearchResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimInvoiceRec/selectClaimInvoiceRec.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimInvoiceRec(@RequestBody ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(claimInvoiceRecService.selectClaimInvoiceRecSettlementByConditionCnt(searchVO));
       if(result.getTotal() != 0){
           result.setData(claimInvoiceRecService.selectClaimInvoiceRecSettlementByCondition(searchVO));
       }

       return result;

   }
   
   /**
   *
   * 索赔发票收款 主单内发票 分页查询
   *
   * @param searchVO - ClaimInvoiceRecSettlementSearchVO
   * @return SearchResult
   * @throws Exception
   */
  @RequestMapping(value="/ser/wac/claimInvoiceRec/selectClaimInvoiceRecInSettlement.do" , method=RequestMethod.POST)
  @ResponseBody
  public SearchResult selectClaimInvoiceRecInSettlement(@RequestBody ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception{

      SearchResult result = new SearchResult();

      result.setTotal(claimInvoiceRecService.selectClaimInvoiceRecByConditionCnt(searchVO));
      if(result.getTotal() != 0){
          result.setData(claimInvoiceRecService.selectClaimInvoiceRecByCondition(searchVO));
      }

      return result;

  }
  
  
  /**
   * 更新当前索赔单收款信息，若返回1更新成功，否则失败
   * SE_0960T PAYM_TP汇款状态  01(未汇款),02(已汇款),03(已收款)    
   * <p>Title: </p >
   * @author lixinfei 2021年4月7日 下午5:45:40
   * @param ClaimInvoiceRecSettlementSaveVO
   * @return String
   */
  @RequestMapping(value="/ser/wac/claimInvoiceRec/updateClaimInvoiceRecPaymTp.do" , method=RequestMethod.POST)
  @ResponseBody
  public String updateClaimInvoiceRecPaymTp(@RequestBody ClaimInvoiceRecSettlementVO saveVO)throws Exception{
      return claimInvoiceRecService.updateClaimInvoiceRecPaymTp(saveVO);
  }
  
}