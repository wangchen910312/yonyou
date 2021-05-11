package chn.bhmc.dms.sal.cer.service;

import java.util.List;

import chn.bhmc.dms.sal.cer.vo.DealerReceiptSaveVO;
import chn.bhmc.dms.sal.cer.vo.DealerReceiptSearchVO;
import chn.bhmc.dms.sal.cer.vo.DealerReceiptVO;

/**
 * 딜러 영수증 등록 서비스
 *
 * @author Bong
 * @since 2016. 5. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.23         Bong            최초 생성
 * </pre>
 */

public interface DealerRegistrationReceiptService {

	/**
     * 조회 조건에 해당하는 딜러 영수증 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerReceiptSearchVO
     * @return 조회 목록
     */
	public List<DealerReceiptVO> selectDealerRegistrationReceiptByCondition(DealerReceiptSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 딜러 영수증 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerReceiptSearchVO
     * @return
     */
	public int selectDealerRegistrationReceiptByConditionCnt(DealerReceiptSearchVO searchVO) throws Exception;

	/**
     * 딜러 영수증 마감일자를 등록/수정 처리한다
     * @param DealerReceiptSaveVO- 조회 조건을 포함하는 DealerRegistrationReceiptVO
     * @return
     */
	public void updateDealerRegistrationReceipt(DealerReceiptSaveVO saveVO) throws Exception;

	/**
     * 딜러 영수증 정보를 삭제 처리한다
     * @param DealerReceiptSaveVO- 조회 조건을 포함하는 DealerRegistrationReceiptVO
     * @return
     */
    public void deleteDealerRegistrationReceipt(DealerReceiptSaveVO saveVO) throws Exception;



}
