package chn.bhmc.dms.sal.cnt.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.cnt.vo.ContractBeforeItemVO;
import chn.bhmc.dms.sal.cnt.vo.ContractBeforeSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractBeforeVO;

/**
 * @ClassName   : ContractPackageDAO
 * @Description : 전략출고(선출고관리) DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("contractBeforeDAO")
public interface ContractBeforeDAO {

    /**
     * 조회 조건에 해당하는 전략출고 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    public int selectcontractBeforesByConditionCnt(ContractBeforeSearchVO searchVO) throws Exception;
    /**
     * 조회 조건에 해당하는 전략출고 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    public List<ContractBeforeVO> selectcontractBeforesByCondition(ContractBeforeSearchVO searchVO) throws Exception;

    /**
     * 전략출고 대상 목록 갯수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectcontractBeforeItemSearchCnt(ContractBeforeSearchVO searchVO) throws Exception;

    /**
     * 전략출고 대상 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ContractBeforeItemVO> selectcontractBeforeItemSearch(ContractBeforeSearchVO searchVO) throws Exception;


    /**
     * 전략출고 헤더를 저장한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int insertContractBeforeHeader(ContractBeforeVO saveVO) throws Exception;

    /**
     * 전략출고 아이템을 저장한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int insertContractBeforeCarItem(ContractBeforeItemVO saveVO) throws Exception;
}
