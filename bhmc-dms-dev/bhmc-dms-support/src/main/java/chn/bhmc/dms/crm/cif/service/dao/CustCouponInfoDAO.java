package chn.bhmc.dms.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cif.vo.CustCouponInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CutomerInfoDAO.java
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

@Mapper("custCouponInfoDAO")
public interface CustCouponInfoDAO {

    /**
     * 쿠폰 서비스 시작
     */

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustCouponInfoByConditionCnt(CustCouponInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustCouponInfoVO> selectCustCouponInfoByCondition(CustCouponInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public CustCouponInfoVO selectCustCouponInfoByConditionByKey(CustCouponInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int insertCustCoupon(CustCouponInfoVO custCouponInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int updateCustCoupon(CustCouponInfoVO custCouponInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int deleteCustCoupon(CustCouponInfoVO custCouponInfoVO) throws Exception;
}
