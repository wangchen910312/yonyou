package chn.bhmc.dms.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustCouponInPackageInfoDAO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@Mapper("custCouponInPackageInfoDAO")
public interface CustCouponInPackageInfoDAO {

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCouponInPackageInfoByConditionCnt(CustCouponInPackageInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustCouponInPackageInfoVO> selectCouponInPackageInfoByCondition(CustCouponInPackageInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public CustCouponInPackageInfoVO selectCouponInPackageInfoByConditionByKey(CustCouponInPackageInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int insertCouponInPackage(CustCouponInPackageInfoVO custCouponInPackageInfoVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int updateCouponInPackage(CustCouponInPackageInfoVO custCouponInPackageInfoVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int deleteCouponInPackage(CustCouponInPackageInfoVO custCouponInPackageInfoVO);
}
