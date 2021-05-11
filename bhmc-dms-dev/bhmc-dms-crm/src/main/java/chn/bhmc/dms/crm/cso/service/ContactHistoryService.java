package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.ContactHistorySearchVO;
import chn.bhmc.dms.crm.cso.vo.ContactHistoryVO;

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

public interface ContactHistoryService {

    /**
     * 컨택히스토리를 등록한다.
     * @param contactHistoryVO - 등록할 정보가 담긴 contactHistoryVO
     * @return 등록된 목록수
     */
    public int insertContactHistory(ContactHistoryVO contactHistoryVO) throws Exception;

    /**
     * [그룹전송] 컨택히스토리를 등록한다. ( SMS 전송 대상자 임시 테이블에서 select insert )
     * @param contactHistoryVO - 등록할 정보가 담긴 contactHistoryVO
     * @return 등록된 목록수
     */
    public int insertGroupContactHistory(ContactHistoryVO contactHistoryVO) throws Exception;

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
