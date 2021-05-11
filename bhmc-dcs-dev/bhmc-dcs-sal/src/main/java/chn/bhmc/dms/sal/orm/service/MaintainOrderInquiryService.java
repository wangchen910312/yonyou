package chn.bhmc.dms.sal.orm.service;

import java.util.List;

import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquirySaveVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquirySearchVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquiryVO;

/**
 * BTO 주문생성 서비스
 *
 * @author Bong
 * @since 2016. 2. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.16         Bong            최초 생성
 * </pre>
 */

public interface MaintainOrderInquiryService {

    /**
     * 년월의 초기값을 조회한다.
     */
    public String selectSysDt() throws Exception;

    /**
     * 조회 조건에 해당하는 완성차 정산순위 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return 조회 목록
     */
	public List<MaintainOrderInquiryVO> selectMaintainOrderInquiryByCondition(MaintainOrderInquirySearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 완성차 정산순위 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return
     */
	public int selectMaintainOrderInquiryByConditionCnt(MaintainOrderInquirySearchVO searchVO) throws Exception;


	/**
     * BTO 주문을 삭제 처리한다
     * @param MaintainOrderInquiryVO
     * @return
     */
    public void updateMaintainOrderInquiry(MaintainOrderInquirySaveVO saveVO) throws Exception;


}
