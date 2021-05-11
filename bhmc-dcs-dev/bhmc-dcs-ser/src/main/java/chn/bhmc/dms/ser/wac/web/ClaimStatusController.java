package chn.bhmc.dms.ser.wac.web;

import java.util.Calendar;
import java.util.Date;

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
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.wac.service.ClaimStatusService;
import chn.bhmc.dms.ser.wac.vo.ClaimStatusSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimStatusController.java
 * @Description : 클레임 청구 컨트롤러
 * @author Kwon Ki Hyun
 * @since 2016. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 3.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Controller
public class ClaimStatusController extends HController{

    @Resource(name="claimStatusService")
    ClaimStatusService claimStatusService;

    @Autowired
    CommonCodeService commonCodeService;


    /**
    *
    * 클레임 현황 화면 메인
    *
    * @param model
    * @return 클레임 현황 화면
    * @throws Exception
    *
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimStatusMain.do" , method=RequestMethod.GET)
   public String selectClaimStatusMain(Model model)throws Exception{

       model.addAttribute("dlrCd", LoginUtil.getDlrCd());

       model.addAttribute("sClaimToDt", DateUtil.getDate("yyyy-MM-dd"));
       model.addAttribute("sClaimFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), "yyyy-MM-dd") );

       //클레임유형
       model.addAttribute("claimTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER091", null, LocaleContextHolder.getLocale().getLanguage()));

       return "/ser/wac/claimReq/selectClaimStatusMain";

   }

   /**
    *
    * 클레임 현황 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 현황 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimStatus.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimStatus(@RequestBody ClaimStatusSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(claimStatusService.selectClaimStatusByConditionCnt(searchVO));
       if(result.getTotal() != 0){
           result.setData(claimStatusService.selectClaimStatusByCondition(searchVO));
       }

       return result;

   }
}