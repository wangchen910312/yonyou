package chn.bhmc.dms.ws.exception;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WebServiceException.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 7. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 27.     Kang Seok Han     최초 생성
 * </pre>
 */

public class WebServiceException extends Exception {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5408211217144686368L;

    public WebServiceException(String message){
        super(message);
    }

}
