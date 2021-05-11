package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoVO;


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

@Mapper("CrmcustomerInfoDAO")
public interface CrmCustomerInfoDAO {
	
	public int selectCustomerAndCarInfoByConditionCnt(CustomerInfoSearchVO searchVO);
	
	public List<CustomerInfoVO> selectCustomerAndCarInfoByCondition(CustomerInfoSearchVO searchVO);

    public int selectCustomerListByConditionCnt(CustomerInfoSearchVO searchVO);
    
    public List<CustomerInfoVO> selectCustomerListByCondition(CustomerInfoSearchVO searchVO);
    
    public int selectCustomerInfoByConditionCnt(CustomerInfoSearchVO searchVO);
    
    public List<CustomerInfoVO> selectCustomerInfoByCondition(CustomerInfoSearchVO searchVO);
    
    public int selectCustomerByConditionCnt(CustomerInfoSearchVO searchVO);
    
    public List<CustomerInfoVO> selectCustomerByCondition(CustomerInfoSearchVO searchVO);
    
    public int selectCustomerInfoHistoryByConditionCnt(CustomerInfoSearchVO searchVO);

    public List<CustomerInfoVO> selectCustomerInfoHistoryByCondition(CustomerInfoSearchVO searchVO);

}
