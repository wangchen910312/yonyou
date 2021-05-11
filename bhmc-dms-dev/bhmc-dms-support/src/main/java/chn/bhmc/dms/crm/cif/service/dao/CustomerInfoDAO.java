package chn.bhmc.dms.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;

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

@Mapper("customerInfoDAO")
public interface CustomerInfoDAO {

    public int selectCustomerInfoByConditionCnt(CustomerInfoSearchVO searchVO);

    public int selectMasterCustomerInfoByConditionCnt(CustomerInfoSearchVO searchVO);

    public int selectCustomerInfoHistoryByConditionCnt(CustomerInfoSearchVO searchVO);

    public List<CustomerInfoVO> selectCustomerInfoHistoryByCondition(CustomerInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustomerInfoVO> selectCustomerInfoByCondition(CustomerInfoSearchVO searchVO);

    public int selectCustomerListByConditionCnt(CustomerInfoSearchVO searchVO);

    public List<CustomerInfoVO> selectCustomerListByCondition(CustomerInfoSearchVO searchVO);
    public List<CustomerInfoVO> selectCustomerListExcelExportByCondition(CustomerInfoSearchVO searchVO);

    public CustomerInfoVO selectCustomerInfoByKey(CustomerInfoSearchVO searchVO);

    public List<CustomerInfoVO> selectMasterCustomerInfoByCondition(CustomerInfoSearchVO searchVO);


    /**
     * 고객정보를 입력 한다.
     *
     * @param customerInfoVO - 등록 정보가 담긴 CustomerInfoVO
     * @return 등록된 목록수
     */
    public int insertCustomer(CustomerInfoVO customerInfoVO);

    /**
     * Key에 해당하는 고객 정보 카운트를 조회한다.
     * @param dlrCd - 딜러코드
     * @param custNm - 이름
     * @param hpNo - 핸드폰번호
     * @return 조회한 고객 정보
     */
    public int selectCustDupCntByKey(@Param("dlrCd") String dlrCd, @Param("custNm") String custNm, @Param("hpNo") String hpNo);

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param CustomerInfoVO customerInfoVO (고객명 + 핸드폰)
     * @return 조회한 고객 정보
     */
    public int selectCustDupByKeyCnt(CustomerInfoSearchVO searchVO);
    public CustomerInfoVO selectCustDupByKey(CustomerInfoSearchVO searchVO);

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param CustomerInfoVO customerInfoVO (증거유형 + 증거번호)
     * @return 조회한 고객 정보
     */
    public int selectCustMathDocDupByKeyCnt(CustomerInfoSearchVO searchVO);
    public CustomerInfoVO selectCustMathDocDupByKey(CustomerInfoSearchVO searchVO);

    public CustomerInfoVO selectMasterCustDupByKey(@Param("dlrCd") String dlrCd, @Param("custNm") String custNm, @Param("hpNo") String hpNo);

    /** 20160903 / 이인문 / support 로 이동
     * 고객정보를 수정한다.
     *
     * @param customerInfoVO - 등록 정보가 담긴 CustomerInfoVO
     * @return 등록된 목록수
     */
    public int updateCustomer(CustomerInfoVO customerInfoVO);


    /**
     * 고객조회 팝업 > 차량정보 기준 고객검색 목록 카운트
     *
     * @param CustomerInfoSearchVO
     * @return int
     */
    public int selectCustomerAndCarInfoByConditionCnt(CustomerInfoSearchVO searchVO);

    /**
     * 고객조회 팝업 > 차량정보 기준 고객검색 목록을 보여준다.
     *
     * @param CustomerInfoSearchVO
     * @return List<CustomerInfoVO>
     */
    public List<CustomerInfoVO> selectCustomerAndCarInfoByCondition(CustomerInfoSearchVO searchVO);

    /**
     * 고객의 판매고문을 업데이트 한다.
     *
     * @param customerInfoVO - 등록 정보가 담긴 CustomerInfoVO
     * @return 등록된 목록수
     */
    public int updateCustomerMngScAssign(CustomerInfoVO customerInfoVO);

    /**
     * 고객 & 연계인 목록 카운트
     *
     * @param CustomerInfoSearchVO
     * @return int
     */
    public int selectCustomerAndPconInfoByConditionCnt(CustomerInfoSearchVO searchVO);

    /**
     * 고객 & 연계인 목록을 보여준다.
     *
     * @param CustomerInfoSearchVO
     * @return List<CustomerInfoVO>
     */
    public List<CustomerInfoVO> selectCustomerAndPconInfoByCondition(CustomerInfoSearchVO searchVO);

    public String selectAbleToEditSsnCrnNo(@Param("dlrCd") String dlrCd,  @Param("custNo") String custNo);
}
