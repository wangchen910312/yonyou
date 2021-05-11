package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipGradeMngDAO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeMngServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("membershipGradeMngService")
public class MembershipGradeMngServiceImpl extends HService implements MembershipGradeMngService{

    /**
     * 멤버십 등급설정 관리 DAO
     */
    @Resource(name="membershipGradeMngDAO")
    MembershipGradeMngDAO membershipGradeMngDAO;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 멤버십 등급설정 IdGen 서비스
     */
    @Resource(name="membershipGradeSeqIdgenService")
    EgovIdGnrService membershipGradeSeqIdgenService;

    /**
     * 멤버십 등급정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeMngSearchVO
     * @return
     */
    @Override
    public int selectMembershipGradeMngsByConditionCnt(MembershipGradeMngSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeMngDAO.selectMembershipGradeMngsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 멤버십 등급정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeMngSearchVO
     * @return 조회 목록
     */
    @Override
    public List<MembershipGradeMngVO> selectMembershipGradeMngsByCondition(MembershipGradeMngSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeMngDAO.selectMembershipGradeMngsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService#multiMembershipGradeMngs(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiMembershipGradeMngs(BaseSaveVO<MembershipGradeMngVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        int stdPridMonth = 0;

        for(MembershipGradeMngVO membershipGradeMngVO : obj.getInsertList()){
            membershipGradeMngVO.setRegUsrId(userId);
            membershipGradeMngVO.setDlrCd(dlrCd);
            stdPridMonth = membershipGradeMngVO.getStdPridMonth();
            insertMembershipGradeMng(membershipGradeMngVO);
        }

        for(MembershipGradeMngVO membershipGradeMngVO : obj.getUpdateList()){
            membershipGradeMngVO.setUpdtUsrId(userId);
            updateMembershipGradeMng(membershipGradeMngVO);
            stdPridMonth = membershipGradeMngVO.getStdPridMonth();
        }

        //기준최근을 모두 update하기 위함
        if(obj.getUpdateList().size() > 0 || obj.getInsertList().size() > 0){
            MembershipGradeMngVO mngVO = new MembershipGradeMngVO();
            mngVO.setStdPridMonth(stdPridMonth);
            if (StringUtils.isEmpty(mngVO.getDlrCd()))mngVO.setDlrCd(LoginUtil.getDlrCd());
            updateStdPridMonth(mngVO);
        }

        for(MembershipGradeMngVO membershipGradeMngVO : obj.getDeleteList()){
            deleteMembershipGradeMng(membershipGradeMngVO);
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService#insertMembershipGradeMng(chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO)
     */
    @Override
    public int insertMembershipGradeMng(MembershipGradeMngVO membershipGradeMngVO) throws Exception {
        membershipGradeMngVO.setGradeSeq(selectNextMembershipGradeSeq());
        return membershipGradeMngDAO.insertMembershipGradeMng(membershipGradeMngVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService#updateMembershipGradeMng(chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO)
     */
    @Override
    public int updateMembershipGradeMng(MembershipGradeMngVO membershipGradeMngVO) throws Exception {
        return membershipGradeMngDAO.updateMembershipGradeMng(membershipGradeMngVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService#updateMembershipGradeMng(chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO)
     */
    @Override
    public int updateStdPridMonth(MembershipGradeMngVO membershipGradeMngVO) throws Exception {
        return membershipGradeMngDAO.updateStdPridMonth(membershipGradeMngVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService#deleteMembershipGradeMng(chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO)
     */
    @Override
    public int deleteMembershipGradeMng(MembershipGradeMngVO membershipGradeMngVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return membershipGradeMngDAO.deleteMembershipGradeMng(membershipGradeMngVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectNextPurcOrdNo()
     */
    @Override
    public String selectNextMembershipGradeSeq() throws Exception {
        try {
            return membershipGradeSeqIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("global.lbl.gradeSeq", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService#updateMembershipGradeMng(chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO)
     */
    @Override
    public String selectStdPridMonthByKey(MembershipGradeMngSearchVO membershipGradeMngSearchVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return membershipGradeMngDAO.selectStdPridMonthByKey(membershipGradeMngSearchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService#selectGradeCodesByCondition(chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO)
     */
    @Override
    public List<MembershipGradeMngVO> selectGradeCodesByCondition(MembershipGradeMngSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeMngDAO.selectGradeCodesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService#callProcedures(chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO)
     */
    @Override
    public MembershipGradeMngVO callProcedures(MembershipGradeMngSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return membershipGradeMngDAO.callProcedures(searchVO);
    }

}
