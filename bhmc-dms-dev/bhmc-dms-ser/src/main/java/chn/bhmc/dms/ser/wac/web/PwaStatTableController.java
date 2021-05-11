package chn.bhmc.dms.ser.wac.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.wac.service.PwaStatTableService;
import chn.bhmc.dms.ser.wac.vo.PwaStatTableSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaStatTableController.java
 * @Description : PWA 통계표 컨트롤러
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
public class PwaStatTableController extends HController{

    @Resource(name="pwaStatTableService")
    PwaStatTableService pwaStatTableService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
    *
    * PWA 통계표 화면 메인
    *
    * @param model
    * @return PWA 통계표 화면
    * @throws Exception
    *
    */
   @RequestMapping(value="/ser/wac/pwaReq/selectPwaStatTableMain.do" , method=RequestMethod.GET)
   public String selectPwaStatTableMain(Model model)throws Exception{

       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       model.addAttribute("sPwaToDt", DateUtil.getDate(dateFormat));
       model.addAttribute("sPwaFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );

       return "/ser/wac/pwaReq/selectPwaStatTableMain";

   }

   /**
    *
    * PWA 통계표 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaStatTableSearchVO
    * @return PWA 통계표 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/selectPwaStatTable.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectPwaStatTable(@RequestBody PwaStatTableSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(pwaStatTableService.selectPwaStatTableByConditionCnt(searchVO));
       if(result.getTotal() != 0){
           result.setData(pwaStatTableService.selectPwaStatTableByCondition(searchVO));
       }

       return result;

   }
}