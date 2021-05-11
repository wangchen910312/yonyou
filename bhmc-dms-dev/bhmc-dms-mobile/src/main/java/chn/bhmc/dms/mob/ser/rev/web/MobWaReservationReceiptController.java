package chn.bhmc.dms.mob.ser.rev.web;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.ser.rev.service.ReservationReceiptService;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.service.ServiceSettingService;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingSearchVO;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobWaReservationReceiptController.java
 * @Description : Wa 예약현황 컨트롤러
 * @author JongHee Lim
 * @since 2016. 5. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 4.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobWaReservationReceiptController extends HController {
    /**
     * 예약접수 서비스
     */
    @Autowired
    ReservationReceiptService reservationReceiptService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * Bay캘린더 Service
     */
    //@Resource(name="bayCalendarService")
    //BayCalendarService bayCalendarService;

    @Resource(name="bayManageService")
    BayManageService bayManageService;

    /**
     * 서비스운영 마스터 서비스
     */
    @Autowired
    ServiceSettingService serviceSettingService;



    /**
     * 예약접수 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/waSer/rev/reservationReceipt/selectWaReservationReceiptMain.do", method = RequestMethod.GET)
    public String selectWaReservationReceiptMain(Model model,@RequestParam(value="sVinNo", defaultValue="") String sVinNo) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);


        String sysDate2 = DateUtil.getDate("yyyy-MM-dd");
        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 예약구분
        model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));

        // 공통코드 : 예약상태
        model.addAttribute("resvReptStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER015", null, langCd));


        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("sysDate", sysDate2);
        model.addAttribute("preFixId", "RE");
        model.addAttribute("sVinNo", sVinNo);

        ServiceSettingSearchVO searchVO2 = new ServiceSettingSearchVO();
        searchVO2.setsDlrCd(LoginUtil.getDlrCd());
        List<ServiceSettingVO> list2 =  serviceSettingService.selectServiceSettingByCondition(searchVO2);
        if(list2 != null && list2.size() > 0){
            model.addAttribute("resvAvlbStartHm", list2.get(0).getResvAvlbStartHm());
            model.addAttribute("resvAvlbEndHm", list2.get(0).getResvAvlbEndHm());
        }



        return "/mob/waSer/rev/reservationReceipt/selectWaReservationReceiptMain";

    }


    @RequestMapping(value="/mob/waSer/rev/reservationReceipt/selectWaReservationReceiptDtlPopup.do", method = RequestMethod.GET)
    public String selectWaReservationReceiptDtlPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate("yyyy-MM-dd");

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 예약구분
        model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 공통코드 : 예약상태
        model.addAttribute("resvReptStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER015", null, langCd));

        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("sysDate", sysDate);

       return "/mob/waSer/rev/reservationReceipt/selectWaReservationReceiptDtlPopup";

    }



}