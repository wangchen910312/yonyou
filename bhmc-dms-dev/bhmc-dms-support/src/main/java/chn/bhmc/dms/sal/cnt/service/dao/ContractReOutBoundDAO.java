package chn.bhmc.dms.sal.cnt.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.cnt.vo.ContractReIncSupportVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSupportSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSupportVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractReOutBoundDAO
 * @Description : 계약 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("contractReOutBoundDAO")
public interface ContractReOutBoundDAO {

    /**
     * 판매기회로 넘어온 계약헤더를 임시저장한다.
     */
    public void insertOpptContract(ContractReSupportVO saveVO) throws Exception;

    /**
     * 진행중인 판매기회가 있는지 체크한다.
     */
    public int selectOpptIngCountsByConditionCnt(ContractReSupportVO saveVO) throws Exception;

    /**
     * 계약번호로 계약내역을 조회한다.
     */
    public List<ContractReSupportVO> selectContractResByCondition(ContractReSupportSearchVO searchVO) throws Exception;

    /**
     * 계약 가격(보험) 내역 변경
     * @param updateVO
     * @throws Exception
     */
    public int updateContractIncPrice(ContractReSupportVO updateVO) throws Exception;

    /**
     * 계약 보험내역을 지운다.
     * @param updateVO
     * @return
     * @throws Exception
     */
    public int deleteIncHead(ContractReSupportVO updateVO) throws Exception;
    public int deleteIncAll(ContractReSupportVO updateVO) throws Exception;

    /**
     * 계약 보험헤더 정보를 저장한다.
     * @param updateVO
     * @return
     * @throws Exception
     */
    public int insertIncHead(ContractReSupportVO updateVO) throws Exception;

    /**
     * 계약 보험아이템 정보를 저장한다.
     * @param insertVO
     * @return
     * @throws Exception
     */
    public int insertInc(ContractReIncSupportVO insertVO) throws Exception;

    /**
     * [CRM 조회용] : 계약자 - 중고차 치환을 통한 계약자의 최신 차량정보
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ContractReSupportVO> selectCustContractUseCarInfoSearch(ContractReSupportSearchVO searchVO) throws Exception;


    /**
     * 계약고객 유효성 체크
     */
    public int selectContractCustomersChkByConditionCnt(ContractReSupportVO searchVO) throws Exception;

    /**
     * 계약 고객을 저장한다. (계약자, 실운전자)
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertContractCustomer(ContractReSupportVO saveVO) throws Exception;

    /**
     * 계약 고객을 수정한다. (계약자, 실운전자)
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    public int updateContractCustomer(ContractReSupportVO saveVO) throws Exception;

    /**
     * 계약의 컬럼을 개별을 수정한다.
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    public int updateContractEach(ContractReSupportVO saveVO) throws Exception;

    /**
     * 계약별 용품내역 조회
     * @return
     * @throws Exception
     */
    public int selectGoodsListsByConditionCnt(ContractReSupportSearchVO searchVO) throws Exception;

    /**
     * 계약-용품의 고객정보를 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateGoodsContractCust(ContractReSupportVO saveVO) throws Exception;

    /**
     * 계약-금융의 고객정보를 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateFincContractCust(ContractReSupportVO saveVO) throws Exception;

}