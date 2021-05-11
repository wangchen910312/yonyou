package chn.bhmc.dms.sal.cnt.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.cnt.vo.ContractLocalOptionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPromotionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractDAO
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

@Mapper("contractDAO")
public interface ContractDAO {

    /**
     * 조회 조건에 해당하는 계약목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    public List<ContractVO> selectContractsByCondition(ContractSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 계약목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    public int selectContractsByConditionCnt(ContractSearchVO searchVO) throws Exception;

    /**
     * 계약을 저장한다.
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    public int insertContract(ContractVO saveVO) throws Exception;

    /**
     * 계약 고객을 저장한다. (계약자, 실운전자)
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertContractCustomer(ContractVO saveVO) throws Exception;

    /**
     * 계약 중고차을 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertUsedCar(ContractVO saveVO) throws Exception;

    /**
     * 계약을 수정한다.
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    public int updateContract(ContractVO saveVO) throws Exception;

    /**
     * 계약 고객을 수정한다. (계약자, 실운전자)
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    public int updateContractCustomer(ContractVO saveVO) throws Exception;

    /**
     * 계약 중고차을 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateUsedCar(ContractVO saveVO) throws Exception;

    /**
     * 계약 중고차 내역 갯수를 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectUsedCarCnt(ContractVO saveVO) throws Exception;

    /**
     * 계약 중고차 내역 갯수를 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteUsedCar(ContractVO saveVO) throws Exception;

    /**
     * 계약별 로컬옵션 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectLocalOptionListsByConditionCnt(ContractSearchVO searchVO) throws Exception;
    public List<ContractLocalOptionVO> selectLocalOptionListsByCondition(ContractSearchVO searchVO) throws Exception;


    /**
     * 계약 로컬옵션을 저장/수정/삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertContractLocalOptions(ContractLocalOptionVO saveVO) throws Exception;
    public int updateContractLocalOptions(ContractLocalOptionVO saveVO) throws Exception;
    public int deleteContractLocalOptions(ContractLocalOptionVO saveVO) throws Exception;

    /**
     * 계약별 프로모션 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectPromotionListsByConditionCnt(ContractSearchVO searchVO) throws Exception;
    public List<ContractPromotionVO> selectPromotionListsByCondition(ContractSearchVO searchVO) throws Exception;



    /**
     * 계약 프로모션을 저장/수정/삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertContractPromotions(ContractPromotionVO saveVO) throws Exception;
    public int updateContractPromotions(ContractPromotionVO saveVO) throws Exception;
    public int deleteContractPromotions(ContractPromotionVO saveVO) throws Exception;
    public int deleteContractAllPromotions(ContractVO saveVO) throws Exception;

    /**
     * 계약을 삭제(승인전) 한다.
     * @param ContractVO
     * @return
     * @throws Exception
     */
    public int deleteContract(ContractVO contVO) throws Exception;

    /**
     * 계약 승인요청 한다.
     * @param ContractVO
     * @return CONTRACT_NO
     * @throws Exception
     */
    public int conRequestAppr(ContractVO contVO) throws Exception;

    /**
     * 계약 승인확정 한다.
     * @param ContractVO
     * @return CONTRACT_NO
     * @throws Exception
     */
    public int approval(ContractVO contVO) throws Exception;

    /**
     * 계약 승인반려 한다.
     * @param ContractVO
     * @return CONTRACT_NO
     * @throws Exception
     */
    public int approvalRollback(ContractVO contVO) throws Exception;

    /**
     * 계약 상태 조회 (출고 처리시 조회)
     */
    public String selectContractStatCd(ContractSearchVO searchVO) throws Exception;
}
