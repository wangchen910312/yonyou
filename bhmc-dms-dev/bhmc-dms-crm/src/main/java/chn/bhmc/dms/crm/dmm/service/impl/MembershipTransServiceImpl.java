package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.ArrayList;
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
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.CardIssueService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipTransService;
import chn.bhmc.dms.crm.dmm.service.PackageCouponHisService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipTransDAO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipTransSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipTransVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;
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
     * 포인트 이력 서비스
     */
    @Resource(name="membershipPointHisSupportService")
    MembershipPointHisSupportService membershipPointHisSupportService;

    /**
     * 쿠폰 이력 서비스
     */
    @Resource(name="packageCouponHisService")
    PackageCouponHisService packageCouponHisService;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;


    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipService")
    MembershipService membershipService;

    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipSupportService")
    MembershipSupportService membershipSupportService;


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
        docLineSchVO.setsDlrCd(LoginUtil.getDlrCd());
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

        List<SignLineVO> insertedSignLienVO = new ArrayList<SignLineVO>();
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

            //signVO.setInsertedSignLienVO(slineVO)
            insertedSignLienVO.add(slineVO);
            //insertedSignLienVO.s
        }
        signVO.setSignLines(insertedSignLienVO);

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
        CommonCodeVO transCode = commonCodeService.selectCommonCodeByKey("CRM802","08"); //양도
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
        CommonCodeVO receiveCode = commonCodeService.selectCommonCodeByKey("CRM802","08"); //양수
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
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipTransDAO.selectMembershipTransMngByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipTransService#insertMembershipTransTemp(chn.bhmc.dms.crm.dmm.vo.MembershipTransVO)
     */
    @Override
    public int insertMembershipTransTemp(MembershipTransVO membershipTransVO) throws Exception {
      //[TODO] 신청한 건이 있을경우 해당 건들중에 승인이 안된것이 있다면 insert 불가하도록 추가해야함
        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();
        membershipTransVO.setDlrCd(dlrCd);
        membershipTransVO.setRegUsrId(userId);

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
        docLineSchVO.setsDlrCd(dlrCd);
        docLineSchVO.setsSignDocId(signDocId);
        List<DocLineVO> docLineVO = docService.selectDocLinesByCondition(docLineSchVO);
        if(docLineVO == null){
            //등록된 결재양식에 대한 결재선이 존재하지 않습니다.
            throw processException("crm.err.noSignLine");
        }

        //3. signDocNo 생성
        String nextString = signDocNoIdgenService.getNextStringId();

        //4. 멤버십 양도 / 양수 테이블에 Data Insert

        //4-1 멤버십 양도 /양수 마스터 테이블에 Insert(CR_0806T)
        membershipTransVO.setSignDocNo(nextString);
        membershipTransDAO.insertMembershipTrans(membershipTransVO);
        int trsfReceiveSeq = membershipTransVO.getTrsfReceiveSeq(); // selectKey 로 seq 받아온다.

        //4-2 포인트 값을 디테일 테이블에 insert
        if(membershipTransVO.getPointVal() > 0){
            MembershipTransVO savePointVO = new MembershipTransVO();
            savePointVO.setDlrCd(membershipTransVO.getDlrCd());
            savePointVO.setTrsfReceivePointVal(membershipTransVO.getPointVal());//양도양수포인트값
            savePointVO.setTrsfReceiveSeq(trsfReceiveSeq);
            savePointVO.setTrsfReceiveTpCd("01");// 01: 포인트, 02: 충전금액 , 03 :쿠폰
            savePointVO.setTrsfCardTpCd("01");//01 : 포인트형 , 02 : 충전형
            savePointVO.setRegUsrId(userId);

            //[TODO]포인트 남은금액보다 차감금액이 크면 승인은 나지만 양도못하도록 해야함
            MembershipSearchVO pointSchVO = new MembershipSearchVO();
            pointSchVO.setsDlrCd(membershipTransVO.getDlrCd());                    //딜러코드
            pointSchVO.setsMembershipNo(membershipTransVO.getTrsfMembershipNo());  //양도자 멤버십번호
            MembershipVO member = membershipSupportService.selectMembershipInfoByKey(pointSchVO);
            if(member.getLastPointVal() < membershipTransVO.getPointVal()){
                //양도할수 있는 포인트가 모자랍니다.
                throw processException("crm.err.emptyPoint");
            }

            membershipTransDAO.insertMembershipTransTemp(savePointVO);
        }

        //4-3 (충전금액 Insert)for문 돌면서 멤버십 테이블에 Insert(CR_0817T)
        MembershipTransVO saveMtVO = new MembershipTransVO();
        MembershipPointHisSearchVO amtSchVO = new MembershipPointHisSearchVO();
        for(MembershipTransVO mtVO : membershipTransVO.getInsertCardIssue()){
            saveMtVO.setDlrCd(mtVO.getDlrCd());//딜러코드
            saveMtVO.setTrsfReceiveSeq(trsfReceiveSeq);//양도양수일련번호
            saveMtVO.setTrsfReceiveTpCd("02");// 01: 포인트, 02: 충전금액 , 03 :쿠폰
            saveMtVO.setReceiveCardNo(membershipTransVO.getReceiveCardNo());//양수카드번호
            saveMtVO.setTrsfCardNo(mtVO.getTrsfCardNo());//양도카드번호
            saveMtVO.setTrsfCardTpCd(mtVO.getTrsfCardTpCd());//01 : 포인트형 , 02 : 충전형
            saveMtVO.setTrsfReceiveCardAmt(mtVO.getTrsfReceiveCardAmt());//양도양수카드금액
            saveMtVO.setRegUsrId(userId);

            //[TODO]양도차감 금액이 현재 남아있는 금액보다 크면 승인는 나지만 양도 못하도록 해야함
            amtSchVO = new MembershipPointHisSearchVO();
            amtSchVO.setsDlrCd(mtVO.getDlrCd());                  //딜러코드
            amtSchVO.setsMembershipNo(membershipTransVO.getTrsfMembershipNo());//양도자 멤버십번호
            amtSchVO.setsCardNo(mtVO.getTrsfCardNo());            //양도자 카드번호
            amtSchVO.setsCardTpCd("02");                            //02:충전카드
            MembershipPointHisVO memberAmt = membershipPointHisSupportService.selectRealTotAmtInfoByKey(amtSchVO);
            //20170602 REAL_TOT_AMT 컬럼 용도 변경 ( 수납금액 입력 ) 함에 따라 최종 금액은 LAST_POINT_VAL을 사용한다.
            if(memberAmt.getLastPointVal() < mtVO.getTrsfReceiveCardAmt()){
                //양도할수 있는 금액이 모자랍니다.
                throw processException("crm.err.emptyRealTotAmt");
            }

            membershipTransDAO.insertMembershipTransTemp(saveMtVO);
        }

        //4-4 (양도 쿠폰 Insert)for문 돌면서 멤버십 디테일 테이블에 Insert(CR_0817T)
        saveMtVO = new MembershipTransVO();

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

        List<SignLineVO> insertedSignLienVO = new ArrayList<SignLineVO>();
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

            //signVO.setInsertedSignLienVO(slineVO)
            insertedSignLienVO.add(slineVO);
            //insertedSignLienVO.s
        }
        signVO.setSignLines(insertedSignLienVO);

        int result = signService.insertSign(signVO);

        return result;
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipTransService#insertTransApprovalProcess(chn.bhmc.dms.cmm.apr.vo.SignLineVO)
     */
    @Override
    public int insertTransApprovalProcess(String signDocNo) throws Exception {
        /*
         * 1. 넘어온 signVO로부터 SignDocId를 구하여 멤버십 양도양수 마스터테이블의 데이터 조회
         * 2. 데이터를 조회하여 for문 돌림
         * 3. 01:포인트, 02:충전금액, 03:쿠폰
         */

        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();

      //1. SIGN_DOC_NO로 조회
        //signService.selectSignByKey(signDocId, signDocNo)
        MembershipTransSearchVO searchVO = new MembershipTransSearchVO();
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(dlrCd);}
        searchVO.setsSignDocNo(signDocNo);
        List<MembershipTransVO> transVO = membershipTransDAO.selectMembershipTransApproveCondition(searchVO);

        int exceptionTrsfReceiveSeq = 0;//Exception처리시 사용할 양도/양수 key
        String exceptionTrsfReceiveTpCd = "";//Exception처리시 사용할 message key

        if(transVO == null){
            //등록된 양도신청이 없습니다.
            throw processException("crm.err.noSignDocId");
        }else{
            try {
                for(MembershipTransVO saveVO : transVO){
                    exceptionTrsfReceiveSeq = saveVO.getTrsfReceiveSeq();
                    exceptionTrsfReceiveTpCd = saveVO.getTrsfReceiveTpCd();
                    if(saveVO.getTrsfReceiveTpCd().equals("01")){    //양도포인트 계산
                        //[TODO]포인트 남은금액보다 차감금액이 크면 승인은 나지만 양도못하도록 해야함
                        MembershipSearchVO pointSchVO = new MembershipSearchVO();
                        pointSchVO.setsDlrCd(saveVO.getDlrCd());                    //딜러코드
                        pointSchVO.setsMembershipNo(saveVO.getTrsfMembershipNo());  //양도자 멤버십번호
                        MembershipVO member = membershipSupportService.selectMembershipInfoByKey(pointSchVO);
                        if(member.getLastPointVal() < saveVO.getTrsfReceivePointVal()){
                            MembershipTransVO errVO = new MembershipTransVO();
                            errVO.setTrsfReceiveSeq(exceptionTrsfReceiveSeq);
                            errVO.setTrsfFailYn("Y");
                            //양도할 수 있는 포인트가 모자랍니다.
                            errVO.setTrsfFailReasonCont(messageSource.getMessage("crm.err.emptyPoint", null , LocaleContextHolder.getLocale()));
                            membershipTransDAO.updateMembershipTransErr(errVO);
                        }else{

                            // 양도자 포인트 이력 차감 셋팅
                            MembershipPointHisVO transHisVO = new MembershipPointHisVO();
                            CommonCodeVO transCode = commonCodeService.selectCommonCodeByKey("CRM802","08"); //양도
                            transHisVO.setDlrCd(saveVO.getDlrCd());                      //딜러코드
                            transHisVO.setMembershipNo(saveVO.getTrsfMembershipNo());       //양도자멤버십번호
                            transHisVO.setPointTp(transCode.getRemark1());                  //포인트 타입(+)
                            transHisVO.setPointCd(transCode.getCmmCd());                    //포인트 타입(08:양수)
                            transHisVO.setOccrPointVal(saveVO.getTrsfReceivePointVal() );   //발생포인트값
                            transHisVO.setExtcTargYn("N");                                  //소멸대상여부
                            transHisVO.setRealTotAmt(saveVO.getTrsfReceivePointVal());      //최종포인트값
                            transHisVO.setCardTpCd("01");                                   //카드유형코드(포인트식)
                            transHisVO.setRegUsrId(userId);
                            transHisVO.setPrsnId(userId);

                            CardIssueSearchVO cardIssueTransSearchVO = new CardIssueSearchVO();
                            cardIssueTransSearchVO.setsCardTpCd("01");                              //카드유형코드(포인트식)
                            cardIssueTransSearchVO.setsMembershipNo(saveVO.getTrsfMembershipNo());  //양도자 멤버십 번호
                            if (StringUtils.isEmpty(cardIssueTransSearchVO.getsDlrCd())){cardIssueTransSearchVO.setsDlrCd(dlrCd);}

                            //양도자 포인트 카드번호 조회
                            CardIssueVO transCardIssueVO = cardIssueService.selectCardIssueByKey(cardIssueTransSearchVO);
                            transHisVO.setCardNo(transCardIssueVO.getCardNo());//카드번호

                            //차감 프로시저
                            membershipPointHisService.updatePointProcedure(transHisVO);

                            // 양수자 포인트 이력 증감 셋팅
                            MembershipPointHisVO receiveHisVO = new MembershipPointHisVO();
                            CommonCodeVO receiveCode = commonCodeService.selectCommonCodeByKey("CRM802","09"); //양수
                            receiveHisVO.setDlrCd(saveVO.getDlrCd());                       //딜러코드
                            receiveHisVO.setMembershipNo(saveVO.getReceiveMembershipNo());  //양도자멤버십번호
                            receiveHisVO.setPointTp(receiveCode.getRemark1());              //포인트 타입(-)
                            receiveHisVO.setPointCd(receiveCode.getCmmCd());                //포인트 타입(08:양수)
                            receiveHisVO.setOccrPointVal(saveVO.getTrsfReceivePointVal());  //발생포인트값
                            receiveHisVO.setExtcTargYn("Y");                                //소멸대상여부
                            receiveHisVO.setRealTotAmt(saveVO.getTrsfReceivePointVal());    //최종포인트값
                            receiveHisVO.setCardTpCd("01");                                 //카드유형코드(포인트식)
                            receiveHisVO.setRegUsrId(userId);
                            receiveHisVO.setPrsnId(userId);

                            //양수자 포인트카드 번호 조회
                            CardIssueSearchVO cardIssueReceiveSearchVO = new CardIssueSearchVO();
                            cardIssueReceiveSearchVO.setsCardTpCd("01");                                //카드유형코드(포인트식)
                            cardIssueReceiveSearchVO.setsMembershipNo(saveVO.getReceiveMembershipNo()); //양수자 멤버십번호
                            if (StringUtils.isEmpty(cardIssueReceiveSearchVO.getsDlrCd())){cardIssueReceiveSearchVO.setsDlrCd(dlrCd);}
                            CardIssueVO receiveCardIssueVO = cardIssueService.selectCardIssueByKey(cardIssueReceiveSearchVO);
                            receiveHisVO.setCardNo(receiveCardIssueVO.getCardNo());//카드번호

                            //증감 프로시저
                            membershipPointHisService.updatePointProcedure(receiveHisVO);
                        }

                    }
                    if(saveVO.getTrsfReceiveTpCd().equals("02")){    //양도 충전금액 계산

                        //[TODO]양도차감 금액이 현재 남아있는 금액보다 크면 승인는 나지만 양도 못하도록 해야함
                        MembershipPointHisSearchVO amtSchVO = new MembershipPointHisSearchVO();
                        amtSchVO.setsDlrCd(saveVO.getDlrCd());                  //딜러코드
                        amtSchVO.setsMembershipNo(saveVO.getTrsfMembershipNo());//양도자 멤버십번호
                        amtSchVO.setsCardNo(saveVO.getTrsfCardNo());            //양도자 카드번호
                        amtSchVO.setsCardTpCd("02");                            //02:충전카드
                        MembershipPointHisVO memberAmt = membershipPointHisSupportService.selectRealTotAmtInfoByKey(amtSchVO);
                        //20170602 REAL_TOT_AMT 컬럼 용도 변경 ( 수납금액 입력 ) 함에 따라 최종 금액은 LAST_POINT_VAL을 사용한다.
                        if(memberAmt.getLastPointVal() < saveVO.getTrsfReceiveCardAmt()){
                            //양도할수 있는 금액이 모자랍니다.
                            MembershipTransVO errVO = new MembershipTransVO();
                            errVO.setTrsfReceiveSeq(exceptionTrsfReceiveSeq);
                            errVO.setTrsfFailYn("Y");
                            //양도할 수 있는 금액이 모자랍니다.
                            errVO.setTrsfFailReasonCont(messageSource.getMessage("crm.err.emptyRealTotAmt", null , LocaleContextHolder.getLocale()));
                            membershipTransDAO.updateMembershipTransErr(errVO);
                        }else{

                            //양도자 충전카드 차감 셋팅
                            MembershipPointHisVO trsfPointHisVO = new MembershipPointHisVO();

                            trsfPointHisVO.setRegUsrId(userId);
                            trsfPointHisVO.setDlrCd(dlrCd);
                            trsfPointHisVO.setMembershipNo(saveVO.getTrsfMembershipNo());  //양도자 멤버십번호
                            trsfPointHisVO.setCardTpCd(saveVO.getTrsfCardTpCd());          //양도카드형태
                            trsfPointHisVO.setCardNo(saveVO.getTrsfCardNo());              //양도자 카드번호
                            trsfPointHisVO.setOccrPointVal(saveVO.getTrsfReceiveCardAmt());//양도발생금액
                            CommonCodeVO transCode = commonCodeService.selectCommonCodeByKey("CRM802","08"); //양도
                            trsfPointHisVO.setPointTp(transCode.getRemark1());                  //포인트 타입(-)
                            trsfPointHisVO.setPointCd(transCode.getCmmCd());                    //포인트 타입(08:양도)
                            // 충전이력에 등록
                            membershipPointHisSupportService.insertRechargeAmtProc(trsfPointHisVO);

                            //양수자 충전카드 증감 셋팅
                            MembershipPointHisVO receivePointHisVO = new MembershipPointHisVO();
                            receivePointHisVO.setRegUsrId(userId);
                            receivePointHisVO.setDlrCd(saveVO.getDlrCd());
                            receivePointHisVO.setMembershipNo(saveVO.getReceiveMembershipNo());//양수자 멤버십번호
                            receivePointHisVO.setCardTpCd(saveVO.getTrsfCardTpCd());           //양수카드형태
                            receivePointHisVO.setCardNo(saveVO.getReceiveCardNo());            //양수자 카드번호
                            receivePointHisVO.setOccrPointVal(saveVO.getTrsfReceiveCardAmt()); //양수발생금액
                            CommonCodeVO receiveCode = commonCodeService.selectCommonCodeByKey("CRM802","09"); //양수
                            receivePointHisVO.setPointTp(receiveCode.getRemark1());                  //포인트 타입(+)
                            receivePointHisVO.setPointCd(receiveCode.getCmmCd());                    //포인트 타입(09:양수)
                            // 충전이력에 등록
                            membershipPointHisSupportService.insertRechargeAmtProc(receivePointHisVO);
                        }

                    }

                }

            } catch (Exception e) {
                // TODO: handle exception
                MembershipTransVO errVO = new MembershipTransVO();
                errVO.setTrsfReceiveSeq(exceptionTrsfReceiveSeq);
                errVO.setTrsfFailYn("Y");
                //양도,양수 승인후 처리중 에러가 발생했습니다.
                errVO.setTrsfFailReasonCont(messageSource.getMessage("crm.err.transApproveError", null , LocaleContextHolder.getLocale()));
                membershipTransDAO.updateMembershipTransErr(errVO);
            }
        }

        return 0;
    }



























}
