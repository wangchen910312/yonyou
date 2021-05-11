package chn.bhmc.dms.mob.api.crm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinHistoryService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinHistorySupportService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinSupportService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;
import chn.bhmc.dms.mob.api.crm.service.CrmCommonCodeService;
import chn.bhmc.dms.mob.api.crm.service.CrmCustomerInfoOutBoundService;
import chn.bhmc.dms.mob.api.crm.vo.CommonCodeVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipController.java
 * @Description : 블루멤버십 가입컨트롤러
 * @author Kim Hyun Ho
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@RestController
@RequestMapping(value = "api/crm/bluemembershipjoin")
@Api("CRM蓝缤入会相关接口")
public class BlueMembershipJoinApi extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="CrmcommonCodeService")
    CrmCommonCodeService CrmcommonCodeService;

    /**
     * 블루멤버십 관리 서비스
     */
    @Resource(name="blueMembershipJoinService")
    BlueMembershipJoinService blueMembershipJoinService;

    /**
     * 블루멤버십 인증 히스토리 서비스
     */
    @Resource(name="blueMembershipJoinHistoryService")
    BlueMembershipJoinHistoryService blueMembershipJoinHistoryService;

    /**
     * 블루멤버십 인증 히스토리 서비스 Support
     */
    @Resource(name="blueMembershipJoinHistorySupportService")
    BlueMembershipJoinHistorySupportService blueMembershipJoinHistorySupportService;

    /**
     * 블루멤버십 관리 서비스
     */
    @Resource(name="blueMembershipJoinSupportService")
    BlueMembershipJoinSupportService blueMembershipJoinSupportService;

    /**
     * 블루멤버십 인터페이스 서비스
     */
    @Resource(name="blueMembershipInterfaceService")
    BlueMembershipInterfaceService blueMembershipInterfaceService;

    /**
     * 서비스 공통용 고객및차량정보 구현 서비스
     */
    @Resource(name="vehOfCustInfoService")
    VehOfCustInfoService vehOfCustInfoService;

    /**
     * 서비스 공통용 고객및차량정보 구현 서비스
     */
    @Resource(name="CrmcustomerInfoOutBoundService")
    CrmCustomerInfoOutBoundService CrmcustomerInfoOutBoundService;

    /**
     * 블루멤버십 가입신청 메인 화면을 출력한다.
     * @return
     */
    @ApiOperation("会员管理-蓝缤入会页面跳转URL")
    @RequestMapping(value = "/selectBlueMembershipJoinMain.do", method = RequestMethod.GET)
    public BaseJSON selectSatisFactionScoreMngMain(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //고객유형
        model.addAttribute("custTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        //신분증유형
        model.addAttribute("mathDocTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        //블루멤버십 회원등급 유형
        model.addAttribute("mLevelList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));
        //비용지불포인트취득상태
        model.addAttribute("paymentAccessPointsStatusList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM811", null, langCd));
        
        BaseJSON baseJSON=new BaseJSON();
        baseJSON.setResult(model);
        return baseJSON;
    }


    /**
     * 블루멤버십 가입 가능 목록을 출력한다.
     * 고객조회 팝업 > 차량정보 기준 고객 목록 > 보유고객 && 개인 && !타사차량 && 신분증유형 : 신분증 인 목록.
     * @return
     */
    @ApiOperation("蓝缤入会列表查询")
    @RequestMapping(value = "/selectBlueMembershipJoin.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectBlueMembershipJoin(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(CrmcustomerInfoOutBoundService.selectCustomerAndCarInfoByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(CrmcustomerInfoOutBoundService.selectCustomerAndCarInfoByCondition(searchVO));
        }

        BaseJSON baseJSON=new BaseJSON();
        baseJSON.setResult(result);
        return baseJSON;
    }



    /**
     * 블루멤버십 가입신청 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectBlueMembershipJoinPopup.do", method = RequestMethod.GET)
    public BaseJSON selectBlueMembershipJoinPopup(Model model,HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("membershipNo",  request.getParameter("membershipNo"));
        model.addAttribute("cardNo",  request.getParameter("cardNo"));
        model.addAttribute("cardTpCd",  request.getParameter("cardTpCd"));

        //고객유형
        List<CommonCodeVO> listCcVO = CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd);
        List<CommonCodeVO> custTpList = new ArrayList<CommonCodeVO>();
        for(int i=0;i<listCcVO.size();i++){
            if(listCcVO.get(i).getRemark2() != null && listCcVO.get(i).getRemark2() != ""){
                CommonCodeVO custTp = new CommonCodeVO();
                custTp.setCmmGrpCd(listCcVO.get(i).getCmmGrpCd());
                custTp.setCmmGrpCdNm(listCcVO.get(i).getCmmGrpCdNm());
                custTp.setCmmCd(listCcVO.get(i).getCmmCd());
                custTp.setCmmCdNm(listCcVO.get(i).getCmmCdNm());
                custTpList.add(custTp);
            }
        }
        model.addAttribute("custTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));       // 고객유형

        //신분증유형
        model.addAttribute("mathDocTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        //블루멤버십 회원등급 유형
        model.addAttribute("mLevelList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));

        //블루멤버십 가입 지불 금액
        model.addAttribute("amountList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM809", null, langCd));


        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        
        
        BaseJSON baseJSON=new BaseJSON();
        baseJSON.setResult(model);
        return baseJSON;
    }


    /**
     * 블루멤버십 회원 포인트 조회
     * @return Map<String,Object> - 완료
     */
    @RequestMapping(value="/selectMemberUserintegralInfo.do",method=RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectMemberUserintegralInfo(@RequestBody chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO paramVO) throws Exception{

        //회원 포인트 조회
    	chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoRapVO dataVO = blueMembershipJoinSupportService.selectMemberUserIntegralInfo(paramVO);
        
        BaseJSON baseJSON=new BaseJSON();
        baseJSON.setResult(dataVO);
        return baseJSON;
    }
    
    /**
     * 딜러 One Click회원 가입 (딜러에서 차량을 구매하고 가입하는 경우, 보통 버튼 Click한번으로 가입이 됨으로 OneClick회원가입이라 한다.)
     * @return Map<String,Object> - 완료
     */
    @RequestMapping(value="/crm/dmm/blueMembershipJoin/insertCreateMembership.do",method=RequestMethod.POST)
    @ResponseBody
    public BaseJSON insertCreateMembership(@RequestBody chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO joinVO) throws Exception{
        //Map<String,Object> result = new HashMap<String,Object>();

        //딜러 One Click회원 가입 (딜러에서 차량을 구매하고 가입하는 경우, 보통 버튼 Click한번으로 가입이 됨으로 OneClick회원가입이라 한다.)
        HashMap<String, String> hm = blueMembershipJoinService.insertCreateMembership(joinVO);
        BaseJSON baseJSON=new BaseJSON();
        baseJSON.setResult(hm);
        return baseJSON;
    }
}
