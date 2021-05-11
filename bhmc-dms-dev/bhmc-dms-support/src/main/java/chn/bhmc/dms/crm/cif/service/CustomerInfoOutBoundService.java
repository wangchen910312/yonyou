package chn.bhmc.dms.crm.cif.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
//import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoOutBoundService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 5. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 30.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public interface CustomerInfoOutBoundService {


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
    public int selectCustomerListByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerInfoVO> selectCustomerListByCondition(CustomerInfoSearchVO searchVO) throws Exception;


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
    public int selectCustDupByKeyCnt(CustomerInfoSearchVO searchVO) throws Exception;
    public CustomerInfoVO selectCustDupByKey(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param CustomerInfoVO customerInfoVO (증거유형 + 증거번호)
     * @return 조회한 고객 정보
     */
    public int selectCustMathDocDupByKeyCnt(CustomerInfoSearchVO searchVO) throws Exception;
    public CustomerInfoVO selectCustMathDocDupByKey(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * 고객번호를 채번한다.
     *
     * @param null
     * @return 고객번호
     */
    public String selectNextCustNo() throws Exception;

    /**
     * 고객필수 값 체크
     * @param CustomerInfoVO
     * @return boolean
     */
    public boolean customerInfoReqValueChk(CustomerInfoVO customerInfoVO) throws Exception;

    /**
     * 고객정보를 수정한다. (블루멤버십)
     *
     * @param customerInfoVO - 등록 정보가 담긴 CustomerInfoVO
     * @return 등록된 목록수
     */
    public int updateBlueMemberCustomer(CustomerInfoVO customerInfoVO) throws Exception;

    /**
     * 고객의 타입을 조회한다.
     *
     * @param customerInfoVO - 등록 정보가 담긴 CustomerInfoVO
     * @return custCd (01:잠재, 02:보유, 03:타사보유)
     */
    public String selectCustomerCustCd(CustomerInfoVO customerInfoVO) throws Exception;

    /**
     * 고객조회 팝업 > 차량정보 기준 고객 목록 수량
     *
     * @param searchVO
     * @return int
     */
    public int selectCustomerAndCarInfoByConditionCnt(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * 고객조회 팝업 > 차량정보 기준 고객 목록
     *
     * @param searchVO
     * @return List<CustomerInfoVO>
     */
    public List<CustomerInfoVO> selectCustomerAndCarInfoByCondition(CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiCustomerMngScAssign(BaseSaveVO<CustomerInfoVO> obj) throws Exception;

    /**
     * 고객 & 연계인
     *
     * @param searchVO
     * @return int
     */
    public int selectCustomerAndPconInfoByConditionCnt (CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * 고객 & 연계인
     *
     * @param searchVO
     * @return List<CustomerInfoVO>
     */
    public List<CustomerInfoVO> selectCustomerAndPconInfoByCondition (CustomerInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param dlrCd 딜러코드
     * @param custNo 고객번호
     * @return String Y / N
     */
    public String selectAbleToEditSsnCrnNo(@Param("dlrCd") String dlrCd,  @Param("custNo") String custNo) throws Exception;

    /**
     * 고객정보 입력 시 코드 valid 체크
     * 공통코드에 정의된 값에 대한 체크
     * @param CustomerInfoVO
     * @return boolean
     */
    public String selectCustomerCodeValidChk(CustomerInfoVO customerInfoVO) throws Exception;

}
