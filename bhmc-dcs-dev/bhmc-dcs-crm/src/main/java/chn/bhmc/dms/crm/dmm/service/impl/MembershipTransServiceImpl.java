package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.apr.service.SignService;
import chn.bhmc.dms.cmm.apr.vo.DocLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocLineVO;
import chn.bhmc.dms.cmm.apr.vo.DocSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.CardIssueService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipTransService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipTransDAO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipTransSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipTransVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipTransServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 5. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 2.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Service("membershipTransService")
public class MembershipTransServiceImpl  extends HService implements MembershipTransService{

    /**
     * 멤버십 양도/양수 DAO
     */
    @Resource(name="membershipTransDAO")
    MembershipTransDAO membershipTransDAO;

    /**
     * 공통코드 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 카드발급이력 서비스
     */
    @Resource(name="cardIssueService")
    CardIssueService cardIssueService;

    /**
     * 결재 관리 서비스
     */
    @Resource(name="signService")
    SignService signService;

    @Resource(name="signDocNoIdgenService")
    EgovIdGnrService signDocNoIdgenService;

    /**
     * 보호자원 관리 서비스
     */
    @Resource(name="docService")
    DocService docService;

    /**
     * 시스템 설정 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 포인트 이력 서비스
     */
    @Resource(name="membershipPointHisService")
    MembershipPointHisService membershipPointHisService;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /*
     * @see chn.b hmc.dms.crm.dmm.service.MembershipTransService#insertMembershipTrans(chn.bhmc.dms.crm.dmm.service.MembershipTransVO)
     */
    @Override
    public int insertMembershipTrans(MembershipTransVO membershipTransVO) throws Exception {
        //[TODO] 신청한 건이 있을경우 해당 건들중에 승인이 안된것이 있다면 insert 불가하도록 추가해야함
        // 결재양식, 결재선 조회를 위한 Setting
        String signDocId = membershipTransVO.getSignDocId();

        //1.결재양식 ID가 존재하는지 확인
        DocSearchVO docSchVO = new DocSearchVO();
        docSchVO.setsSignDocId(signDocId);
        List<DocVO> listDocVO = docService.selectDocsByCondition(docSchVO);
        if(listDocVO == null){
            //등록된 결재양식이 존재하지 않습니다.
            throw processException("crm.err.noSignDocId");
        }

        //2. 결재 양식이 존재할 경우 해당 결재양식에 대한 결재선 존재여부 확인
        DocLineSearchVO docLineSchVO = new DocLineSearchVO();
        docLineSchVO.setsSignDocId(signDocId);
        List<DocLineVO> docLineVO = docService.selectDocLinesByCondition(docLineSchVO);
        if(docLineVO == null){
            //등록된 결재양식에 대한 결재선이 존재하지 않습니다.
            throw processException("crm.err.noSignLine");
        }

        //3. signDocNo 생성
        String nextString = signDocNoIdgenService.getNextStringId();

        //4. 멤버십 양도 / 양수 테이블에 Data Insert
        membershipTransVO.setSignDocNo(nextString);
        membershipTransDAO.insertMembershipTrans(membershipTransVO);
        int trsfReceiveSeq = membershipTransVO.getTrsfReceiveSeq(); // selectKey 로 seq 받아온다

        //5. 결재양식에따라 결재선 및 결재정보 data Insert
        SignVO  signVO = new SignVO();
        signVO.setSignDocNo(nextString);
        signVO.setTempSaveYn("N");//임시저장 안함(실제저장함)
        signVO.setReqEmpNo(LoginUtil.getEmpNo());
        signVO.setSignDocId(signDocId);
        signVO.setReqUsrId(LoginUtil.getUserId()); //기안자ID
        signVO.setReqUsrNm(LoginUtil.getUserNm()); //기안자명
        signVO.setRefDocParams("trsfReceiveSeq="+trsfReceiveSeq);//양수양도에서는 양수/양도 신청일련번호로, 특별 포인트는 멤버십 번호로 넣는것으로 한다.
        signVO.setReqTitleNm(listDocVO.get(0).getSignDocNm());
        signVO.setReqCont("");

        for(int i = 0; i < docLineVO.size(); i++ ){

            SignLineVO slineVO = new SignLineVO();
            slineVO.setSignDocNo(nextString);
            slineVO.setSignDocId(signDocId);
            slineVO.setSignDocLineNo(docLineVO.get(i).getSignDocLineNo());
            slineVO.setLastSignYn(docLineVO.get(i).getLastSignYn());
            slineVO.setSignTp(docLineVO.get(i).getSignTp());
            slineVO.setSignUsrNm(docLineVO.get(i).getSignUsrNm());
            slineVO.setSignUsrId(docLineVO.get(i).getSignUsrId());
            slineVO.setSignEmpNo(docLineVO.get(i).getSignEmpNo());

            signVO.addSignLine(slineVO);
        }

        int result = signService.insertSign(signVO);

        return result;
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipTransService#selectMembershipTransMngsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.MembershipTransSearchVO)
     */
    @Override
    public int selectMembershipTransMngsByConditionCnt(MembershipTransSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipTransDAO.selectMembershipTransMngsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipTransService#selectMembershipTransMngsByCondition(chn.bhmc.dms.crm.dmm.vo.MembershipTransSearchVO)
     */
    @Override
    public List<MembershipTransVO> selectMembershipTransMngsByCondition(MembershipTransSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipTransDAO.selectMembershipTransMngsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipTransService#updateMembershipTransPointVal(chn.bhmc.dms.crm.dmm.vo.MembershipTransVO)
     */
    @Override
    public int updateMembershipTransPointVal(MembershipTransVO transVO) throws Exception {
        //[todo] 승인대기일 경우에만 수정 가능하도록 해야함
        return membershipTransDAO.updateMembershipTransPointVal(transVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipTransService#updatePointProcedure(chn.bhmc.dms.crm.dmm.vo.MembershipTransVO)
     */
    @Override
    public int insertTransPointProcedure(MembershipTransVO transVO) throws Exception {
        // TODO Auto-generated method stub
        //1. SIGN_DOC_NO로 조회
        //signService.selectSignByKey(signDocId, signDocNo)
        MembershipTransSearchVO searchVO = new MembershipTransSearchVO();
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setsSignDocNo(transVO.getSignDocNo());
        MembershipTransVO membershipTransVO = membershipTransDAO.selectMembershipTransMngByKey(searchVO);
        String userId = LoginUtil.getUserId();
        String userNm = LoginUtil.getUserNm();


        /*if(membershipTransVO == null){
            //등록된 양도신청이 없습니다.
            throw processException("crm.err.noSignDocId");
        }*/

        // 2.양도자 포인트 이력 차감
        MembershipPointHisVO transHisVO = new MembershipPointHisVO();
        CommonCodeVO transCode = commonCodeService.selectCommonCodeByKey("08","CRM802"); //양도
        transHisVO.setDlrCd(LoginUtil.getDlrCd());//딜러코드
        transHisVO.setMembershipNo(membershipTransVO.getTrsfMembershipNo());//양도자멤버십번호
        transHisVO.setPointTp(transCode.getRemark1()); //포인트 타입(+)
        transHisVO.setPointCd(transCode.getCmmCd()); //포인트 타입(08:양수)
        transHisVO.setOccrPointVal(membershipTransVO.getPointVal());//발생포인트값
        transHisVO.setExtcTargYn("N"); // 소멸대상여부
        transHisVO.setRealTotAmt(membershipTransVO.getPointVal());//최종포인트값
        transHisVO.setCardTpCd("01"); //카드유형코드(포인트식)
        transHisVO.setRegUsrId(userId);
        transHisVO.setPrsnId(userId);

        CardIssueSearchVO cardIssueTransSearchVO = new CardIssueSearchVO();
        cardIssueTransSearchVO.setsCardTpCd("01");//카드유형코드(포인트식)
        cardIssueTransSearchVO.setsMembershipNo(membershipTransVO.getTrsfMembershipNo());
        if (StringUtils.isEmpty(cardIssueTransSearchVO.getsDlrCd())){cardIssueTransSearchVO.setsDlrCd(LoginUtil.getDlrCd());}
        CardIssueVO transCardIssueVO = cardIssueService.selectCardIssueByKey(cardIssueTransSearchVO);
        transHisVO.setCardNo(transCardIssueVO.getCardNo());//카드번호

        membershipPointHisService.updatePointProcedure(transHisVO);

        // 3.양수자 포인트 이력 증감
        MembershipPointHisVO receiveHisVO = new MembershipPointHisVO();
        CommonCodeVO receiveCode = commonCodeService.selectCommonCodeByKey("09","CRM802"); //양수
        receiveHisVO.setDlrCd(LoginUtil.getDlrCd());//딜러코드
        receiveHisVO.setMembershipNo(membershipTransVO.getReceiveMembershipNo());//양도자멤버십번호
        receiveHisVO.setPointTp(receiveCode.getRemark1()); //포인트 타입(-)
        receiveHisVO.setPointCd(receiveCode.getCmmCd()); //포인트 타입(08:양수)
        receiveHisVO.setOccrPointVal(membershipTransVO.getPointVal());//발생포인트값
        receiveHisVO.setExtcTargYn("Y"); // 소멸대상여부
        receiveHisVO.setRealTotAmt(membershipTransVO.getPointVal());//최종포인트값
        //membershipPointHisVO.setCardNo(membershipVO.getCardNo());//카드번호
        receiveHisVO.setCardTpCd("01"); //카드유형코드
        receiveHisVO.setRegUsrId(userId);
        receiveHisVO.setPrsnId(userId);

        CardIssueSearchVO cardIssueReceiveSearchVO = new CardIssueSearchVO();
        cardIssueReceiveSearchVO.setsCardTpCd("01");//카드유형코드(포인트식)
        cardIssueReceiveSearchVO.setsMembershipNo(membershipTransVO.getReceiveMembershipNo());
        if (StringUtils.isEmpty(cardIssueReceiveSearchVO.getsDlrCd())){cardIssueReceiveSearchVO.setsDlrCd(LoginUtil.getDlrCd());}
        CardIssueVO receiveCardIssueVO = cardIssueService.selectCardIssueByKey(cardIssueReceiveSearchVO);
        receiveHisVO.setCardNo(receiveCardIssueVO.getCardNo());//카드번호

        membershipPointHisService.updatePointProcedure(receiveHisVO);

        return 0;
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipTransService#selectMembershipTransMngByKey(chn.bhmc.dms.crm.dmm.vo.MembershipTransSearchVO)
     */
    @Override
    public MembershipTransVO selectMembershipTransMngByKey(MembershipTransSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return membershipTransDAO.selectMembershipTransMngByKey(searchVO);
    }


}
