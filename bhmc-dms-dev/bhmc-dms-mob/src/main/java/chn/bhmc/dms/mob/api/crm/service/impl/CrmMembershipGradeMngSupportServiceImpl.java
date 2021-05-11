package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmMembershipGradeMngSupportDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmMembershipGradeMngSupportService;
import chn.bhmc.dms.mob.api.crm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.MembershipGradeMngVO;

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

@Service("CrmmembershipGradeMngSupportService")
public class CrmMembershipGradeMngSupportServiceImpl extends HService implements CrmMembershipGradeMngSupportService{

    /**
     * 멤버십 등급설정 관리 DAO
     */
    @Resource(name="CrmmembershipGradeMngSupportDAO")
    CrmMembershipGradeMngSupportDAO CrmmembershipGradeMngSupportDAO;

    /**
     * 조회 조건에 해당하는 멤버십 등급정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeMngSearchVO
     * @return 조회 목록
     */
    @Override
    public List<MembershipGradeMngVO> selectMembershipGradeMngsByCondition(MembershipGradeMngSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return CrmmembershipGradeMngSupportDAO.selectMembershipGradeMngsByCondition(searchVO);
    }

}