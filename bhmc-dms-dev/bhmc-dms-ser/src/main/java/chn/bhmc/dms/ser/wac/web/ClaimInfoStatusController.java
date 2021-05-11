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
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.wac.service.ClaimInfoStatusService;
import chn.bhmc.dms.ser.wac.vo.ClaimInfoStatusSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInfoStatusController.java
 * @Description : 클레임 정보 현황 컨트롤러
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
public class ClaimInfoStatusController extends HController{

    @Resource(name="claimInfoStatusService")
    ClaimInfoStatusService claimInfoStatusService;

    @Autowired
    CommonCodeService commonCodeService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
    *
    * 클레임 정보 현황 화면 메인
    *
    * @param model
    * @return 클레임 정보 현황 화면
    * @throws Exception
    *
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimInfoStatusMain.do" , method=RequestMethod.GET)
   public String selectClaimInfoStatusMain(Model model)throws Exception{

       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

       model.addAttribute("dlrCd", LoginUtil.getDlrCd());

       model.addAttribute("sClaimReqToDt", DateUtil.getDate(dateFormat));
       model.addAttribute("sClaimReqFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );

       //클레임 상태
       model.addAttribute("claimStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER090", null, LocaleContextHolder.getLocale().getLanguage()));
       //클레임유형
       model.addAttribute("claimTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER091", null, LocaleContextHolder.getLocale().getLanguage()));

       return "/ser/wac/claimReq/selectClaimInfoStatusMain";

   }

   /**
    *
    * 클레임 정보 현황 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 정보 현황 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimInfoStatus.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimInfoStatus(@RequestBody ClaimInfoStatusSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(claimInfoStatusService.selectClaimInfoStatusByConditionCnt(searchVO));
       if(result.getTotal() != 0){
           result.setData(claimInfoStatusService.selectClaimInfoStatusByCondition(searchVO));
       }

       return result;

   }
}