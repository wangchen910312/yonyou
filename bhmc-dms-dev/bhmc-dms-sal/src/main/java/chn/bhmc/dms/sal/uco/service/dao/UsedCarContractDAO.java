package chn.bhmc.dms.sal.uco.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.uco.vo.UsedCarContractIncVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractOptionVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractPayInfoVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractSearchVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarContractDAO
 * @Description : 중고차 계약 DAO
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

@Mapper("usedCarContractDAO")
public interface UsedCarContractDAO {

    /**
     * 조회 조건에 해당하는 중고차-계약목록 갯수정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    public int selectUsedCarContractsByConditionCnt(UsedCarContractSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 중고차-계약목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    public List<UsedCarContractVO> selectUsedCarContractsByCondition(UsedCarContractSearchVO searchVO) throws Exception;


    /**
     * 중고차 - 계약을 저장한다.
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    public int insertContract(UsedCarContractVO saveVO) throws Exception;

    /**
     * 중고차 - 계약 고객을 저장한다. (계약자, 실운전자)
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertContractCustomer(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 번호판을 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertReg(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 보험헤더를 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertIncHead(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 금융서비스를 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertFinc(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약을 수정한다.
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    public int updateContract(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 고객을 수정한다. (계약자, 실운전자)
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    public int updateContractCustomer(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 번호판 내역을 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateReg(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 번호판 내역 갯수를 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectRegCnt(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 번호판 내역을 삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteReg(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 보험헤더 내역을 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateIncHead(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 보험헤더 내역 갯수를 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectIncHeadCnt(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 보험헤더 내역을 삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteIncHead(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 보험 아이템을 삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteIncAll(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 금융 서비스 내역을 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateFinc(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 금융 서비스 내역 갯수를 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectFincCnt(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약 금융 서비스 내역을 삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteFinc(UsedCarContractVO saveVO) throws Exception;

    /**
     * 계약별 입/출금 내역 조회
     * @return
     * @throws Exception
     */
    public int selectPayInfoListsByConditionCnt(UsedCarContractSearchVO searchVO) throws Exception;
    public List<UsedCarContractPayInfoVO> selectPayInfoListsByCondition(UsedCarContractSearchVO searchVO) throws Exception;

    /**
     * 계약별 입/출금 내역 저장/수정/삭제한다.
     * @return
     * @throws Exception
     */
    public int insertPayInfo(UsedCarContractPayInfoVO saveVO) throws Exception;
    public int updatePayInfo(UsedCarContractPayInfoVO saveVO) throws Exception;
    public int deletePayInfo(UsedCarContractPayInfoVO saveVO) throws Exception;

    /**
     * 계약별 보험내역 조회
     * @return
     * @throws Exception
     */
    public int selectIncListsByConditionCnt(UsedCarContractSearchVO searchVO) throws Exception;
    public List<UsedCarContractIncVO> selectIncListsByCondition(UsedCarContractSearchVO searchVO) throws Exception;

    /**
     * 계약별 보험내역 저장/수정/삭제한다.
     * @return
     * @throws Exception
     */
    public int insertInc(UsedCarContractIncVO saveVO) throws Exception;
    public int updateInc(UsedCarContractIncVO saveVO) throws Exception;
    public int deleteInc(UsedCarContractIncVO saveVO) throws Exception;

    /**
     * 계약별 부가비용 조회
     * @return
     * @throws Exception
     */
    public int selectOptionListsByConditionCnt(UsedCarContractSearchVO searchVO) throws Exception;
    public List<UsedCarContractOptionVO> selectOptionListsByCondition(UsedCarContractSearchVO searchVO) throws Exception;

    /**
     * 계약별 부가비용 저장/수정/삭제한다.
     * @return
     * @throws Exception
     */
    public int insertOption(UsedCarContractOptionVO saveVO) throws Exception;
    public int updateOption(UsedCarContractOptionVO saveVO) throws Exception;
    public int deleteOption(UsedCarContractOptionVO saveVO) throws Exception;

    /**
     * 계약 승인확정 한다.
     * @param UsedCarContractVO
     * @return CONTRACT_NO
     * @throws Exception
     */
    public int approval(UsedCarContractVO contVO) throws Exception;

    /**
     * 계약을 삭제(승인전) 한다.
     * @param UsedCarContractVO
     * @return
     * @throws Exception
     */
    public int deleteContract(UsedCarContractVO contVO) throws Exception;

    /**
     * 계약을 삭제(승인후) 한다.
     * @param UsedCarContractVO
     * @return
     * @throws Exception
     */
    public int cancelContract(UsedCarContractVO contVO) throws Exception;

    /**
     * 중고차 차량마스터에 차량상태 변경
     * @param ContractVO
     * @return
     * @throws Exception
     */
    public int updateUsedCarMasterStat(UsedCarContractVO contVO) throws Exception;
}
