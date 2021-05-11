package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeChgService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipGradeChgDAO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeChgServiceImpl.java
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

@Service("membershipGradeChgService")
public class MembershipGradeChgServiceImpl extends HService implements MembershipGradeChgService{

    /**
     * 멤버십 카드 관리 DAO
     */
    @Resource(name="membershipGradeChgDAO")
    MembershipGradeChgDAO membershipGradeChgDAO;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 멤버십 등급변경정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeChgSearchVO
     * @return
     */
    @Override
    public int selectMembershipGradeChgsByConditionCnt(MembershipGradeChgSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeChgDAO.selectMembershipGradeChgsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 멤버십 등급변경정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeChgSearchVO
     * @return 조회 목록
     */
    @Override
    public List<MembershipGradeChgVO> selectMembershipGradeChgsByCondition(MembershipGradeChgSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeChgDAO.selectMembershipGradeChgsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeChgService#selectMasterGradeSeqList(chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgSearchVO)
     */
    @Override
    public List<MembershipGradeChgVO> selectMasterGradeSeqByCondition(MembershipGradeChgSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeChgDAO.selectMasterGradeSeqByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeChgService#updateApplyYn(chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgVO)
     */
    @Override
    public int updateApplyYn(MembershipGradeChgVO membershipGradeChgVO) throws Exception {
        String userId = LoginUtil.getUserId();
        membershipGradeChgVO.setUpdtUsrId(userId);
        return membershipGradeChgDAO.updateApplyYn(membershipGradeChgVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipGradeChgService#selectMembershipGradeChgProcedure(chn.bhmc.dms.crm.dmm.vo.MembershipGradeChgVO)
     */
    @Override
    public void selectMembershipGradeChgProcedure(MembershipGradeChgVO membershipGradeChgVO) throws Exception {
        // TODO Auto-generated method stub
        membershipGradeChgDAO.selectMembershipGradeChgProcedure(membershipGradeChgVO);
    }


}
