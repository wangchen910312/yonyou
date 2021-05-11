package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.AddressInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AddressInfoDAO.java
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

@Mapper("CrmaddressInfoDAO")
public interface CrmAddressInfoDAO {

    /**
     * Statements
     *
     * @param searchVO
     * @return Select Count
     */
    public int selectAddressInfoByConditionCnt(AddressInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return List<AddressInfoVO>
     */
    public List<AddressInfoVO> selectAddressInfoByCondition(AddressInfoSearchVO searchVO);


}
