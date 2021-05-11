package chn.bhmc.dms.sal.bsc.service;

import java.util.List;

import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementSearchVO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementVO;

/**
 * 금융상품관리(v.2)
 *
 * @author Bong
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Bong            최초 생성
 * </pre>
 */

public interface FinancialProductMngService {

	/**
     * 조회 조건에 해당하는 완성차 정산순위 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return 조회 목록
     */
	public List<FinancialProductsManagementVO> selectFinancialProductMngByCondition(FinancialProductsManagementSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 완성차 정산순위 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return
     */
	public int selectFinancialProductMngByConditionCnt(FinancialProductsManagementSearchVO searchVO) throws Exception;
	
    /**
     * 해당 키의 값을 조회한다.
     */
	public List<FinancialProductsManagementVO> selectFinancialProductMngByKey(FinancialProductsManagementVO searchVO) throws Exception;

	/**
     * 금융상품정보를 등록/수정/삭제 처리한다
     * @param FinancialProductsManagementSaveVO- 조회 조건을 포함하는 FinancialProductsManagementVO
     * @return
     */
	public FinancialProductsManagementVO saveFinancialProductMng(FinancialProductsManagementVO financialProductsManagementVO) throws Exception;
	
	/**
	 * 금융상품리스트를 조회한다.
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	public List<FinancialProductsManagementVO> selectFinancialProductAmtListsByCondition() throws Exception;
	
	/**
     * 금융상품리스트를 조회한다. Bhaf I/F 정보
     * @param searchVO
     * @return
     * @throws Exception
     */
	public List<FinancialProductsManagementVO> selectFinancialBhafProductListsByCondition(String fincCmpCd) throws Exception;
}
