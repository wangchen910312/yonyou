package chn.bhmc.dms.cmm.apr.service;

import java.util.ArrayList;
import java.util.List;

/**
 * <pre>
 * 결재승인 콜백 리졸버
 * </pre>
 *
 * @ClassName   : ApprovalCallbackResolver.java
 * @Description : 클래스 설명을 기술합니다.
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

public class ApprovalCallbackResolver {

    private List<ApprovalCallbackHandler> handlers = new ArrayList<ApprovalCallbackHandler>();

    /**
     * @return the handlers
     */
    public List<ApprovalCallbackHandler> getHandlers() {
        return handlers;
    }

    /**
     * @param handlers the handlers to set
     */
    public void setHandlers(List<ApprovalCallbackHandler> handlers) {
        this.handlers = handlers;
    }

    /**
     * 결재양식 ID에 해당하는 콜백 핸들러 목록을 반환한다.
     * @param signDocId 결재양식 ID
     * @return
     */
    public List<ApprovalCallbackHandler> resolve(String signDocId){

        List<ApprovalCallbackHandler> list = new ArrayList<ApprovalCallbackHandler>();

        for(ApprovalCallbackHandler handler : handlers) {
            if(handler.isSupport(signDocId)){
                list.add(handler);
            }
        }

        return list;

    }

}
