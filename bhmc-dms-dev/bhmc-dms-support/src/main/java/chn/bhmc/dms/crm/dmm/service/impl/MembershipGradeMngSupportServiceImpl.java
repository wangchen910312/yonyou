package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngSupportService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipGradeMngSupportDAO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;

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

@Service("membershipGradeMngSupportService")
public class MembershipGradeMngSupportServiceImpl extends HService implements MembershipGradeMngSupportService{

    /**
     * 멤버십 등급설정 관리 DAO
     */
    @Resource(name="membershipGradeMngSupportDAO")
    MembershipGradeMngSupportDAO membershipGradeMngSupportDAO;

    /**
     * 멤버십 등급정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeMngSearchVO
     * @return
     */
    @Override
    public int selectMembershipGradeMngsByConditionCnt(MembershipGradeMngSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeMngSupportDAO.selectMembershipGradeMngsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 멤버십 등급정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeMngSearchVO
     * @return 조회 목록
     */
    @Override
    public List<MembershipGradeMngVO> selectMembershipGradeMngsByCondition(MembershipGradeMngSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeMngSupportDAO.selectMembershipGradeMngsByCondition(searchVO);
    }

    /**
     * 멤버십 등급별 적립계수를 구한다.
     * @param MembershipSearchVO - dlrCd, membershipNo
     * @return MembershipGradeMngVO
     */
    @Override
    public MembershipGradeMngVO selectMembershipGradeInfoByKey(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipGradeMngSupportDAO.selectMembershipGradeInfoByKey(searchVO);
    }

}