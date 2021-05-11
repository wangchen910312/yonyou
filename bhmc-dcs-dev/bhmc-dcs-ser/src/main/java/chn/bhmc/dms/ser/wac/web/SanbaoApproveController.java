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
import chn.bhmc.dms.ser.wac.service.SanbaoApproveService;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoApproveController.java
 * @Description : 삼포 승인 컨트롤러
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
public class SanbaoApproveController extends HController{

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="sanbaoApproveService")
    SanbaoApproveService sanbaoApproveService;

    /**
    *
    * 삼보승인 화면 메인
    *
    * @param model
    * @return 삼포 승인 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoAppr/selectSanbaoApproveMain.do" , method=RequestMethod.GET)
   public String selectSanbaoApproveMain(Model model)throws Exception{

       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd") );
       model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM-dd"));

       // 삼보 상태코드
       model.addAttribute("stateDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER216", null, LocaleContextHolder.getLocale().getLanguage()));

       return "/ser/wac/sanbaoAppr/selectSanbaoApproveMain";

   }

   /**
    *
    * 삼보승인  목록 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoSearchVO
    * @return 삼보승인 정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoAppr/selectSanbaoApproveMains.do" , method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoApproveMains(@RequestBody SanbaoSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(sanbaoApproveService.selectSanbaoApproveByConditionCnt(searchVO));
       if(result.getTotal() != 0 ){
           result.setData(sanbaoApproveService.selectSanbaoApproveByCondition(searchVO));
       }


       return result;
   }


   /**
    *
    * 삼보승인  상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return 삼보승인 상세 정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoAppr/selectSanbaoApproveByKey.do",  method=RequestMethod.POST)
   @ResponseBody
   public SanbaoVO selectSanbaoApproveByKey(@RequestBody SanbaoSearchVO searchVO)throws Exception{

       return sanbaoApproveService.selectSanbaoApproveByKey(searchVO);
   }

   /**
    *
    * 삼보승인 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return 삼보승인 부품  정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoAppr/selectSanbaoApproveParts.do",  method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoApproveParts(@RequestBody SanbaoSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();

       result.setData(sanbaoApproveService.selectSanbaoApprovePartsByCondition(searchVO));

       result.setTotal(result.getData().size());

       return result;

   }

   /**
    *
    * 삼보승인 정보를 수정 한다.
    *
    * @param saveVO - 삼보승인 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoAppr/updateSanbaoApprove.do", method=RequestMethod.POST)
   @ResponseBody
   public String updateSanbaoApprove(@RequestBody SanbaoVO sanbaoVO)throws Exception{

       return sanbaoApproveService.updateSanbaoApprove(sanbaoVO);
   }



}
