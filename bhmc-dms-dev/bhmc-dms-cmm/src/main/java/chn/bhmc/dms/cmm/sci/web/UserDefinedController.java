package chn.bhmc.dms.cmm.sci.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UserDefinedService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.cmm.sci.vo.SurveyReplyVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedDetailVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedMasterVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedSaveVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UserDefinedTargetVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 18.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Controller
public class UserDefinedController extends HController {
    /**
     * 사용자 정의 관리
     */
    @Resource(name="userDefinedService")
    UserDefinedService userDefinedService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 정의 관리  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/userDefined/selectUserDefinedMain.do", method = RequestMethod.GET)
    public String selectUserDefinedMain(Model model) throws Exception {
        return "/cmm/sci/userDefined/selectUserDefinedMain";
    }

    /**
     * 사용자 정의 관리  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/userDefined/selectUserDefinedSubMain.do", method = RequestMethod.GET)
    public String selectUserDefinedSubMain(Model model, UserDefinedSearchVO searchVO) throws Exception {
        List<UserDefinedDetailVO> result = new ArrayList<UserDefinedDetailVO>();

        result = userDefinedService.selectUserDefinedDetailByCondition(searchVO);

        model.addAttribute("sUsrDefReqDocId", searchVO.getsUsrDefReqDocId());
        model.addAttribute("result", result);

        return "/cmm/sci/userDefined/selectUserDefinedSubMain";
    }

    @RequestMapping(value = "/cmm/sci/userDefined/selectUserDefined.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUserDefined(@RequestBody UserDefinedSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(userDefinedService.selectUserDefinedMasterByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(userDefinedService.selectUserDefinedMasterByCondition(searchVO));
        }

        return result;
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/cmm/sci/userDefined/selectUserDefinedSub.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUserDefinedSub(@RequestBody UserDefinedSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        int loop = 0;
        String dlrCd = "";
        String atcRsltCont = "";

        Map<String, Object> map = new HashMap<String, Object>();

        List<Map> list = new ArrayList<Map>();
        List<SurveyReplyVO> surveyAnswerMasterVO = new ArrayList<SurveyReplyVO>();
        List<SurveyReplyVO> surveyAnswerSubVO = new ArrayList<SurveyReplyVO>();

        result.setTotal(userDefinedService.selectSurveyAnswerByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            surveyAnswerMasterVO = userDefinedService.selectSurveyAnswerMasterByCondition(searchVO);

            for (SurveyReplyVO masterItem : surveyAnswerMasterVO) {
                searchVO.setsDlrCd(masterItem.getDlrCd());

                surveyAnswerSubVO = userDefinedService.selectSurveyAnswerSubByCondition(searchVO);

                if ("".equals(dlrCd)) {
                    dlrCd = masterItem.getDlrCd();
                }

                if (!(dlrCd).equals(masterItem.getDlrCd()) ) {
                    dlrCd = masterItem.getDlrCd();
                    list.add(loop, map);
                    map = new HashMap<String, Object>();

                    loop++;
                }

                map.put("rnum", loop + 1);
                map.put("usrDefReqDocId", searchVO.getsUsrDefReqDocId());
                map.put("dlrCd", masterItem.getDlrCd());
                map.put("dlrNm", masterItem.getDlrNm());

                for (SurveyReplyVO subItem : surveyAnswerSubVO) {
                    if (!"".equals(subItem.getAtcEtcInsCont()) && subItem.getAtcEtcInsCont() != null) {
                        if (!"".equals(subItem.getAtcRsltInsCont()) && subItem.getAtcRsltInsCont() != null) {
                            atcRsltCont = subItem.getAtcRsltInsCont() + ", " + subItem.getAtcEtcInsCont();
                        }
                        else {
                            atcRsltCont = subItem.getAtcEtcInsCont();
                        }
                    }
                    else {
                        if (!"".equals(subItem.getAtcRsltInsCont()) && subItem.getAtcRsltInsCont() != null) {
                            atcRsltCont = subItem.getAtcRsltInsCont();
                        }
                        else {
                            atcRsltCont = "";
                        }

                    }

                    map.put("field_" + Integer.toString(subItem.getAtcNo()), atcRsltCont);
                }
            }

            list.add(loop, map);

            result.setData(list);
        }

        return result;
    }

    @RequestMapping(value = "/cmm/sci/userDefined/selectUserDefinedByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public UserDefinedMasterVO selectUserDefinedByKey(@RequestBody UserDefinedSearchVO searchVO) throws Exception {
        UserDefinedMasterVO result = new UserDefinedMasterVO();

        result = userDefinedService.selectUserDefinedMasterByKey(searchVO);

        return result;
    }

    /**
     * 사용자 정의 관리 Detail Popup 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/userDefined/selectSurveyAnswerDetailPopup.do", method = RequestMethod.GET)
    public String selectSurveyAnswerDetailPopup(Model model) throws Exception {
        // 문항 유형
        List<CommonCodeVO> arrPaymentStateTp = commonCodeService.selectCommonCodesByCmmGrpCd("COM040", null, LocaleContextHolder.getLocale().getLanguage());

        model.addAttribute("arrPaymentStateTp", arrPaymentStateTp);

        return "/cmm/sci/userDefined/selectSurveyAnswerDetailPopup";
    }

    @RequestMapping(value = "/cmm/sci/userDefined/selectSurveyAnswerMasterByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public List<SurveyReplyVO> selectSurveyAnswerMasterByCondition(@RequestBody UserDefinedSearchVO searchVO) throws Exception {
        List<SurveyReplyVO> result = new ArrayList<SurveyReplyVO>();

        result = userDefinedService.selectSurveyAnswerMasterByCondition(searchVO);

        return result;
    }

    @RequestMapping(value = "/cmm/sci/userDefined/selectSurveyAnswerSubByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SurveyReplyVO selectSurveyAnswerSubByKey(@RequestBody UserDefinedSearchVO searchVO) throws Exception {
        SurveyReplyVO result = new SurveyReplyVO();

        result = userDefinedService.selectSurveyAnswerSubByKey(searchVO);

        return result;
    }

    /**
     * 사용자 정의 관리  Tab 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/userDefined/selectUserDefinedWrite.do", method = RequestMethod.GET)
    public String selectUserDefinedWrite(Model model
            , @RequestParam(value="usrDefReqDocId", required = false, defaultValue="") String usrDefReqDocId) throws Exception {
        // 문항 유형
        List<CommonCodeVO> arrUserDefinedTp = commonCodeService.selectCommonCodesByCmmGrpCd("COM037", null, LocaleContextHolder.getLocale().getLanguage());

        List<UserDefinedTargetVO> businessList = new ArrayList<UserDefinedTargetVO>();
        UserDefinedTargetVO business = new UserDefinedTargetVO();

        //-------------------------------
        business.setDiviCd("SDPT1");
        business.setDiviNm("사업부1");

        businessList.add(business);

        business = new UserDefinedTargetVO();

        business.setDiviCd("SDPT2");
        business.setDiviNm("사업부2");

        businessList.add(business);
        //-------------------------------

        model.addAttribute("arrUserDefinedTp", arrUserDefinedTp);
        model.addAttribute("businessListTp", businessList);
        model.addAttribute("usrDefReqDocId", usrDefReqDocId);

        return "/cmm/sci/userDefined/selectUserDefinedWrite";
    }

    @RequestMapping(value = "/cmm/sci/userDefined/selectOfficeByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public List<UserDefinedTargetVO> selectOfficeByCondition(@RequestBody UserDefinedSearchVO searchVO) throws Exception {
        List<UserDefinedTargetVO> officeList = new ArrayList<UserDefinedTargetVO>();
        UserDefinedTargetVO office = new UserDefinedTargetVO();

        //-------------------------------
        if ("SDPT1".equals(searchVO.getsDiviCd())) {
            office.setOfficeCd("OFF1");
            office.setOfficeNm("사무소1");

            officeList.add(office);
        }
        else if ("SDPT2".equals(searchVO.getsDiviCd())) {
            office.setOfficeCd("OFF2");
            office.setOfficeNm("사무소2");

            officeList.add(office);

            office = new UserDefinedTargetVO();

            office.setOfficeCd("OFF3");
            office.setOfficeNm("사무소3");

            officeList.add(office);
        }
        //-------------------------------

        return officeList;
    }

    @RequestMapping(value = "/cmm/sci/userDefined/selectUserDefinedTargetList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUserDefinedTargetList(@RequestBody UserDefinedSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        List<UserDefinedTargetVO> userDefinedTargetVO = new ArrayList<UserDefinedTargetVO>();

        userDefinedTargetVO = userDefinedService.selectUserDefinedTargetList(searchVO);

        result.setTotal(userDefinedTargetVO.size());

        if(result.getTotal() != 0){
            result.setData(userDefinedTargetVO);
        }

        return result;
    }

    @RequestMapping(value = "/cmm/sci/userDefined/selectUserDefinedTarget.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUserDefinedTarget(@RequestBody UserDefinedSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(userDefinedService.selectUserDefinedTargetByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(userDefinedService.selectUserDefinedTargetByCondition(searchVO));
        }

        return result;
    }

    @RequestMapping(value = "/cmm/sci/userDefined/selectUserDefinedSurvey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUserDefinedSurvey(@RequestBody UserDefinedSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(userDefinedService.selectUserDefinedDetailByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(userDefinedService.selectUserDefinedDetailByCondition(searchVO));
        }

        return result;
    }

    @RequestMapping(value = "/cmm/sci/userDefined/deleteUserDefined.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteUserDefined(@RequestBody UserDefinedSaveVO saveVO) throws Exception {
        userDefinedService.deleteUserDefinedMaster(saveVO);

        return true;
    }

    @RequestMapping(value = "/cmm/sci/userDefined/multiUserDefined.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiUserDefined(@Validated @RequestBody UserDefinedSaveVO saveVO) throws Exception {
        userDefinedService.multiUserDefined(saveVO);

        return true;
    }

    /**
     * 문항 미리 보기
     * @return
     */
    @RequestMapping(value = "/cmm/sci/userDefined/selectUserDefinedPreviewPopup.do", method = RequestMethod.GET)
    public String selectUserDefinedPreviewPopup(Model model) throws Exception {
        return "/cmm/sci/userDefined/selectUserDefinedPreviewPopup";
    }
}