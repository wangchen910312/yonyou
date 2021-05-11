package chn.bhmc.dms.cmm.apr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler;
import chn.bhmc.dms.cmm.apr.service.ApprovalCallbackResolver;
import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.apr.service.SignService;
import chn.bhmc.dms.cmm.apr.service.dao.SignDAO;
import chn.bhmc.dms.cmm.apr.vo.SignLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineVO;
import chn.bhmc.dms.cmm.apr.vo.SignSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.core.util.LoginUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 결재문서 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Insignation) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("signService")
public class SignServiceImpl extends HService implements SignService {

    /**
     * 결재문서 관리 DAO
     */
	@Resource(name="signDAO")
	SignDAO signDAO;

	/**
	 * 결재양식 관리 서비스
	 */
	@Resource(name="docService")
	DocService docService;

	/**
	 * 결재처리 콜백 리졸버
	 */
	@Resource(name="approvalCallbackResolver")
	ApprovalCallbackResolver approvalCallbackResolver;

	/**
	 * 결재문서번호 생성 서비스
	 */
    @Resource(name="signDocNoIdgenService")
    EgovIdGnrService signDocNoIdgenService;

    /**
     * 알림메세지 서비스
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

	/**
	 * {@inheritDoc}
	 */
    @Override
    public int insertSign(SignVO signVO) throws Exception {
        String signDocNo =  signVO.getSignDocNo();
        signVO.setRegUsrId(LoginUtil.getUserId());
        signVO.setSignStatCd("01"); //결재문서의 결재진행상태를 대기(01)로 설정한다.

        int signDocLineNo = 0;

        for(SignLineVO signLineVO : signVO.getSignLines()){
            signLineVO.setSignDocNo(signDocNo);
            signLineVO.setSignDocLineNo(++signDocLineNo);
            signLineVO.setSignStatCd("01"); //결재선 결재진행상태 대기(01)
            signLineVO.setSignRsltCd("01"); //결재선 결재처리유형 미결(01)

            if(signDocLineNo == 1) {
                //결재문서 결제선의 첫번째 결재권자의 결재진행상태를  진행(02)으로 설정한다
                signLineVO.setSignStatCd("02");

                //## DCS 는 알람기능을 사용하지 않는다. 20170425 이인문 주석처리. ## 결재양식의 결재상신 알람이 'Y'인 경우 결재상신 알림을 발송한다.
                //sendSignRequestAlarm(signVO.getSignDocId(), signLineVO.getSignUsrId(), signLineVO.getSignUsrNm());
            }

            insertSignLine(signLineVO);
        }

        return signDAO.insertSign(signVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateSign(SignVO signVO) throws Exception {
        String signDocNo =  signVO.getSignDocNo();
        signVO.setRegUsrId(LoginUtil.getUserId());

        //결재문서의 결재선을 삭제한다.
        deleteSignLineBySignDocNo(signDocNo);

        int signDocLineNo = 0;

        for(SignLineVO signLineVO : signVO.getSignLines()){
            signLineVO.setSignDocNo(signDocNo);
            signLineVO.setSignDocLineNo(++signDocLineNo);
            signLineVO.setSignStatCd("01"); //결재선 결재진행상태 대기(01)
            signLineVO.setSignRsltCd("01"); //결재선 결재처리유형 미결(01)

            if(signDocLineNo == 1) {
                //결재문서 결제선의 첫번째 결재권자의 결재진행상태를  진행(02)으로 설정한다
                signLineVO.setSignStatCd("02");

                //## DCS 는 알람기능을 사용하지 않는다. 20170425 이인문 주석처리. ## 결재양식의 결재상신 알람이 'Y'인 경우 결재상신 알림을 발송한다.
                //sendSignRequestAlarm(signVO.getSignDocId(), signLineVO.getSignUsrId(), signLineVO.getSignUsrNm());
            }
            insertSignLine(signLineVO);
        }

        return signDAO.updateSign(signVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteSign(String signDocNo) throws Exception {
        SignVO signVO = signDAO.selectSignByKey(signDocNo);

        if(!"01".equals(signVO.getSignStatCd())){
            throw processException("global.err.delete.processedSign");
        }

        signDAO.deleteSignLineBySignDocNo(signDocNo);
        return signDAO.deleteSign(signDocNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public SignVO selectSignByKey(String signDocNo) throws Exception {
        return signDAO.selectSignByKey(signDocNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<SignVO> selectSignsByCondition(SignSearchVO searchVO) throws Exception {
        return signDAO.selectSignsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectSignsByConditionCnt(SignSearchVO searchVO) throws Exception {
        return signDAO.selectSignsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertSignLine(SignLineVO signLineVO) throws Exception {
        SignLineVO obj = selectSignLineByKey(signLineVO.getSignDocNo(), signLineVO.getSignDocLineNo());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return signDAO.insertSignLine(signLineVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateSignLine(SignLineVO signLineVO) throws Exception {

        SignLineVO signLineVO2 = selectSignLineByKey(signLineVO.getSignDocNo(), signLineVO.getSignDocLineNo());
        signLineVO2.setSignDocId(signLineVO.getSignDocId());
        signLineVO2.setSignCont(signLineVO.getSignCont());
        signLineVO2.setSignStatCd(signLineVO.getSignStatCd());
        signLineVO2.setSignRsltCd(signLineVO.getSignRsltCd());


        //결재선이 최종결재 인 경우
        //1.결재선의 결재정보를 변경한다
        //2.결재문서의 결재진행상태를 변경한다.
        //2-1.결재선의 결재처리 유형이 반려(02) 인 경우 결재문서의 결재진행상태를 반려(04)로 변경한다.
        //2-2.결재선의 결재처리 유형이 합이(03)/결재(04) 인 경우 결재문서의 결재진행상태를 완료(03)로 변경한다.
        if("Y".equals(signLineVO2.getLastSignYn())){
            signDAO.updateSignLine(signLineVO2);

            //결재선의 결재처리 유형이 반려(02) 인 경우 결재문서의 결재진행상태를 반려(04)로 변경한다.
            if("02".equals(signLineVO2.getSignRsltCd())){
                signDAO.updateSignDocSignStatCd(signLineVO2.getSignDocNo(), "04");

            //결재선의 결재처리 유형이 합이(03)/결재(04) 인 경우 결재문서의 결재진행상태를 완료(03)로 변경한다.
            }else{
                signDAO.updateSignDocSignStatCd(signLineVO2.getSignDocNo(), "03");
            }


        //결재선이 최종결재가 아닌 경우
        //1.결재선의 결재정보를 변경한다.
        //3.결재문서의 결재진행상태를 변경한다.
        //3-1.결재선의 결재처리 유형이 반려(02) 인 경우 결재문서의 결재진행상태를 반려(04)로 변경한다.
        //3-2.결재선의 결재처리 유형이 합의(03)/결재(04) 인 경우 결재문서의 결재진행상태를 진행(02)으로 변경한다.
        //3-3.결재선의 결재처리 유형이 합의(03)/결재(04) 인 경우 결재선의 다음 결재자의 결재진행상태를 진행(02)으로 변경한다.
        }else{
            signDAO.updateSignLine(signLineVO2);

            //결재선의 결재처리 유형이 반려(02) 인 경우 결재문서의 결재진행상태를 반려(04)로 변경한다.
            if("02".equals(signLineVO2.getSignRsltCd())){
                signDAO.updateSignDocSignStatCd(signLineVO2.getSignDocNo(), "04");

            //결재선의 결재처리 유형이 합의(03)/결재(04) 인 경우 결재문서의 결재진행상태를 진행(02)으로 변경한다.
            }else{
                signDAO.updateSignDocSignStatCd(signLineVO2.getSignDocNo(), "02");

                //다음 결재라인을 조회한다.
                //SignLineVO nextSignLineVO = signDAO.selectNextSignLine(signLineVO2.getSignDocNo(), signLineVO2.getSignDocLineNo());

                //## DCS 는 알람기능을 사용하지 않는다. 20170425 이인문 주석처리. ## 결재양식의 결재상신 알람이 'Y'인 경우 결재상신 알림을 발송한다.
                //sendSignRequestAlarm(nextSignLineVO.getSignDocId(), nextSignLineVO.getSignUsrId(), nextSignLineVO.getSignUsrNm());

                signDAO.updateNextSignDocLineSignStatCdToProcess(signLineVO2.getSignDocNo(), signLineVO2.getSignDocLineNo());
            }
        }

        SignVO signVO = selectSignByKey(signLineVO2.getSignDocNo());
        signVO.setSignLine(signLineVO2);

        //결재처리 콜백
        List<ApprovalCallbackHandler> handlers = approvalCallbackResolver.resolve(signLineVO2.getSignDocId());
        for(ApprovalCallbackHandler handler : handlers){
            try{
                handler.callback(signVO);
            }catch(Exception e){
                log.error(e.getMessage());
                throw processException(e.getMessage());
            }
        }

        return 1;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteSignLine(SignLineVO signLineVO) throws Exception {
        return signDAO.deleteSignLine(signLineVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteSignLineBySignDocNo(String signDocNo) throws Exception {
        return signDAO.deleteSignLineBySignDocNo(signDocNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public SignLineVO selectSignLineByKey(String signDocNo, int signDocLineNo) throws Exception {
        return signDAO.selectSignLineByKey(signDocNo, signDocLineNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public SignLineVO selectSignLineBySignUsrId(String signDocNo, String signUsrId) throws Exception {
        return signDAO.selectSignLineBySignUsrId(signDocNo, signUsrId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<SignLineVO> selectSignLinesByCondition(SignLineSearchVO searchVO) throws Exception {
        return signDAO.selectSignLinesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<SignVO> selectSignsRequestByCondition(SignSearchVO searchVO) throws Exception {
        return signDAO.selectSignsRequestByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectSignsRequestByConditionCnt(SignSearchVO searchVO) throws Exception {
        return signDAO.selectSignsRequestByConditionCnt(searchVO);
    }

    /**
     * 결재상신 알람을 발송한다.
     * @param signDocNo 결재양식 문서번호
     * @param signUsrId 결재자 ID
     * @param signUsrNm 결재자명
     * @throws Exception
     *
    private void sendSignRequestAlarm(String signDocNo, String signUsrId, String signUsrNm) throws Exception {
    	DocVO docVO = docService.selectDocByKey(signDocNo);

    	//결재양식의 결재상신 알람이 'Y'인 경우 결재상신 알림을 발송한다.
    	if("Y".equals(docVO.getSignAlrtYn())){
    		 NotificationMessageContext context = new NotificationMessageContext();
    	     context.getVelocityContext().put("signDocNm", docVO.getSignDocNm());

    	     List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
    	     NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
    	     targetVO.setUsrId(signUsrId);
    	     targetVO.setUsrNm(signUsrNm);
    	     targetVO.setMesgTmplTpList("P,W");

    	     targetUsers.add(targetVO);

    	     notificationMessageService.sendNotificationMessage(Constants.SYS_CD_DLR, "COM-0001", LoginUtil.getDlrCd(), context, targetUsers);
    	}
    }
    */
}