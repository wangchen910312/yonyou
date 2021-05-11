package chn.bhmc.dms.crm.dmm.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipJoinHistoryDAO.java
 * @Description : 블루멤버십 인증 히스토리 DAO
 * @author Lee In Moon
 * @since 2016.09.28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.09.28.     Lee In Moon     최초 생성
 * </pre>
 */

@Mapper("blueMembershipJoinHistoryDAO")
public interface BlueMembershipJoinHistoryDAO {

    /**
     * 블루멤버십 인증 히스토리 인서트
     *
     * @param joinVO
     * @return
     */
    public int insertBlueMembershipJoinHistory(BlueMembershipJoinVO joinVO);

}
