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
import chn.bhmc.dms.ser.wac.service.ClaimInvoiceEditService;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceEditMap;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceEditSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceEditController.java
 * @Description : 索赔发表编辑Controller
 * @author lixinfei
 * @since 2021. 04. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 12.    lixinfei       索赔发表编辑Controller
 * </pre>
 */
@Controller
public class ClaimInvoiceEditController extends HController{

    @Resource(name="claimInvoiceEditService")
    ClaimInvoiceEditService claimInvoiceEditService;

    @Autowired
    CommonCodeService commonCodeService;


    /**
    *
    * 索赔发票编辑页面展示
    *
    * @param model
    * @return String
    * @throws Exception
    *
    */
   @RequestMapping(value="/ser/wac/claimInvoice/selectClaimInvoiceEditMain.do" , method=RequestMethod.GET)
   public String selectClaimInvoiceEditMain(Model model)throws Exception{

       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       model.addAttribute("dlrNm", LoginUtil.getDlrNm());
       model.addAttribute("userId", LoginUtil.getUserId());
       model.addAttribute("userNm", LoginUtil.getUserNm());

       String lang = LocaleContextHolder.getLocale().getLanguage();
       //SEF004 开票状态  获取共同编码
       model.addAttribute("invoiceStatusList", commonCodeService.selectCommonCodesByCmmGrpCd("SEF004", null, lang));

       return "/ser/wac/claimInvoice/selectClaimInvoiceEdit";

   }

   /**
    *
    * 索赔发票编辑 分页查询
    *
    * @param searchVO -  ClaimInvoiceEditSearchVO
    * @return SearchResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimInvoice/selectClaimInvoiceEdit.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimInvoiceEdit(@RequestBody ClaimInvoiceEditSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();
       //设置语言
       String lang = LocaleContextHolder.getLocale().getLanguage();
       searchVO.setsLangCd(lang);
       result.setTotal(claimInvoiceEditService.selectClaimInvoiceEditByConditionCnt(searchVO));
       if(result.getTotal() != 0){
           result.setData(claimInvoiceEditService.selectClaimInvoiceEditByCondition(searchVO));
       }

       return result;

   }
   
   /**
    * 传入更新过的信息数组，更新当前发票备注信息，若返回1更新成功，否则失败
    * SA_0502T     发票信息表（SETTLEMENT_NO 与 索赔结算单信息INVC_NO、经销商代码DLR_CD 关联查询）
    * - REMARK 备注
    * <p>Title: </p >
    * @author lixinfei 2021年4月7日 下午5:45:40
    * @param ClaimInvoiceEditVO
    * @return int
    */
   @RequestMapping(value="/ser/wac/claimInvoice/updateClaimInvoiceByInvcNo.do" , method=RequestMethod.POST)
   @ResponseBody
   public StringBuffer updateClaimInvoiceByInvcNo(@RequestBody ClaimInvoiceEditMap claimInvoiceEditMap)throws Exception{
       return claimInvoiceEditService.updateClaimInvoiceByInvcNo(claimInvoiceEditMap);
   }
}