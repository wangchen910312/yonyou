package chn.bhmc.dms.ser.wac.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.wac.service.SanbaoInfoService;
import chn.bhmc.dms.ser.wac.service.SanbaoReturnApproveService;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoReturnApproveController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 7. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 26.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Controller
public class SanbaoReturnApproveController extends HController {

    @Resource(name="sanbaoReturnApproveService")
    SanbaoReturnApproveService sanbaoReturnApproveService;

    /**
     * 공통코드 관리 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    /**
     * 삼포정보 서비스
     */
    @Autowired
    SanbaoInfoService sanbaoInfoService;

    @RequestMapping(value="/ser/wac/sanbaoRtnAppr/selectSanbaoReturnApproveMain.do",method=RequestMethod.GET)
    public String selectSanbaoReturnApproveMain(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 공통코드 : 반품구분
        model.addAttribute("returnTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER212", null, langCd));

        // 공통코드 : 상태
        model.addAttribute("returnStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER213", null, langCd));

        // 공통코드 : 신청구분
        model.addAttribute("reqDstinTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER217", null, langCd));

        // 공통코드 : 부품그룹
        model.addAttribute("itemGrpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER209", null, langCd));

        return "/ser/wac/sanbaoRtnAppr/selectSanbaoReturnApproveMain";
    }

    /**
     *
     * 삼포 반품 승인 리스트 조회
     *
     * @param sanbaoReturnVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/sanbaoRtnAppr/selectSanbaoReturnApproves.do",method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSanbaoReturnApproves(@RequestBody SanbaoReturnSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(sanbaoReturnApproveService.selectSanbaoReturnApproveByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(sanbaoReturnApproveService.selectSanbaoReturnApproveByCondition(searchVO));
        }

        return result;
    }

    /**
     *
     * 삼포반품승인 상세 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/sanbaoRtnAppr/selectSanbaoReturnApproveByKey.do",method=RequestMethod.POST)
    @ResponseBody
    public SanbaoReturnVO selectSanbaoReturnApproveByKey(@RequestBody SanbaoReturnSearchVO searchVO)throws Exception{

        return sanbaoReturnApproveService.selectSanbaoReturnApproveByKey(searchVO);
    }

    /**
    *
    * 삼포 부품 정보
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoRtnAppr/selectSanbaoReturnRequestItems.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoReturnRequestItems(@RequestBody SanbaoSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setData(sanbaoInfoService.selectSanbaoItemsByCondition(searchVO));

       result.setTotal(result.getData().size());


       return result;

   }

   /**
    *
    * 삼포 작업 정보
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoRtnAppr/selectSanbaoReturnRequestWorkInfos.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoReturnRequestWorkInfos(@RequestBody SanbaoSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setData(sanbaoInfoService.selectSanbaoWorkInfoByCondition(searchVO));

       result.setTotal(result.getData().size());

       return result;

   }

   /**
    *
    * 삼포클레임 정보
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoRtnAppr/selectSanbaoReturnApproveClaimInfos.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoReturnApproveClaimInfos(@RequestBody SanbaoSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setData(sanbaoInfoService.selectSanbaoClaimInfoByCondition(searchVO));

       result.setTotal(result.getData().size());

       return result;
   }

   /**
    *
    * 삼포 반품승인 수정
    *
    * @param sanbaoReturnVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoRtnAppr/updateSanbaoReturnApprove.do",method=RequestMethod.POST)
   @ResponseBody
   public boolean updateSanbaoReturnApprove(@Validated @RequestBody SanbaoReturnVO sanbaoReturnVO)throws Exception{

       sanbaoReturnApproveService.updateSanbaoReturnApprove(sanbaoReturnVO);
       return true;
   }

}
