package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.mob.api.crm.vo.CustomerRelInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerRelInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CutomerRelInfoDAO.java
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

@Mapper("CrmcustomerRelInfoDAO")
public interface CrmCustomerRelInfoDAO {

    /**
     * 연계인 목록 수를 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerRelInfoByConditionCnt(CustomerRelInfoSearchVO searchVO);

    /**
     * 연계인 목록을 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerRelInfoVO> selectCustomerRelInfoByCondition(CustomerRelInfoSearchVO searchVO);


}
