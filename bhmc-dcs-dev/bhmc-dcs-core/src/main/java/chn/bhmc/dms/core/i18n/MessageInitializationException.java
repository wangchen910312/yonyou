package chn.bhmc.dms.core.i18n;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MessageInitalizationException.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.     Kang Seok Han     최초 생성
 * </pre>
 */

public class MessageInitializationException  extends RuntimeException {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5739433098811141690L;

    public MessageInitializationException(String message, RuntimeException e) {
        super(message, e);
    }
}
