package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.PackageCouponStandbySearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponStandbyVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponStandbyDAO.java
 * @Description : 패키지 쿠폰 승인대기 DAO
 * @author Kim Hyun Ho
 * @since 2016. 7. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 21.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Mapper("packageCouponStandbyDAO")
public interface PackageCouponStandbyDAO {

    /**
     * 패키지 쿠폰 결재대기 정보를 등록한다.
     * @param packageCouponStandbyVO - 등록할 정보가 담긴 PackageCouponStandbyVO
     * @return 등록된 목록수
     */
    public int insertPackageCouponStandby(PackageCouponStandbyVO packageCouponStandbyVO) throws Exception;

    /**
     * 조회 조건에 해당하는 패키지 쿠폰 결재대기 목록정보를 조회한다.
     * @param packageCouponStandbyVO - 등록할 정보가 담긴 PackageCouponStandbyVO
     * @return 조회된 목록수
     */
    public List<PackageCouponStandbyVO> selectPackageCouponStandbyCondition(PackageCouponStandbySearchVO searchVO) throws Exception;
}
