package chn.bhmc.dms.mob.ser.ro.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import chn.bhmc.dms.ser.ro.vo.PreCheckVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.ser.ro.service.PreCheckService;
import chn.bhmc.dms.ser.ro.vo.PreCheckSaveVO;
import chn.bhmc.dms.ser.svi.service.PDIChkAtcService;
import chn.bhmc.dms.ser.svi.vo.PDIChkAtcSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobSaPreCheckController.java
 * @Description : 사전점검현황 Controller
 * @author JongHee Lim
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobSaPreCheckController  extends HController{

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="preCheckService")
    PreCheckService preCheckService;

    @Resource(name="pDIChkAtcService")
    PDIChkAtcService pDIChkAtcService;

    /**
     * 사전점검 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/waSer/ro/preCheck/selectPreCheckMain.do", method = RequestMethod.GET)
    public String selectPreCheckMain(Model model
            ,@RequestParam(value="diagDocNo", defaultValue="") String diagDocNo
            ,@RequestParam(value="vinNo", defaultValue="") String vinNo) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 공통코드 : 예약구분
        model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
        model.addAttribute("sysDate", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("preFixId", "PC");

        //차량 점검 항목 구분
        PDIChkAtcSearchVO searchVO = new PDIChkAtcSearchVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        searchVO.setsCarChkCd("01");
        model.addAttribute("pdiChkList", pDIChkAtcService.selectPDIChkAtcByCondition(searchVO));
        //model.addAttribute("carTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER910"));
        //입고점검유형
        model.addAttribute("carAcptTp", commonCodeService.selectCommonCodesByCmmGrpCd("SER911", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 공통코드 : 예약상태
        model.addAttribute("resvStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 견적유형
        model.addAttribute("estTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        // 성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));

        model.addAttribute("diagDocNo",  diagDocNo );
        model.addAttribute("vinNo",  vinNo);

        return "/mob/waSer/ro/preCheck/selectPreCheckMain";

    }

    /**
    *
    * 사전점검 항목 정보를 등록한다.
    *
    * @param saveVO - 사전점검 항목 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/mob/waSer/ro/preCheck/multiPreChecks.do", method=RequestMethod.POST)
   @ResponseBody
   public String multiPreChecks(@Validated @RequestBody PreCheckSaveVO saveVO,HttpServletRequest request)throws Exception{
       String diagDocNo = "";

       Device device = DeviceUtils.getCurrentDevice(request);
       String deviceType = "";
      // PreCheckVO preCheckVO = new PreCheckVO();
       if (device.isNormal()) {
           deviceType = "pc";
         //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
           /*} else if (device.isMobile()) {
               deviceType = "mob";
           } else if (device.isTablet()) {*/
           }else{
               deviceType = "pad";
         //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
       }
      // preCheckVO.setUserEqui(deviceType);
       diagDocNo = preCheckService.multiPreChecks(saveVO,deviceType);

       return diagDocNo;
   }



}
