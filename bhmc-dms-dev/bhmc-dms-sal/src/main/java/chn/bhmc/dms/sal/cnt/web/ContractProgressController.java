package chn.bhmc.dms.sal.cnt.web;


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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.sal.cnt.service.ContractMntService;

import chn.bhmc.dms.crm.cmm.service.CrmCommonService;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cnt.service.ContractProgressService;
import chn.bhmc.dms.sal.cnt.vo.*;

/**
 * 계약종합조회
 *
 * @author Kim Jin Suk
 * @since 2016. 10. 24.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.10.24         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/cnt/contractProgress")
public class ContractProgressController extends HController {

    /**
     * 계약종합조회 서비스
     */
    @Resource(name="contractProgressService")
    ContractProgressService contractProgressService;

    /**
     * 계약 서비스
     */
    @Resource(name="contractMntService")
    ContractMntService contractMntService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 권한 관리 서비스
     */
    @Resource(name="roleMappingService")
    RoleMappingService roleMappingService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

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
     * 계약품의 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectContractProgressMain.do", method = RequestMethod.GET)
    public String selectContractProgressMain(Model model,
            @RequestParam(value="orderNo",    required = false, defaultValue="") String orderNo
            ) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("lang", langCd);


        //DateUtil
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);

        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        //int day = cal.get(Calendar.DATE);
        //cal.set(year, month, day+1, 00, 00, 00);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);

        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
            cal.set(year, month, lastDay, 00, 00, 00);
        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);

        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), dateFormat);
        String threeMonthBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), dateFormat);
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);
        model.addAttribute("lastDay", lastDate);
        model.addAttribute("nextMonthDay", nextMonthDay);
        model.addAttribute("threeMonthDay", threeMonthBf);

        // 딜러명 조회
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  dealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
        }else{
            model.addAttribute("dlrNm", "");
        }

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
        // VIEW-D-10636 : 화면 : 판매>계약관리>계약종합조회
        if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10636", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)){
            saleAdminYn = "Y";
        }
        //전체 조회권한
        model.addAttribute("saleAdminYn", saleAdminYn);

        // 계약유형 : SAL003
        //model.addAttribute("contractTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));

        // 계약상태 : SAL002
        model.addAttribute("contractStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        // 할인레벨 SAL156
        model.addAttribute("dcLvlCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL156", null, langCd));

        // 여부(Y/N) COM020
        //model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        // 채널유형 COM072
        model.addAttribute("dstbChnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM072", null, langCd));
        // 2급딜러
        model.addAttribute("lvTwoDlrDs", contractMntService.selectlvTwoDlrOrgsByCondition(LoginUtil.getDlrCd()));

        model.addAttribute("orderNo", orderNo);           // 계약번호로 조회

        return "/sal/cnt/contractProgress/selectContractProgressMain";
    }

    /**
     * 계약 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectContractProgressSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectContractProgressSearch(@RequestBody ContractReSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(contractProgressService.selectContractProgressByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contractProgressService.selectContractProgressByCondition(searchVO));
        }

        return result;
    }

}