package chn.bhmc.dms.ser.wac.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
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
import chn.bhmc.dms.ser.wac.service.ClaimReqDateService;
import chn.bhmc.dms.ser.wac.vo.ClaimReqDateSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimRequestController.java
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
public class ClaimReqDateController extends HController{

    @Resource(name="claimReqDateService")
    ClaimReqDateService claimReqDateService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
    *
    * 일자별 클레임 요청현황 화면 메인
    *
    * @param model
    * @return 일자별 클레임 요청현황 화면
    * @throws Exception
    *
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimReqDateMain.do" , method=RequestMethod.GET)
   public String selectClaimReqDateMain(Model model, HttpServletRequest request)throws Exception{

       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

       Device device = DeviceUtils.getCurrentDevice(request);

       model.addAttribute("dlrCd", LoginUtil.getDlrCd());

       model.addAttribute("sClaimConfirmToDt", DateUtil.getDate(dateFormat));
       model.addAttribute("sClaimConfirmFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );

       //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
       //model.addAttribute("isTablet", device.isTablet());
       model.addAttribute("isTablet", device.isTablet()||device.isMobile());
       //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

       return "/ser/wac/claimReq/selectClaimReqDateMain";

   }

   /**
    *
    * 일자별 클레임 요청현황 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimReqDateMasters.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimReqDateMasters(@RequestBody ClaimReqDateSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(claimReqDateService.selectClaimReqDateMastersByConditionCnt(searchVO));
       if(result.getTotal() != 0){
           result.setData(claimReqDateService.selectClaimReqDateMastersByCondition(searchVO));
       }

       return result;

   }

   /**
   *
   * 일자별 클레임 요청 상세현황 목록 데이터를 조회한다.
   *
   * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
   * @return 클레임 요청 목록 데이터
   * @throws Exception
   */
  @RequestMapping(value="/ser/wac/claimReq/selectClaimReqDateDetails.do" , method=RequestMethod.POST)
  @ResponseBody
  public SearchResult selectClaimReqDateDetails(@RequestBody ClaimReqDateSearchVO searchVO)throws Exception{

      SearchResult result = new SearchResult();

      result.setTotal(claimReqDateService.selectClaimReqDateDetailsByConditionCnt(searchVO));
      if(result.getTotal() != 0){
          result.setData(claimReqDateService.selectClaimReqDateDetailsByCondition(searchVO));
      }

      return result;

  }
}