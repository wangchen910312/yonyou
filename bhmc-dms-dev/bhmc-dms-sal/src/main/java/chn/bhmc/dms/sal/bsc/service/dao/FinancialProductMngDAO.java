package chn.bhmc.dms.sal.bsc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementSearchVO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FinancialProductMngDAO
 * @Description : 금융상품관리(v.2) DAO
 * @author Kim Jin Suk
 * @since 2017.01.12
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                      수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.01.12         Kim Jin Suk            최초 생성
 * </pre>
 */

@Mapper("financialProductMngDAO")
public interface FinancialProductMngDAO {


    /**
      * 조회 조건에 해당하는  정보를 조회한다.
      */
    public List<FinancialProductsManagementVO> selectFinancialProductMngByCondition(FinancialProductsManagementSearchVO searchVO) throws Exception;

    /**
     *  조회 조건에 해당하는  총 갯수를 조회한다.
     */
    public int selectFinancialProductMngByConditionCnt(FinancialProductsManagementSearchVO searchVO) throws Exception;

    /**
     * 해당 키의 값을 조회한다.
     */
    public List<FinancialProductsManagementVO> selectFinancialProductMngByKey(FinancialProductsManagementVO searchVO) throws Exception;
    
    /**
     * 금융상품관리을 저장한다.
     * @param LocalOptionVO
     * @return
     */
    public int insertFinancialProductMng(FinancialProductsManagementVO finVO) throws Exception;

    /**
     * 금융상품관리을 수정한다.
     * @param LocalOptionVO
     * @return
     */
    public int updateFinancialProductMng(FinancialProductsManagementVO finVO) throws Exception;

    /**
     * 금융상품리스트를 조회한다.
     * @param sFincItemKindCd
     * @return
     * @throws Exception
     */
    public List<FinancialProductsManagementVO> selectFinancialProductAmtListsByCondition(FinancialProductsManagementSearchVO searchVO) throws Exception;
    
    /**
     * 금융상품리스트를 조회한다.
     * @param sFincItemKindCd
     * @return
     * @throws Exception
     */
    public List<FinancialProductsManagementVO> selectFinancialBhafProductListsByCondition(FinancialProductsManagementSearchVO searchVO) throws Exception;
    
}
