package chn.bhmc.dms.sal.bsc.service;

import java.util.List;

import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementModelVO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementSearchVO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementVO;

/**
 * 완성차 정산순서 관리 서비스
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

public interface FinancialProductsManagementService {

	/**
     * 조회 조건에 해당하는 완성차 정산순위 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return 조회 목록
     */
	public List<FinancialProductsManagementVO> selectFinancialProductsManagementByCondition(FinancialProductsManagementSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 완성차 정산순위 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return
     */
	public int selectFinancialProductsManagementByConditionCnt(FinancialProductsManagementSearchVO searchVO) throws Exception;

	/**
     * 해당 키값 정보를 조회한다.
     * @param searchVO - 키를 포함하는 FinancialProductsManagementVO
     * @return 조회 목록
     */
    public List<FinancialProductsManagementVO> selectFinancialProductsManagementByKey(FinancialProductsManagementVO searchVO) throws Exception;

	/**
     * 금융상품정보를 등록/수정/삭제 처리한다
     * @param FinancialProductsManagementSaveVO- 조회 조건을 포함하는 FinancialProductsManagementVO
     * @return
     */
	public FinancialProductsManagementVO saveFinancialProductsManagement(FinancialProductsManagementVO financialProductsManagementVO) throws Exception;

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
	 * 금융상품리스트를 조회한다. (계약품의관리 사용) - 금액
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	public List<FinancialProductsManagementVO> selectFinancialProductAmtListsByCondition(String sFincItemKindCd) throws Exception;
    /**
     * 금융상품리스트를 조회한다. (계약품의관리 사용) - 모델
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<FinancialProductsManagementVO> selectFinancialProductModelListsByCondition(String sModelCd) throws Exception;


}
