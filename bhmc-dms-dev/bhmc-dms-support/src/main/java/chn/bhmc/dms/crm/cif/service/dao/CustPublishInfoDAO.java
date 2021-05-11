package chn.bhmc.dms.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cif.vo.CustPublishInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustPublishInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustPublishInfoDAO
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

@Mapper("custPublishInfoDAO")
public interface CustPublishInfoDAO {

    /**
     * 발행 서비스 시작
     */

    /**
     * 발행번호를 발행한다.
     *
     * @param null
     * @return 발행번호 딜러번호(4),할인사용구분(2),할인방식(2),날짜(8),시리얼(7) = 23자리
     */
    public String selectNextPubliNo() throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustCouponPublishInfoByConditionCnt(CustPublishInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustPublishInfoVO> selectCustCouponPublishInfoByCondition(CustPublishInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public CustPublishInfoVO selectCustCouponPublishInfoByConditionByKey(CustPublishInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int insertCustCouponPublish(CustPublishInfoVO custPublishInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int updateCustCouponPublish(CustPublishInfoVO custPublishInfoVO) throws Exception;


    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int deleteCustCouponPublish(CustPublishInfoVO custPublishInfoVO) throws Exception;
    
    /**
     * Statements
     * 멤버십 기준에 따른 조회 (건수)
     * @param searchVO
     * @return
     */
    public int selectCouponCustConfigByConditionCnt(CustPublishInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     * 멤버십 기준에 따른 조회 (목록)
     * @param searchVO
     * @return
     */
    public List<CustPublishInfoVO> selectCouponCustConfigByCondition(CustPublishInfoSearchVO searchVO) throws Exception;


}
