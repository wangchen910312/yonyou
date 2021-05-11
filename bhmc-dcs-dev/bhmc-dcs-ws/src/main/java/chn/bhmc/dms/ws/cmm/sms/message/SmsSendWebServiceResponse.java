package chn.bhmc.dms.ws.cmm.sms.message;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.ws.cmm.sms.vo.SmsSendWebServiceResponseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SampleWebServiceVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Choi Kyung Yong
 * @since 2017. 2. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 25.    Choi Kyung Yong          최초 생성
 * </pre>
 */

public class SmsSendWebServiceResponse {

    private List<SmsSendWebServiceResponseVO> arrSmsSendWebServiceResponseVO = new ArrayList<SmsSendWebServiceResponseVO>();

    /**
     * @return the SmsSendWebServiceResponseVO
     */
    public List<SmsSendWebServiceResponseVO> getArrSmsSendWebServiceResponse() {
        return arrSmsSendWebServiceResponseVO;
    }

    /**
     * @param setArrSmsSendWebServiceResponse the setArrSmsSendWebServiceResponse to set
     */
    public void setArrSmsSendWebServiceResponse(List<SmsSendWebServiceResponseVO> arrSmsSendWebServiceResponseVO) {
        this.arrSmsSendWebServiceResponseVO = arrSmsSendWebServiceResponseVO;
    }
}
