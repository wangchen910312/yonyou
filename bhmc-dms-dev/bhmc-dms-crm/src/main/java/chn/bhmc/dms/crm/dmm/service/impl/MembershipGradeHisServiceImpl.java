package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeHisService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipGradeHisDAO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeHisVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeHisServiceImpl.java
 * @Description : 멤버십 등급이력 구현 클래스
 * @author Kim Hyun Ho
 * @since 2016. 4. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 29.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Service("membershipGradeHisService")
public class MembershipGradeHisServiceImpl extends HService implements MembershipGradeHisService{

    /**
     * 멤버십 등급이력 관리 DAO
     */
    @Resource(name="membershipGradeHisDAO")
    MembershipGradeHisDAO membershipGradeHisDAO;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeHisService#insertMembershipGradeHis(chn.bhmc.dms.crm.dmm.vo.MembershipGradeHisVO)
     */
    @Override
    public int insertMembershipGradeHis(MembershipGradeHisVO membershipGradeHisVO) throws Exception {
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        membershipGradeHisVO.setRegUsrId(userId);
        membershipGradeHisVO.setDlrCd(dlrCd);
        return membershipGradeHisDAO.insertMembershipGradeHis(membershipGradeHisVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeHisService#selectMembershipGradeHissByCondition(chn.bhmc.dms.crm.dmm.vo.MembershipGradeHisSearchVO)
     */
    @Override
    public List<MembershipGradeHisVO> selectMembershipGradeHissByCondition(MembershipGradeHisSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeHisDAO.selectMembershipGradeHissByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeHisService#selectMembershipGradeHissByConditionCnt(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO)
     */
    @Override
    public int selectMembershipGradeHissByConditionCnt(MembershipGradeHisSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeHisDAO.selectMembershipGradeHissByConditionCnt(searchVO);
    }


    /**
     * 조회 조건에 해당하는 멤버십 등급 변경 이력  정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeHisSearchVO
     * @return
     */
    @Override
    public int selectMembershipGradeChgHissByConditionCnt(MembershipGradeHisSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeHisDAO.selectMembershipGradeChgHissByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 멤버십 등급 변경 이력  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeHisSearchVO
     * @return 조회 목록
     */
    @Override
    public List<MembershipGradeHisVO> selectMembershipGradeChgHissByCondition(MembershipGradeHisSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeHisDAO.selectMembershipGradeChgHissByCondition(searchVO);
    }
}
