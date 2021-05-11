package chn.bhmc.dms.crm.cso.service;

import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.crm.cso.vo.ShowRoomMgmtSearchVO;

/**
 * 판매기회 관리 서비스
 *
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         kyo jin lee            최초 생성
 * </pre>
 */

public interface SalesOpptProcessMgmtOutBoundService {

    /**
     * 판매기회프로세스 관리 정보를 수정한다.
     * 사용 : 판매기회 업데이트, 예판취소, 계약취소
     * @param SalesOpptProcessMgmtVO - 수정할 정보가 담긴 SalesOpptProcessMgmtVO
     * @return 수정된 목록수
     */
    public int updateSalesOpptProcessMgmt(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception;

    /**
     * 계약에서 인도완료 후 인도취소 시 판매기회 정보 수정
     * 사용 : 인도취소
     * @param SalesOpptProcessMgmtVO - 수정할 정보가 담긴 SalesOpptProcessMgmtVO
     * @return SalesOpptProcessMgmtVO
     */
    public SalesOpptProcessMgmtVO updateSalesOpptProcessMgmtCancelDelivery(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception;

    /**
     * 내방 고객 수 (내방건수)
     * @param ShowRoomMgmtSearchVO - 수정할 정보가 담긴 SalesOpptProcessMgmtVO
     * @return 수정된 목록수
     */
    public int selectShowRoomVisitCnt (ShowRoomMgmtSearchVO showRoomMgmtSearchVO) throws Exception;

    /**
     * 판매기회 건수 (리드입력 건수)
     * @param SalesOpptProcessMgmtSearchVO - 수정할 정보가 담긴 SalesOpptProcessMgmtVO
     * @return 수정된 목록수
     */
    public int selectSalesOpptProcessMgmtsByConditionStatsCnt (SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO) throws Exception;

    /**
     * 회전기록 남기기
     * @param SalesOpptProcessMgmtVO
     * @return int
     */
    public int updateSalesOpptProcessAndInsertHist(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception;

    /**
     * 판매기회 업데이트
     * @param SalesOpptProcessMgmtVO
     * @return int
     */
    public int updateSalesOpptFromOutService(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception;

}
