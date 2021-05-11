package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.AwayCustomerSearchVO;
import chn.bhmc.dms.cmm.sci.vo.AwayCustomerVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayCustomerDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Mapper("awayCustomerDAO")
public interface AwayCustomerDAO {
    public int insertAwayCustomer(AwayCustomerVO awayCustomerVO);

    public int updateAwayCustomer(AwayCustomerVO awayCustomerVO);

    public int deleteAwayCustomer(AwayCustomerVO awayCustomerVO);

    public List<AwayCustomerVO> selectAwayCustomerByCondition(AwayCustomerSearchVO searchVO);

    public int selectAwayCustomerByConditionCnt(AwayCustomerSearchVO searchVO);

    public AwayCustomerVO selectAwayCustomerByPk(AwayCustomerSearchVO searchVO);

    public int selectAwayCustomerByOverLap(AwayCustomerSearchVO searchVO);

    public int selectAwayCustomerDelByConditionCnt(AwayCustomerSearchVO searchVO);
}