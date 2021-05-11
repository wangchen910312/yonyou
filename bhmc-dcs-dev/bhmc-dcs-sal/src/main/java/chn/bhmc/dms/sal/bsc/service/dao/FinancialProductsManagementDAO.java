package chn.bhmc.dms.sal.bsc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementModelVO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementSearchVO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FinancialProductsManagementDAO
 * @Description : 금융상품관리 DAO
 * @author Bong
 * @since 2016. 2. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.11         Bong            최초 생성
 * </pre>
 */

@Mapper("financialProductsManagementDAO")
public interface FinancialProductsManagementDAO {


    /**
      * 조회 조건에 해당하는  정보를 조회한다.
      */
    public List<FinancialProductsManagementVO> selectFinancialProductsManagementByCondition(FinancialProductsManagementSearchVO searchVO) throws Exception;

    /**
     *  조회 조건에 해당하는  총 갯수를 조회한다.
     */
    public int selectFinancialProductsManagementByConditionCnt(FinancialProductsManagementSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    public List<FinancialProductsManagementVO> selectFinancialProductsManagementByKey(FinancialProductsManagementVO searchVO) throws Exception;

    /**
     * 로컬옵션을 저장한다.
     * @param LocalOptionVO
     * @return
     */
    public int insertFinancialProductsManagement(FinancialProductsManagementVO LocalVO) throws Exception;

    /**
     * 로컬옵션을 수정한다.
     * @param LocalOptionVO
     * @return
     */
    public int updateFinancialProductsManagement(FinancialProductsManagementVO LocalVO) throws Exception;

    /**
     * 금융상품관리 모델내역 갯수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectFincTargetModelSearchsByConditionCnt(FinancialProductsManagementSearchVO searchVO) throws Exception;

    /**
     * 금융상품관리 모델내역을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<FinancialProductsManagementModelVO> selectFincTargetModelSearchsByCondition(FinancialProductsManagementSearchVO searchVO) throws Exception;

    /**
     * 금융상품관리 모델 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertFincModel(FinancialProductsManagementModelVO saveVO) throws Exception;

    /**
     * 금융상품관리 모델 삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteFincModel(FinancialProductsManagementModelVO saveVO) throws Exception;

    /**
     * 금융상품리스트를 조회한다.
     *  (계약쪽 사용)
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<FinancialProductsManagementVO> selectFinancialProductAmtListsByCondition(FinancialProductsManagementSearchVO searchVO) throws Exception;
    public List<FinancialProductsManagementVO> selectFinancialProductModelListsByCondition(FinancialProductsManagementSearchVO searchVO) throws Exception;

}
