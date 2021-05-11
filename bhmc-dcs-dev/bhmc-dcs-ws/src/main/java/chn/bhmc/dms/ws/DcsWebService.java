package chn.bhmc.dms.ws;

import javax.jws.WebParam;
import javax.jws.WebService;

import chn.bhmc.dms.ws.cmm.sms.message.SmsSendWebServiceRequest;
import chn.bhmc.dms.ws.cmm.sms.message.SmsSendWebServiceResponse;
import chn.bhmc.dms.ws.sal.bdw.SalBasicDataWsDoc;





/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SampleWebService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 1. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 23.     Kang Seok Han     최초 생성
 * </pre>
 */
@WebService(
        name="DcsWebService"
        ,targetNamespace="http://www.bhmc.com.cn/schema/dcs-webservice")
public interface DcsWebService {
	/**
	 * SMS발송 금지단어 검증요청
	 * @param smsSendWebServiceRequest
	 * @return
	 */
    public SmsSendWebServiceResponse smsSendRequest(@WebParam(name="smsSendWebServiceRequest") SmsSendWebServiceRequest smsSendWebServiceRequest);

    /**
     * 판매 기초데이터 인터페이스
     * @param salBasicDataWsDoc
     * @return
     */
    public SalBasicDataWsDoc salBasicDataRequest(@WebParam(name="salBasicDataRequest") SalBasicDataWsDoc salBasicDataWsDoc);
}
