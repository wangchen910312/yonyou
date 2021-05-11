package chn.bhmc.dms.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;

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

@Mapper("customerRelInfoDAO")
public interface CustomerRelInfoDAO {

    /**
     * 연계인 목록 수를 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerRelInfoByConditionCnt(CustomerRelInfoVO searchVO);

    /**
     * 연계인 목록을 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerRelInfoVO> selectCustomerRelInfoByCondition(CustomerRelInfoVO searchVO);

    /**
     * 연계인 정보를 등록한다.
     * @param CustomerInfoVO - 등록할 정보가 담긴 customerInfoVO
     * @return 등록된 목록수
     */
    public int insertCustomerRel(CustomerRelInfoVO customerRelInfoDAO);

    /**
     * 연계인 정보를 수정한다.
     * @param CustomerInfoVO - 수정할 정보가 담긴 customerInfoVO
     * @return 수정된 목록수
     */
    public int updateCustomerRel(CustomerRelInfoVO customerRelInfoDAO);

    /**
     * 연계인 정보를 삭제한다.
     * @param CustomerInfoVO - 삭제할 정보가 담긴 customerInfoVO
     * @return 삭제된 목록수
     */
    public int deleteCustomerRel(CustomerRelInfoVO customerRelInfoDAO);


}
