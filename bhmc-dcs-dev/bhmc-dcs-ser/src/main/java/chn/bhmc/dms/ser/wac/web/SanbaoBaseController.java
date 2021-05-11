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
import chn.bhmc.dms.ser.wac.service.SanbaoBaseService;
import chn.bhmc.dms.ser.wac.vo.SanbaoBaseSaveVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoBaseSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoBaseController.java
 * @Description : 삼포 정책관리 컨트롤러
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
public class SanbaoBaseController extends HController{

    /**
     * 공통코드 관리 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    @Resource(name ="sanbaoBaseService")
    SanbaoBaseService sanbaoBaseService;

    /**
    *
    * 삼포 정책관리 화면 메인
    *
    * @param model
    * @return 삼포 정책관리 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoBase/selectSanbaoBaseMain.do", method=RequestMethod.GET)
   public String selectSanbaoBaseMain(Model model)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

       /** 적용기준코드 **/
       model.addAttribute("applyDstinDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER208", null, langCd));

       /** 부품그룹 코드 **/
       model.addAttribute("itemGrpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER209", null, langCd));

       return "/ser/wac/sanbaoBase/selectSanbaoBaseMain";

   }

   /**
    *
    * 삼보 정책기준 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 삼보 정책기준 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoBase/selectSanbaoBaseMains.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoBaseMains(@RequestBody SanbaoBaseSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setData(sanbaoBaseService.selectSanbaoBaseByCondition(searchVO));
       result.setTotal(result.getData().size());

       return result;
   }

   /**
    *
    * 삼보 정책기준 RO 작업시간 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 삼보 정책기준 RO 작업시간 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoBase/selectSanbaoBaseRoWorkTimes.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoBaseRoWorkTimes(@RequestBody SanbaoBaseSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setData(sanbaoBaseService.selectSanbaoBaseRoWorkTimeByCondition(searchVO));
       result.setTotal(result.getData().size());

       return result;
   }

   /**
    *
    * 삼보 정책기준 감각상각률 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 삼보 정책기준 감각상각률 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoBase/selectSanbaoBaseDepreRates.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoBaseDepreRates(@RequestBody SanbaoBaseSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setData(sanbaoBaseService.selectSanbaoBaseDepreRateByCondition(searchVO));
       result.setTotal(result.getData().size());

       return result;
   }

   /**
    *
    * 등록된 부품 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 등록된 부품 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoBase/selectSanbaoBasePartGrps.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoBasePartGrps(@RequestBody SanbaoBaseSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(sanbaoBaseService.selectSanbaoBasePartGrpByConditionCnt(searchVO));

       if(result.getTotal() != 0){

           result.setData(sanbaoBaseService.selectSanbaoBasePartGrpByCondition(searchVO));
       }

       return result;
   }

   /**
    *
    * 미등록 부품 그룹 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 미등록 부품 그룹 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoBase/selectSanbaoBaseUnregItemGrps.do",method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoBaseUnregItemGrps(@RequestBody SanbaoBaseSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(sanbaoBaseService.selectSanbaoBaseUnregItemGrpByConditionCnt(searchVO));

       if(result.getTotal() != 0){

           result.setData(sanbaoBaseService.selectSanbaoBaseUnregItemGrpByCondition(searchVO));
       }

       return result;
   }

   /**
    *
    * 삼보 기준정책 목록 데이터를 등록/수정한다.
    *
    * @param searchVO - 등록/수정을 포함하는 SanbaoBaseSaveVO
    * @return 삼보 기준정책 목록 데이터를 등록/수정
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoBase/multiSabaoBases.do", method=RequestMethod.POST)
   @ResponseBody
   public boolean multiSabaoBases(@RequestBody SanbaoBaseSaveVO saveVO)throws Exception{

       sanbaoBaseService.multiSabaoBases(saveVO);

       return true;
   }

   /**
    *
    * 미등록 부품 그룹 목록 데이터를 등록한다.
    *
    * @param searchVO - 등록/수정을 포함하는 SanbaoBaseSaveVO
    * @return 미등록 부품 그룹 목록 데이터를 등록
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoBase/insertSabaoBaseItemsGrps.do", method=RequestMethod.POST)
   @ResponseBody
   public boolean insertSabaoBaseItemsGrps(@RequestBody SanbaoBaseSaveVO saveVO)throws Exception{

       sanbaoBaseService.insertSabaoBaseItemsGrps(saveVO);

       return true;
   }

   /**
    *
    * 미등록 부품 그룹 목록 데이터를 등록/수정한다.
    *
    * @param searchVO - 수정을 포함하는 SanbaoBaseSaveVO
    * @return 미등록 부품 그룹 목록 데이터를 수정
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoBase/updateSabaoBaseItemsGrps.do", method=RequestMethod.POST)
   @ResponseBody
   public boolean updateSabaoBaseItemsGrps(@RequestBody SanbaoBaseSaveVO saveVO)throws Exception{

       sanbaoBaseService.updateSabaoBaseItemsGrps(saveVO);

       return true;
   }

}
