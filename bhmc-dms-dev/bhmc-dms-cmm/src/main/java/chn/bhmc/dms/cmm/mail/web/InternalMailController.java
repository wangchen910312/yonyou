package chn.bhmc.dms.cmm.mail.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.mail.service.InternalMailService;
import chn.bhmc.dms.cmm.mail.vo.InternalMailReceiverSaveVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailReceiverSearchVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailReceiverVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailSaveVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailSearchVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InternalMailController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 2.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Controller
public class InternalMailController extends HController {
    /**
     * 내부 메일 현황 서비스
     */
    @Resource(name="internalMailService")
    InternalMailService internalMailService;

    @Resource(name="intMailIdgenService")
    EgovIdGnrService intMailIdgenService;

    /**
     * 내부 메일 현황 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/selectInternalMailMain.do", method = RequestMethod.GET)
    public String selectInternalMailMain(Model model) throws Exception {
        List<InternalMailReceiverVO> result = new ArrayList<InternalMailReceiverVO>();
        InternalMailReceiverSearchVO searchVO = new InternalMailReceiverSearchVO();

        result = internalMailService.selectInternalMailAreaByCondition(searchVO);

        model.addAttribute("internalMailArea", result);

        return "/cmm/mail/internalMail/selectInternalMailMain";
    }

    /**
     * 내부 메일 현황 조회
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/selectInternalMailByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInternalMailByCondition(@RequestBody InternalMailSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(internalMailService.selectInternalMailByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(internalMailService.selectInternalMailByCondition(searchVO));
        }

        return result;
    }

    /**
     * 내부 메일 현황 조회 - Detail
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/selectInternalMailByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public InternalMailVO selectInternalMailByKey(@RequestBody InternalMailSearchVO searchVO) throws Exception {
        InternalMailVO result = new InternalMailVO();

        result = internalMailService.selectInternalMailByKey(searchVO);

        return result;
    }

    /**
     * 지역 List
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/selectInternalMailAreaByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public List<InternalMailReceiverVO> selectInternalMailAreaByCondition(@RequestBody InternalMailReceiverSearchVO searchVO) throws Exception {

        List<InternalMailReceiverVO> result = new ArrayList<InternalMailReceiverVO>();

        result = internalMailService.selectInternalMailAreaByCondition(searchVO);

        return result;
    }

    /**
     * Dealer List
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/selectInternalMailDealerByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public List<InternalMailReceiverVO> selectInternalMailDealerByCondition(@RequestBody InternalMailReceiverSearchVO searchVO) throws Exception {
        List<InternalMailReceiverVO> result = new ArrayList<InternalMailReceiverVO>();

        result = internalMailService.selectInternalMailDealerByCondition(searchVO);

        return result;
    }

    /**
     * Role List - Grid
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/selectInternalMailReceiverRoleByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInternalMailReceiverRoleByCondition(@RequestBody InternalMailReceiverSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(internalMailService.selectInternalMailReceiverRoleByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(internalMailService.selectInternalMailReceiverRoleByCondition(searchVO));
        }

        return result;
    }

    /**
     * User List - Grid
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/selectInternalMailReceiverUsrByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInternalMailReceiverUsrByCondition(@RequestBody InternalMailReceiverSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(internalMailService.selectInternalMailReceiverUsrByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(internalMailService.selectInternalMailReceiverUsrByCondition(searchVO));
        }

        return result;
    }

    /**
     * 역할 관리 Popup
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/selectInternalMailRolePopup.do", method = RequestMethod.GET)
    public String selectInternalMailRolePopup(Model model) throws Exception {
        return "/cmm/mail/internalMail/selectInternalMailRolePopup";
    }

    /**
     * 사용자 Popup
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/selectInternalMailUserPopup.do", method = RequestMethod.GET)
    public String selectInternalMailUserPopup(Model model) throws Exception {
        return "/cmm/mail/internalMail/selectInternalMailUserPopup";
    }

    /**
     * Role List - Popup
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/selectInternalMailRoleByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInternalMailRoleByCondition(@RequestBody InternalMailReceiverSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(internalMailService.selectInternalMailRoleByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(internalMailService.selectInternalMailRoleByCondition(searchVO));
        }

        return result;
    }

    /**
     * User List - Popup
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/selectInternalMailUsrByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInternalMailUsrByCondition(@RequestBody InternalMailReceiverSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(internalMailService.selectInternalMailUsrByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(internalMailService.selectInternalMailUsrByCondition(searchVO));
        }

        return result;
    }

    /**
     * 삭제
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/deleteInternalMail.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteInternalMail(@RequestBody InternalMailVO internalMailVO) throws Exception {
        internalMailService.deleteInternalMail(internalMailVO);

        return true;
    }

    /**
     * 삭제
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/multiDeleteInternalMail.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiDeleteInternalMail(@RequestBody InternalMailSaveVO saveVO) throws Exception {
        internalMailService.multiDeleteInternalMail(saveVO);

        return true;
    }

    /**
     * Mail 발송
     * @return
     */
    @RequestMapping(value = "/cmm/mail/internalMail/multiInternalMail.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean InsertInternalMail(@RequestBody InternalMailReceiverSaveVO internalMailReceiverSaveVO) throws Exception {
        String resvDt = internalMailReceiverSaveVO.getInternalMailVO().getResvDt();
        String userId = LoginUtil.getUserId();

        InternalMailVO internalMailVO = new InternalMailVO();

        internalMailVO.setIntMailId(intMailIdgenService.getNextStringId());
        internalMailVO.setIntMailTitleNm(internalMailReceiverSaveVO.getInternalMailVO().getIntMailTitleNm());
        internalMailVO.setIntMailCont(internalMailReceiverSaveVO.getInternalMailVO().getIntMailCont());
        internalMailVO.setResvSendYn(internalMailReceiverSaveVO.getInternalMailVO().getResvSendYn());
        internalMailVO.setFileDocNo(internalMailReceiverSaveVO.getInternalMailVO().getFileDocNo());
        internalMailVO.setRegUsrId(userId);
        internalMailVO.setUpdtUsrId(userId);

        if (!"".equals(internalMailReceiverSaveVO.getInternalMailVO().getResvDt())) {
            internalMailVO.setResvDt(resvDt.substring(0, 10).replace("-", ""));
            internalMailVO.setResvHm(resvDt.substring(11, 16) + ":00");
        }
        else {
            internalMailVO.setResvDt("");
            internalMailVO.setResvHm("");
        }

        internalMailService.insertInternalMail(internalMailVO, internalMailReceiverSaveVO);
        internalMailService.insertInternalMailSummary(internalMailVO);

        /*InternalMailSummaryServiceImpl internalMailSummaryService = new InternalMailSummaryServiceImpl(internalMailVO);
        new Thread(internalMailSummaryService).start();*/

        return true;
    }
}