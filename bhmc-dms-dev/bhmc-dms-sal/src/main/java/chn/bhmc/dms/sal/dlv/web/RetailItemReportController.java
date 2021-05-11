package chn.bhmc.dms.sal.dlv.web;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.sal.dlv.service.RetailItemReportService;
import chn.bhmc.dms.sal.dlv.vo.RetailItemReportSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;

/**
 * <pre>
 * 소매 명세 레포트
 * </pre>
 *
 * @ClassName   : RetailItemReportController.java
 * @Description : 소매 명세 레포트
 * @author chibeom.song
 * @since 2016. 10. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.10.25.    chibeom.song     최초 생성
 * </pre>
 */
@Controller
@RequestMapping(value = "/sal/dlv/retailItemReport")
public class RetailItemReportController extends HController {
    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * 소매 명세 레포트
     */
    @Resource(name="retailItemReportService")
    RetailItemReportService retailItemReportService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * 판매고문 관리 서비스
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;

    /**
     * 소매 명세 레포트 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectRetailItemReportMain.do", method = RequestMethod.GET)
    public String selectRetailItemReportMain(Model model) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        String sysDate      = DateUtil.getDate(dateFormat);
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String beforeOneWeek  = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("toDay", sysDate);
        model.addAttribute("beforeOneWeek", beforeOneWeek);

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 판매인 여부
        String saleEmpYn = "N";
        List<UserVO> saleEmpList = crmCommonService.selectMngScIdListByCondition();
        for(UserVO usVO : saleEmpList){
            if(usVO.getUsrId().equals(LoginUtil.getUserId())){
                saleEmpYn = "Y";
            }
        }
        model.addAttribute("saleEmpYn", saleEmpYn);
        model.addAttribute("saleEmpDSInfo", saleEmpList);

        String saleAdminYn = "N";
        // VIEW-D-10658 : 화면 : 판매>계약출고관리>소매명세
        if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10658", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)){
            saleAdminYn = "Y";
        }
        //전체 조회권한
        model.addAttribute("saleAdminYn", saleAdminYn);

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

     // 是否(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        
        // 주문유형 : SAL137 딜러용
        model.addAttribute("ordTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));

        //조작상태
        model.addAttribute("kmoptDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL187", null, langCd));

        //조회조건
        model.addAttribute("srchKndDs", commonCodeService.selectCommonCodesByCmmGrpCd("SAL215", null, langCd));

        //조작유형
        model.addAttribute("srchTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SAL214", null, langCd));

        return "/sal/dlv/retailItemReport/selectRetailItemReportMain";
    }

    /**
     * 소매 명세 레포트결과 조회 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RetailItemReportSearchVO
     * @return
     */
    @RequestMapping(value = "/selectRetailItemReport.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRetailItemReport(@RequestBody RetailItemReportSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        if(searchVO.getsRadioTp().equals("H")){
            result.setTotal(retailItemReportService.selectRetailItemReportByConditionCnt(searchVO));

            if(result.getTotal() != 0){
                result.setData(retailItemReportService.selectRetailItemReportByCondition(searchVO));
            }
        }else{
            result.setTotal(retailItemReportService.selectRetailItemLastReportByConditionCnt(searchVO));

            if(result.getTotal() != 0){
                result.setData(retailItemReportService.selectRetailItemLastReportByCondition(searchVO));
            }
        }

        return result;
    }

    /**
     * 소매 명세 레포트결과 상세조회 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RetailItemReportSearchVO
     * @return
     */
    @RequestMapping(value = "/selectRetailItemDetailReport.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRetailItemDetailReport(@RequestBody RetailItemReportSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(retailItemReportService.selectRetailItemReportDetailConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(retailItemReportService.selectRetailItemReportDetailCondition(searchVO));
        }
        return result;
    }
}
