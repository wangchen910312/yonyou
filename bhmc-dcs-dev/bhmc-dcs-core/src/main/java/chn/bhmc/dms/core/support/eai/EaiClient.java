package chn.bhmc.dms.core.support.eai;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ws.WebServiceException;
import org.springframework.ws.client.core.support.WebServiceGatewaySupport;

import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EaiClient.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 15.     Kang Seok Han     최초 생성
 * </pre>`
 */

public class EaiClient extends WebServiceGatewaySupport  {
    public static final Logger monitorLogger = LoggerFactory.getLogger("chn.bhmc.dms.inf.log.monitor");

    public CommDMSDoc sendRequest(CommDMSDoc request) {

        CommDMSDoc response = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

        String rootContextId = request.getHeader().getROOTCONTEXTID().getValue();
        String contextId = "1";
        String interfaceId = request.getHeader().getIFID();
        String sender = request.getHeader().getSENDER();
        String receiver = request.getHeader().getRECEIVER();
        String start = sdf.format(new Date());

        writeMoniterLog(rootContextId, "START", contextId, interfaceId, sender, receiver, "", start, "", "");

        try{
            response = (CommDMSDoc)getWebServiceTemplate().marshalSendAndReceive(request);
            writeMoniterLog(rootContextId, "End", contextId, interfaceId, sender, receiver, "SUCCESS", start, sdf.format(new Date()), "");

            return response;
        }catch(WebServiceException e){
            writeMoniterLog(rootContextId, "End", contextId, interfaceId, sender, receiver, "FAIL", start, sdf.format(new Date()), e.getMessage());
            throw e;
        }
    }

    private void writeMoniterLog(String rootContextId, String logFlag, String contextId, String interfaceId, String sender, String receiver, String status, String start, String end, String exception){
        monitorLogger.info(
                String.format(
                    "[RootContextId=%s] [LogFlag=%s] [ContextID=%s] [InterfaceId=%s] [Sender=%s] [Receiver=%s] [Status=%s] [Start=%s] [End=%s] [UserData=%s] [Exception=%s]"
                    ,rootContextId
                    ,logFlag
                    ,contextId
                    ,interfaceId
                    ,sender
                    ,receiver
                    ,status
                    ,start
                    ,end
                    ,""
                    ,exception
                )
            );

    }
}
