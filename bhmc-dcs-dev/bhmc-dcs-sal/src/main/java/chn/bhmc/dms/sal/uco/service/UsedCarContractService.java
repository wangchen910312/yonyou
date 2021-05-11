package chn.bhmc.dms.sal.uco.service;

import java.util.List;

import chn.bhmc.dms.sal.uco.vo.UsedCarContractIncVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractOptionVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractPayInfoSaveVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractPayInfoVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractSaveVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractSearchVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractVO;




/**
 *  관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface UsedCarContractService {

    /**
     * 중고차 계약정보 갯수 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectUsedCarContractsByConditionCnt(UsedCarContractSearchVO searchVO) throws Exception;

    /**
     * 중고차 계약정보 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<UsedCarContractVO> selectUsedCarContractsByCondition(UsedCarContractSearchVO searchVO) throws Exception;


    /**
     * 저장/수정 한다.
     */
    public String multiContracts(UsedCarContractSaveVO saveVO) throws Exception;


    /**
     * 계약생성 한다.
     */
    public String approval(UsedCarContractVO contVO) throws Exception;

    /**
     * 계약을 삭제(승인전) 한다.
     */
    public int deleteContract(UsedCarContractVO contVO) throws Exception;

    /**
     * 계약을 삭제(승인후) 한다.
     */
    public int cancelContract(UsedCarContractVO contVO) throws Exception;

    /**
     * 계약별 입/출금내역 조회
     */
    public int selectPayInfoListsByConditionCnt(UsedCarContractSearchVO searchVO) throws Exception;
    public List<UsedCarContractPayInfoVO> selectPayInfoListsByCondition(UsedCarContractSearchVO searchVO) throws Exception;

    /**
     * 계약별 입/출금내역 저장
     */
    public int savePayInfo(UsedCarContractPayInfoSaveVO payInfoVO) throws Exception;


    /**
     * 계약별 보험내역 조회
     */
    public int selectIncListsByConditionCnt(UsedCarContractSearchVO searchVO) throws Exception;
    public List<UsedCarContractIncVO> selectIncListsByCondition(UsedCarContractSearchVO searchVO) throws Exception;


    /**
     * 계약별 부가비용 조회
     */
    public int selectOptionListsByConditionCnt(UsedCarContractSearchVO searchVO) throws Exception;
    public List<UsedCarContractOptionVO> selectOptionListsByCondition(UsedCarContractSearchVO searchVO) throws Exception;

}
