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
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngSupportService;
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
     * 멤버십 등급설정 서비스
     */
    @Resource(name="membershipGradeMngSupportService")
    MembershipGradeMngSupportService membershipGradeMngSupportService;

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

        MembershipGradeMngSearchVO searchVO = new MembershipGradeMngSearchVO();
        searchVO.setsDlrCd(membershipGradeMngVO.getDlrCd());
        searchVO.setsGradeOrderNo(membershipGradeMngVO.getGradeOrderNo());
        //등록된 기준최근 정보가 존재 한다면
        if(membershipGradeMngSupportService.selectMembershipGradeMngsByConditionCnt(searchVO) > 0){
            //등급순서(은)는 중복될 수 없습니다.
            throw processException("global.info.duplicateCheck", new String[]{messageSource.getMessage("crm.lbl.gradeOrderNo", null, LocaleContextHolder.getLocale())});
        }

        membershipGradeMngVO.setGradeSeq(selectNextMembershipGradeSeq());
        return membershipGradeMngDAO.insertMembershipGradeMng(membershipGradeMngVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService#updateMembershipGradeMng(chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO)
     */
    @Override
    public int updateMembershipGradeMng(MembershipGradeMngVO membershipGradeMngVO) throws Exception {
        MembershipGradeMngSearchVO searchVO = new MembershipGradeMngSearchVO();
        searchVO.setsDlrCd(membershipGradeMngVO.getDlrCd());
        searchVO.setsGradeOrderNo(membershipGradeMngVO.getGradeOrderNo());
        //등록된 기준최근 정보가 존재 한다면
        if(membershipGradeMngSupportService.selectMembershipGradeMngsByConditionCnt(searchVO) > 1){
            //등급순서(은)는 중복될 수 없습니다.
            throw processException("global.info.duplicateCheck", new String[]{messageSource.getMessage("crm.lbl.gradeOrderNo", null, LocaleContextHolder.getLocale())});
        }

        return membershipGradeMngDAO.updateMembershipGradeMng(membershipGradeMngVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService#updateMembershipGradeMng(chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO)
     */
    @Override
    public int updateStdPridMonth(MembershipGradeMngVO membershipGradeMngVO) throws Exception {
        membershipGradeMngVO.setUpdtUsrId(LoginUtil.getUserId());
        return membershipGradeMngDAO.updateStdPridMonth(membershipGradeMngVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService#deleteMembershipGradeMng(chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO)
     */
    @Override
    public int deleteMembershipGradeMng(MembershipGradeMngVO membershipGradeMngVO) throws Exception {

        // 삭제 하는 등급의 멤버십이 있는지 확인후. 있으면 삭제 불가.
        MembershipGradeMngSearchVO searchVO = new MembershipGradeMngSearchVO();
        searchVO.setsDlrCd(membershipGradeMngVO.getDlrCd());
        searchVO.setsGradeSeq(membershipGradeMngVO.getGradeSeq());
        if(membershipGradeMngDAO.selectMembershipGradeJoinCnt(searchVO) > 0){
            //{딜러멤버십등급}은(는) 삭제 할 수 없습니다.
            throw processException("global.err.delete", new String[]{messageSource.getMessage("global.lbl.dlrMbrShipReg", null, LocaleContextHolder.getLocale())});
        };

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
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService#selectMembershipGradeMngByKey(chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO)
     */
    @Override
    public MembershipGradeMngVO selectMembershipGradeMngByKey(MembershipGradeMngSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeMngDAO.selectMembershipGradeMngByKey(searchVO);
    }

}
