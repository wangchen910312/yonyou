package chn.bhmc.dms.core.support.camel;

import java.io.IOException;

import org.apache.http.NoHttpResponseException;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.protocol.HttpContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CamelClientHttpRequestRetryHandler.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 8.     Kang Seok Han     최초 생성
 * </pre>
 */

public class CamelClientHttpRequestRetryHandler implements HttpRequestRetryHandler {

    public static final Logger log = LoggerFactory.getLogger(CamelClientHttpRequestRetryHandler.class);

    @Override
    public boolean retryRequest(IOException exception, int executionCount, HttpContext context) {

        log.error("[CamelClient Request Error]");
        log.error("exception :" + exception.getMessage());
        log.error("executionCount :" + executionCount);

        if(executionCount >= 3){
            return false;
        }

        if(exception instanceof NoHttpResponseException){
            return true;
        }

        return false;
    }

}
