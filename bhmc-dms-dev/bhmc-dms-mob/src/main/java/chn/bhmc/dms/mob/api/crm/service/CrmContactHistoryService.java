package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.ContactHistorySearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ContactHistoryVO;

/**
 * 컨택히스토리 등록 서비스
 *
 * @author in moon lee
 * @since 2016.04.06.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.06         in moon lee            최초 생성
 * </pre>
 */

public interface CrmContactHistoryService {

    /**
     * 컨택히스토리 목록 수량을 조회한다
     *
     * @param searchVO
     * @return
     */
    public int selectMsgHistorysByConditionCnt(ContactHistorySearchVO searchVO) throws Exception;

    /**
     * 컨택히스토리 목록 수량을 조회한다
     *
     * @param searchVO
     * @return
     */
    public List<ContactHistoryVO> selectMsgHistorysByCondition(ContactHistorySearchVO searchVO) throws Exception;


}
