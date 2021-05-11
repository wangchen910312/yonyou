package chn.bhmc.dms.cmm.apr.service;

import chn.bhmc.dms.cmm.apr.vo.SignVO;

/**
 * <pre>
 * 결제처리 콜백 핸들러
 * </pre>
 *
 * @ClassName   : ApprovalCallbackHandler.java
 * @Description : 결재처리 콜백 핸들러
 * @author Kang Seok Han
 * @since 2016. 7. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 4.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface ApprovalCallbackHandler {

    /**
     * 결재양식 ID에 해당하는 결제처리 콜백 수행 가능 여부를 체크한다.
     *
     * @param signDocId 결재양식 ID
     * @return 주어진 결재양식 ID에 해당하는 결재처리 콜백 수행이 가능하다면 true 그렇지 않다면 false를 반환한다.
     */
    public boolean isSupport(String signDocId);

    /**
     * 결재진행 단계 마다 호출 된다.
     *
     * 결재진행상태[signStatCd]
     * 01 : 대기
     * 02 : 진행
     * 03 : 완료
     *
     * 결재처리코드[signRsltCd]
     * 01 : 미결
     * 02 : 반려
     * 03 : 합의
     * 04 : 결재
     *
     * 최종결재여부[lastSignYn]
     * Y : 최종결재
     * N : 최종결재아님
     *
     * @param signLineVO 결재
     * @throws Exception
     */
    public void callback(SignVO signVO) throws Exception;
}
