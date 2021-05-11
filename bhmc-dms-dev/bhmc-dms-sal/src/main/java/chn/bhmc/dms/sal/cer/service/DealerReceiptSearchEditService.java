package chn.bhmc.dms.sal.cer.service;

import chn.bhmc.dms.sal.cer.vo.DealerReceiptSaveVO;

/**
 * 딜러 영수증 조회 서비스
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

public interface DealerReceiptSearchEditService {


	/**
     * 딜러 영수증 마감일자를 등록/수정 처리한다
     * @param DealerRegistrationReceiptSaveVO- 조회 조건을 포함하는 DealerRegistrationReceiptVO
     * @return
     */
	public void updateDealerReceiptSearchEdit(DealerReceiptSaveVO saveVO) throws Exception;



}
