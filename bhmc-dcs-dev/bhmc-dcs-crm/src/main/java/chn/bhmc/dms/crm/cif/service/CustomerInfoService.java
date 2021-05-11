package chn.bhmc.dms.crm.cif.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoService.java
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

public interface CustomerInfoService {

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerInfoByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerInfoVO> selectCustomerInfoByCondition(CustomerInfoSearchVO searchVO) throws Exception;
    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerInfoHistoryByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerInfoVO> selectCustomerInfoHistoryByCondition(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * 고객정보를 입력 한다.
     *
     * @param CustomerInfoVO - 등록 정보가 담긴 CustomerInfoVO
     * @return CustomerInfoVO
     */
    public CustomerInfoVO insertCustomer(CustomerInfoVO customerInfoVO) throws Exception;

    /**
     * 고객정보를 수정한다.
     *
     * @param customerInfoVO - 등록 정보가 담긴 CustomerInfoVO
     * @return 등록된 목록수
     */
    public CustomerInfoVO updateCustomer(CustomerInfoVO customerInfoVO) throws Exception;


    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param CustomerInfoVO customerInfoVO (고객명 + 핸드폰)
     * @return 조회한 고객 정보
     */
    public CustomerInfoVO selectCustDupByKey(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param CustomerInfoVO customerInfoVO (증거유형 + 증거번호)
     * @return 조회한 고객 정보
     */
    public CustomerInfoVO selectCustMathDocDupByKey(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param list - 등록 정보가 담긴 CustomerInfoVO
     * @return
     */
    public List<CustomerInfoVO> selectCustDupCheck(List<CustomerInfoVO> list) throws Exception;

    /**
     * Key에 해당하는 고객의 카운트를 조회한다.
     * @param dlrCd - 딜러코드
     * @param custNm - 이름
     * @param hpNo - 핸드폰번호
     * @return 조회한 고객 정보
     */
    public int selectCustDupCntByKey(String dlrCd, String custNm, String hpNo) throws Exception;

    /**
     * 고객번호를 채번한다.
     *
     * @param null
     * @return 고객번호
     */
    public String selectNextCustNo() throws Exception;

    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiCustomerRelChg(BaseSaveVO<CustomerRelInfoVO> saveVO) throws Exception;

    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiCustomerInfo(BaseSaveVO<CustomerInfoVO> customerInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiCustomerUploadFileSave(BaseSaveVO<CustomerInfoVO> saveVO) throws Exception;

    /**
     * 고객 유일정보 수정요청
     * @param customerInfoUpdtReqVO - 고객유일정보수정
     * @return 수정된 목록수
     */
    public int insertCustomerInfoReq(CustomerInfoUpdtReqVO customerInfoUpdtReqVO) throws Exception;

    /**
     * 고객필수 값 체크
     * @param CustomerInfoVO
     * @return boolean
     */
    public boolean customerInfoReqValueChk(CustomerInfoVO customerInfoVO) throws Exception;
}
