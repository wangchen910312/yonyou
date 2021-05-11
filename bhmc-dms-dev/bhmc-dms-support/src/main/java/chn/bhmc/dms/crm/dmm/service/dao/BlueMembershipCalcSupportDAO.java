package chn.bhmc.dms.crm.dmm.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : blueMembershipCalcSupportDAO.java
 * @Description : 블루멤버십 포인트 및 쿠폰 사용 이력 저장 DAO
 * @author Lee In Moon
 * @since 2016.09.03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.09.03.     Lee In Moon     최초 생성
 * </pre>
 */

@Mapper("blueMembershipCalcSupportDAO")
public interface BlueMembershipCalcSupportDAO {
    /**
     * 블루멤버십 포인트 사용 이력 저장
     * @param calcVO - 검색할 정보가 담긴 BlueMembershipCalcVO
     * @return int
     */
    public int insertBlueMembershipHis(BlueMembershipCalcVO calcVO) throws Exception;

    /**
     * 블루멤버십 쿠폰 사용이력을 등록한다.
     * @param calcVO - 검색할 정보가 담긴 BlueMembershipCalcVO
     * @return int
     */
    public int insertBlueMembershipCouponHis(BlueMembershipCalcVO calcVO) throws Exception;

}

