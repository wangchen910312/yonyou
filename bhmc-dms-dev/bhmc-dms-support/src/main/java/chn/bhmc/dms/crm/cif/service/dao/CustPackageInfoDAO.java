package chn.bhmc.dms.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cif.vo.CustPackageInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustPackageInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustPackageInfoDAO
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

@Mapper("custPackageInfoDAO")
public interface CustPackageInfoDAO {
    /**
     * 패키지 서비스 시작
     */

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustCouponPackageInfoByConditionCnt(CustPackageInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustPackageInfoVO> selectCustCouponPackageInfoByCondition(CustPackageInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public CustPackageInfoVO selectCustCouponPackageInfoByConditionByKey(CustPackageInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int insertCustPackage(CustPackageInfoVO custPackageInfoVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int updateCustPackage(CustPackageInfoVO custPackageInfoVO);


    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int deleteCustPackage(CustPackageInfoVO custPackageInfoVO);
}
