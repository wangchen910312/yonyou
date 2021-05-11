package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
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
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.CardIssueService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeChgService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipDAO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeHisVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipServiceImpl.java
 * @Description : 멤버십 서비스 구현 클래스
 * @author Kim Hyun Ho
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("membershipService")
public class MembershipServiceImpl extends HService implements MembershipService{

    /**
     * 멤버십 관리 DAO
     */
    @Resource(name="membershipDAO")
    MembershipDAO membershipDAO;

    /**
     * 카드 발급이력 서비스
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
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 멤버십 IdGen 서비스
     */
    @Resource(name="membershipNoIdgenService")
    EgovIdGnrService membershipNoIdgenService;

    /**
     * 멤버십 등급변경 서비스
     */
    @Resource(name="membershipGradeChgService")
    MembershipGradeChgService membershipGradeChgService;

    /**
     * 멤버십 등급이력 서비스
     */
    @Resource(name="membershipGradeHisService")
    MembershipGradeHisService membershipGradeHisService;

    /**
     * 멤버십  포인트이력 서비스
     */
    @Resource(name="membershipPointHisService")
    MembershipPointHisService membershipPointHisService;

    /**
     * 시스템 설정 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 멤버십 등록
     */
    @Override
    public int insertMembership(MembershipVO membershipVO) throws Exception {
            //dataSourceMessageSource.clearCache();
            String userId = LoginUtil.getUserId();
            membershipVO.setMembershipNo(selectNextMembershipNo());
            membershipVO.setRegUsrId(userId);

            CardIssueSearchVO searchVO = new CardIssueSearchVO();
            searchVO.setsDlrCd(membershipVO.getDlrCd());
            searchVO.setsCardTpCd(membershipVO.getCardTpCd());
            searchVO.setsCardNo(membershipVO.getCardNo());

            CardIssueVO cardIssue = cardIssueService.selectCardIssueByKey(searchVO);
            if (cardIssue == null) {
                CardIssueVO cardIssueVO = new CardIssueVO();
                cardIssueVO.setDlrCd(membershipVO.getDlrCd());
                cardIssueVO.setMembershipNo(membershipVO.getMembershipNo());
                cardIssueVO.setCardTpCd(membershipVO.getCardTpCd());
                cardIssueVO.setCardNo(membershipVO.getCardNo());
                cardIssueVO.setUseYn("Y");
                cardIssueVO.setRegUsrId(userId);
                cardIssueService.insertCardIssue(cardIssueVO);
            }else{
                throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("global.lbl.pointCardNo", null, LocaleContextHolder.getLocale())});
            }

            return membershipDAO.insertMembership(membershipVO);

    }

    /**
     * 멤버십 수정
     */
    @Override
    public int updateMembership(MembershipVO membershipVO) throws Exception {
        //dataSourceMessageSource.clearCache();
        String userId = LoginUtil.getUserId();
        membershipVO.setUpdtUsrId(userId);

        int result = 0;

        result = membershipDAO.updateMembership(membershipVO);

        if(result > 0 && !(membershipVO.getGradeCd().equals(membershipVO.getBefGradeCd()))){
            MembershipGradeHisVO membershipGradeHisVO = new MembershipGradeHisVO();
            membershipGradeHisVO.setDlrCd(LoginUtil.getDlrCd());
            membershipGradeHisVO.setMembershipNo(membershipVO.getMembershipNo());
            membershipGradeHisVO.setBefGradeCd(membershipVO.getBefGradeCd());
            membershipGradeHisVO.setAftGradeCd(membershipVO.getGradeCd());
            membershipGradeHisVO.setUseYn("Y");
            membershipGradeHisVO.setRegUsrId(userId);
            membershipGradeHisService.insertMembershipGradeHis(membershipGradeHisVO);
        }

        return result;

    }

    /**
     * 멤버십 등록된 건수 조회
     */
    @Override
    public int selectMembershipsByConditionCnt(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return membershipDAO.selectMembershipsByConditionCnt(searchVO);
    }

    /**
     * 멤버십 등록된 목록 조회
     */
    @Override
    public List<MembershipVO> selectMembershipsByCondition(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}
        return membershipDAO.selectMembershipsByCondition(searchVO);
    }

    /**
     * 멤버십 팝업 등록된 건수 조회
     */
    @Override
    public int selectMembershipsPopupByConditionCnt(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return membershipDAO.selectMembershipsPopupByConditionCnt(searchVO);
    }

    /**
     * 멤버십 팝업 등록된 목록 조회
     */
    @Override
    public List<MembershipVO> selectMembershipsPopupByCondition(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}
        return membershipDAO.selectMembershipsPopupByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectNextPurcOrdNo()
     */
    @Override
    public String selectNextMembershipNo() throws Exception {
        try {
            return membershipNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipService#selectMembershipJoinUserCnt(chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO)
     */
    @Override
    public int selectMembershipJoinUserCnt(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipDAO.selectMembershipJoinUserCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeChgService#multiMembershipGrades(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiMembershipGrades(BaseSaveVO<MembershipGradeChgVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(MembershipGradeChgVO membershipGradeChgVO : obj.getUpdateList()){
            membershipGradeChgVO.setUpdtUsrId(userId);
            if(membershipGradeChgVO.getApplyYn().equals("N")){
                //적용여부가 'N'인것만 update
                int result = membershipGradeChgService.updateApplyYn(membershipGradeChgVO);
                if(result > 0){
                    updateMembershipGradeChg(membershipGradeChgVO);
                }
            }
        }

    }

    /**
     * 멤버십 등급 수정
     */
    @Override
    public int updateMembershipGradeChg(MembershipGradeChgVO membershipGradeChgVO) throws Exception {
        dataSourceMessageSource.clearCache();
        String userId = LoginUtil.getUserId();
        membershipGradeChgVO.setUpdtUsrId(userId);
        int result = membershipDAO.updateMembershipGradeChg(membershipGradeChgVO);
        if(result>0){
            MembershipGradeHisVO membershipGradeHisVO = new MembershipGradeHisVO();
            membershipGradeHisVO.setRegUsrId(userId);
            membershipGradeHisVO.setAftGradeCd(membershipGradeChgVO.getAftGradeCd());
            membershipGradeHisVO.setBefGradeCd(membershipGradeChgVO.getBefGradeCd());
            membershipGradeHisVO.setMembershipNo(membershipGradeChgVO.getMembershipNo());
            membershipGradeHisVO.setDlrCd(membershipGradeChgVO.getDlrCd());
            membershipGradeHisVO.setUseYn("Y");
            membershipGradeHisService.insertMembershipGradeHis(membershipGradeHisVO);
        }
        return result;
    }

    /**
     * 멤버십 등록된 건수 조회
     */
    @Override
    public MembershipVO selectMembershipInfoByKey(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return membershipDAO.selectMembershipInfoByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipService#insertSpecialPoint(chn.bhmc.dms.crm.dmm.vo.MembershipVO)
     */
    @Override
    public int insertSpecialPoint(MembershipVO membershipVO) throws Exception {
        // TODO Auto-generated method stub

      //[TODO] 신청한 건이 있을경우 해당 건들중에 승인이 안된것이 있다면 insert 불가하도록 추가해야함

        // 결재양식, 결재선 조회를 위한 Setting
        String signDocId = membershipVO.getSignDocId();

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

        SignVO  signVO = new SignVO();

        //signDocNo 생성
        String nextString = signDocNoIdgenService.getNextStringId();
        signVO.setSignDocNo(nextString);
        signVO.setTempSaveYn("N");//임시저장 안함(실제저장함)
        signVO.setReqEmpNo(LoginUtil.getEmpNo());
        signVO.setSignDocId(signDocId);
        signVO.setReqUsrId(LoginUtil.getUserId()); //기안자ID
        signVO.setReqUsrNm(LoginUtil.getUserNm()); //기안자명
        /*
         * [TODO]양수양도에서는 양수/양도 신청일련번호로, 특별 포인트는 멤버십 번호로 넣는것으로 한다.
         * 단, 현재 양도신청에서는 양도신청부터 insert해야 해당 key값을 가지고 올수 있다.
         */
        signVO.setRefDocParams("membershipNo="+membershipVO.getMembershipNo());//
        signVO.setReqTitleNm(listDocVO.get(0).getSignDocNm());
        signVO.setReqCont(membershipVO.getSpecialPointReason());

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

        if(result > 0){
        //특별포인트 조회(04 : 특별 포인트)
        CommonCodeVO code = commonCodeService.selectCommonCodeByKey("04","CRM802");
        MembershipPointHisVO membershipPointHisVO = new MembershipPointHisVO();

        membershipPointHisVO.setDlrCd(LoginUtil.getDlrCd());//딜러코드
        membershipPointHisVO.setMembershipNo(membershipVO.getMembershipNo());//멤버십번호
        membershipPointHisVO.setPointTp(code.getRemark1()); //포인트 타입
        membershipPointHisVO.setPointCd(code.getCmmCd()); //포인트 타입
        //membershipPointHisVO.setPointTp(membershipVO.getPointTp()); //포인트 타입(일단 특별포인트는 + 가 없도록 한다. -추후 계산식을 위해서임)
        //membershipPointHisVO.setPointTp("-"); //포인트 타입(일단 특별포인트는 + 가 없도록 한다. -추후 계산식을 위해서임)
        membershipPointHisVO.setOccrPointVal(membershipVO.getOccrPointVal());//발생포인트값
        membershipPointHisVO.setExtcTargYn("Y"); // 소멸대상여부
        //membershipPointHisVO.setExtcTargPointVal(membershipVO.getOccrPointVal());//소멸대상포인트값
        membershipPointHisVO.setRealTotAmt(membershipVO.getOccrPointVal());//최종포인트값
        membershipPointHisVO.setCardNo(membershipVO.getCardNo());//카드번호
        membershipPointHisVO.setCardTpCd("01"); //카드유형코드

        //멤버십 포인트를 등록한다.
            result = membershipPointHisService.insertSpecialPoint(membershipPointHisVO);
        }

        return result;
    }
}
