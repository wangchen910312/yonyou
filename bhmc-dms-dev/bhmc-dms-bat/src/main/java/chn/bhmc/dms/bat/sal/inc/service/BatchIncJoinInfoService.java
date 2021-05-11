package chn.bhmc.dms.bat.sal.inc.service;

import chn.bhmc.dms.bat.sal.inc.vo.BatSysOwnerDlrVO;

/**
 * 보험 고객 추적 알림
 *
 * @author Kim Jin Suk
 * @since 2016.06.21
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.06.21         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface BatchIncJoinInfoService {

    // 보험 고객추적 알림
    public void callIncJoinProcess() throws Exception;

    // 보험 만료 알림
    public void callIncJoinExpire() throws Exception;

    // 딜러정보 조회
    public BatSysOwnerDlrVO selectOnlyDlrInfosearch() throws Exception;
}
