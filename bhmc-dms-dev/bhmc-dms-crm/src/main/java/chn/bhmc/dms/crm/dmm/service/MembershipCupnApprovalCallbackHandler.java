package chn.bhmc.dms.crm.dmm.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler;
import chn.bhmc.dms.cmm.apr.vo.SignVO;

/**
 * <pre>
 * 멤버십 쿠폰 결재승인 콜백 핸들러
 * </pre>
 *
 * @ClassName   : MembershipCupnApprovalCallbackHandler.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Hyun Ho Kim
 * @since 2016. 7. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 19.     Hyun Ho Kim     최초 생성
 * </pre>
 */

public class MembershipCupnApprovalCallbackHandler implements ApprovalCallbackHandler {

    Logger log = LoggerFactory.getLogger(MembershipCupnApprovalCallbackHandler.class);

    /*
     * @see chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler#isSupport(java.lang.String)
     */
    @Override
    public boolean isSupport(String signDocId) {
        //TODO[김현호] 멤버십 포인트 결재승인 콜백 핸들러 지원여부 추후 수정 필요
//        if(signDocId.equals("DOC-0001")) return true;
//        return false;
        return true;
    }

    /*
     * @see chn.bhmc.dms.cmm.apr.service.ApprovalCallbackHandler#callback(chn.bhmc.dms.cmm.apr.vo.SignLineVO)
     */
    @Override
    public void callback(SignVO signVO) throws Exception {
        log.debug("MembershipPointApprovalCallbackHandler callback");
        log.debug("최종결재여부 : {}, 결재진행상태 : {}"
                , new String[]{
                        signVO.getSignLine().getLastSignYn()
                        ,signVO.getSignStatCd()});
    }

}
