package chn.bhmc.dms.ser.wac.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.wac.service.SanbaoInfoService;
import chn.bhmc.dms.ser.wac.vo.SanbaoAlarmVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoSameProblemController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 17.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Controller
public class SanbaoSameProblemController extends HController{


    @Resource(name="sanbaoInfoService")
    SanbaoInfoService sanbaoInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
    *
    * 삼포  동일하자 화면 메인
    *
    * @param model
    * @return 삼포 동일하자 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoSameProblem/selectSanbaoSameProblemMain.do")
   public String selectSanbaoSameProblemMain(Model model,@RequestParam(value="docNo", defaultValue="") String docNo)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       //공통코드 : 여부
       model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

       //부품그룹 코드
       model.addAttribute("itemGrpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER209", null, langCd));

       //클레임유형
       model.addAttribute("claimTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER091", null, langCd));

       return "/ser/wac/sanbaoSameProblem/selectSanbaoSameProblemMain";

   }

   /**
   *
   * 삼포  정보를 조회한다.
   *
   * @param model
   * @return 삼포  정보를 조회한다.
   * @throws Exception
   */
   @RequestMapping(value="/ser/wac/sanbaoSameProblem/selectSanbaoAlarmInfoByKey.do" , method=RequestMethod.POST)
   @ResponseBody
   public SanbaoAlarmVO selectSanbaoSameProblemByKey(@RequestBody SanbaoSearchVO searchVO)throws Exception{

       return sanbaoInfoService.selectSanbaoAlarmInfoByKey(searchVO);

   }

   /**
    *
    * 삼포 동일부품 조회
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoSameProblem/selectSanbaoItems.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoSameProblemItems(@RequestBody SanbaoSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setData(sanbaoInfoService.selectSanbaoItemsByCondition(searchVO));

       return result;
   }

   /**
    *
    * 삼포 고객 조회
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoSameProblem/selectSanbaoCustInfo.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoSameProblemCustInfo(@RequestBody SanbaoSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setData(sanbaoInfoService.selectSanbaoCustInfoByCondition(searchVO));

       return result;
   }

   /**
    *
    * 삼포 클레임 정보 조회
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoSameProblem/selectSanbaoSameProblemClaimInfo.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoSameProblemClaimInfo(@RequestBody SanbaoSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setData(sanbaoInfoService.selectSanbaoClaimInfoByCondition(searchVO));

       return result;
   }


}
