package chn.bhmc.dms.ser.wac.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

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
import chn.bhmc.dms.ser.wac.service.SanbaoTechApproveService;
import chn.bhmc.dms.ser.wac.vo.SanbaoTechSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoTechVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoTechRequestController.java
 * @Description : 삼포 기술제출 처리 컨트롤러
 * @author YIN XUEYUAN
 * @since 2016. 3. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 9.     YIN XUEYUAN     최초 생성
 * </pre>
 */
@Controller
public class SanbaoTechApproveController extends HController{

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="sanbaoTechApproveService")
    SanbaoTechApproveService sanbaoTechApproveService;


    /**
    *
    * 삼보 기술처리 화면 메인
    *
    * @param model
    * @return 삼보 기술처리 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoTechAppr/selectSanbaoTechApproveMain.do" ,method=RequestMethod.GET)
   public String selectSanbaoTechApproveMain(Model model)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd") );
       model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM-dd"));

       /** 삼보 상태코드 **/
       model.addAttribute("stateDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER201", null, langCd));
       /** 삼보 난제고장 **/
       model.addAttribute("pblmErrDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER203", null, langCd));
       /** 삼보 긴급경계 **/
       model.addAttribute("emgcAlrtDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER204", null, langCd));

       return "/ser/wac/sanbaoTechAppr/selectSanbaoTechApproveMain";

   }

   /**
    *
    * 삼보 기술처리 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술처리 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoTechAppr/selectSanbaoTechApproveMains.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoTechApproveMains(@RequestBody SanbaoTechSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(sanbaoTechApproveService.selectSanbaoTechApproveByConditionCnt(searchVO));
       if(result.getTotal() != 0 ){
           result.setData(sanbaoTechApproveService.selectSanbaoTechApproveByCondition(searchVO));
       }


       return result;
   }

   /**
    *
    * 삼보 기술처리  상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술처리 상세 정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoTechAppr/selectSanbaoTechApproveByKey.do" , method=RequestMethod.POST)
   @ResponseBody
   public SanbaoTechVO selectSanbaoTechApproveByKey(@RequestBody SanbaoTechSearchVO searchVO)throws Exception{


       return sanbaoTechApproveService.selectSanbaoTechRequestByKey(searchVO);

   }

   /**
    *
    * 삼보 기술제출 정보를 수정 한다.
    *
    * @param saveVO - 삼보 기술제출 등록/수정/삭제 목록을 포함하는 SanbaoTechVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoTechAppr/updateSanbaoTechApprove.do" , method = RequestMethod.POST)
   @ResponseBody
   public String updateSanbaoTechApprove(@RequestBody SanbaoTechVO sanbaoTechVO)throws Exception{

       String approveNo = sanbaoTechApproveService.updateSanbaoTechApprove(sanbaoTechVO);

       return approveNo;
   }

}
