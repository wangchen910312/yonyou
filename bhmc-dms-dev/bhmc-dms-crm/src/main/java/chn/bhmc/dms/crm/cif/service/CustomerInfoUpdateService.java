package chn.bhmc.dms.crm.cif.service;

import java.util.List;

import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoUpdateService.java
 * @Description : 고객 정보관리 Service
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

public interface CustomerInfoUpdateService {

    /**
     * 고객정보를 입력 한다.
     *
     * @param customerInfoVO - 등록 정보가 담긴 CustomerInfoVO
     * @return 등록된 목록수
     */
    //public CustomerInfoUpdtReqVO insertCustomerInfoUpdtRequest(CustomerInfoUpdtReqVO customerInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerInfoReqByConditionCnt(CustomerInfoUpdtReqSearchVO searchVO) throws Exception;

    /**
     * 고객 유일정보 수정 목록
     *
     * @param CustomerInfoUpdtReqSearchVO
     * @return List<CustomerInfoUpdtReqVO>
     */
    public List<CustomerInfoUpdtReqVO> selectCustomerInfoReqByCondition(CustomerInfoUpdtReqSearchVO searchVO) throws Exception;

    /**
     * 고객 유일정보 수정요청 등록
     * @param customerInfoUpdtReqVO - 고객유일정보수정
     * @return 등록된 목록수
     */
    public int insertCustomerInfoReq(CustomerInfoUpdtReqVO customerInfoUpdtReqVO) throws Exception;

    /**
     * 고객 유일정보 수정 업데이트
     * @param customerInfoUpdtReqVO - 고객유일정보수정
     * @return 수정된 목록수
     */
    public int updateCustomerInfoReq(CustomerInfoUpdtReqVO customerInfoUpdtReqVO) throws Exception;

    /**
     * DCS 전송을 위한 Camel Client 호출
     * Statements
     *
     * @return
     * @throws Exception
     */
    public Data selectCustomerInfoReqCallCamel() throws Exception;



}
