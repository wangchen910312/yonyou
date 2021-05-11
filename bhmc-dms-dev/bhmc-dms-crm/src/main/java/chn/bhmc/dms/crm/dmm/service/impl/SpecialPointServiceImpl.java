package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
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
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.SpecialPointService;
import chn.bhmc.dms.crm.dmm.service.dao.SpecialPointDAO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;
import chn.bhmc.dms.crm.dmm.vo.SpecialPointSearchVO;
import chn.bhmc.dms.crm.dmm.vo.SpecialPointVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecialPointServiceImpl.java
 * @Description : 특별포인트 구현 클래스
 * @author Kim Hyun Ho
 * @since 2016. 8. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 1.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("specialPointService")
public class SpecialPointServiceImpl extends HService implements SpecialPointService {

    /**
     * 특별포인트 DAO
     */
    @Resource(name="specialPointDAO")
    SpecialPointDAO specialPointDAO;

    /**
     * 보호자원 관리 서비스
     */
    @Resource(name="docService")
    DocService docService;

    @Resource(name="signDocNoIdgenService")
    EgovIdGnrService signDocNoIdgenService;

    /**
     * 결재 관리 서비스
     */
    @Resource(name="signService")
    SignService signService;

    /**
     * 시스템 설정 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 공통코드 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.SpecialPointService#insertSpecialPoint(chn.bhmc.dms.crm.dmm.vo.SpecialPointVO)
     */
    @Override
    public int insertSpecialPoint(SpecialPointVO saveVO) throws Exception {
        return specialPointDAO.insertSpecialPoint(saveVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.SpecialPointService#selectSpecialPointByKey(chn.bhmc.dms.crm.dmm.vo.SpecialPointSearchVO)
     */
    @Override
    public SpecialPointVO selectSpecialPointByKey(SpecialPointSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return specialPointDAO.selectSpecialPointByKey(searchVO);
    }

    /** 20160905 / 이인문
     * 조회 조건에 해당하는 특별포인트 관리 총 갯수를 조회한다.
     * @param SpecialPointSearchVO - 딜러코드, 멤버쉽번호
     * @return
     */
    @Override
    public int selectSpecialPointsByConditionCnt(SpecialPointSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return specialPointDAO.selectSpecialPointsByConditionCnt(searchVO);
    }

    /** 20160905 / 이인문
     * 조회 조건에 해당하는 특별포인트 정보를 조회한다.
     * @param SpecialPointSearchVO - 딜러코드, 멤버쉽번호
     * @return 조회 목록
     */
    @Override
    public List<SpecialPointVO> selectSpecialPointsByCondition(SpecialPointSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return specialPointDAO.selectSpecialPointsByCondition(searchVO);
    }


    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipService#insertSpecialPoint(chn.bhmc.dms.crm.dmm.vo.MembershipVO)
     */
    @Override
    public int insertSpecialPoint(MembershipVO membershipVO) throws Exception {

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
        docLineSchVO.setsDlrCd(LoginUtil.getDlrCd());
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

        List<SignLineVO> insertedSignLienVO = new ArrayList<SignLineVO>() ;
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

            insertedSignLienVO.add(slineVO);
        }
        signVO.setSignLines(insertedSignLienVO);

        int result = signService.insertSign(signVO);

        if(result > 0){

            /*
             // 바로 포인트 지급이 아닌 임시테이블로 insert한다.
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

             */

            CommonCodeVO code = commonCodeService.selectCommonCodeByKey("CRM802",membershipVO.getPointCd());

            if ( StringUtils.isEmpty(code.getRemark1()))  {
                // {포인트 유형}을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.pointTp", null, LocaleContextHolder.getLocale())});
            }

            SpecialPointVO spVO = new SpecialPointVO();
            spVO.setDlrCd(LoginUtil.getDlrCd());//딜러코드
            spVO.setMembershipNo(membershipVO.getMembershipNo());//멤버십번호
            spVO.setProvidePointVal(membershipVO.getOccrPointVal());//부여포인트값
            spVO.setProvideReasonCont(membershipVO.getSpecialPointReason());//부여사유내용
            spVO.setSignDocNo(nextString);//결재문서번호
            spVO.setPointCd(membershipVO.getPointCd());//포인트유형
            spVO.setPointTp(code.getRemark1());//포인트유형
            spVO.setRegUsrId(LoginUtil.getUserId());

            result = specialPointDAO.insertSpecialPoint(spVO); //특별포인트 임시저장
        }

        return result;
    }


}
