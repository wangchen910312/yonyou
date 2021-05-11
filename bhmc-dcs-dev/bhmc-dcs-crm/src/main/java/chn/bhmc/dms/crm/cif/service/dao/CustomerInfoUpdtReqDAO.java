package chn.bhmc.dms.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoUpdtReqDAO.java
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

@Mapper("customerInfoUpdtReqDAO")
public interface CustomerInfoUpdtReqDAO {

    public int selectCustomerInfoReqByConditionCnt(CustomerInfoUpdtReqSearchVO searchVO);

    public List<CustomerInfoUpdtReqVO> selectCustomerInfoReqByCondition(CustomerInfoUpdtReqSearchVO searchVO);

    /**
     * 고객 유일정보 수정요청 등록
     * @param customerInfoUpdtReqVO - 고객유일정보수정
     * @return 등록된 목록수
     */
    public int insertCustomerInfoReq(CustomerInfoUpdtReqVO customerInfoUpdtReqVO);

    public int insertCustomerInfoReqToDcs(CustomerInfoUpdtReqVO customerInfoUpdtReqVO);

    public int insertCustomerInfoReqToDms(CustomerInfoUpdtReqVO customerInfoUpdtReqVO);

    /**
     * 고객 유일정보 수정 업데이트
     * @param customerInfoUpdtReqVO - 고객유일정보수정
     * @return 수정된 목록수
     */
    public int updateCustomerInfoReq(CustomerInfoUpdtReqVO customerInfoUpdtReqVO);


}
