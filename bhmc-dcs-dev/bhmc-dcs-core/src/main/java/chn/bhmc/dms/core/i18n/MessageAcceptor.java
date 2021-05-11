package chn.bhmc.dms.core.i18n;

import java.util.List;

/**
 * <pre>
 * Interface for instances that are able to accept a {@link List} of {@link Messages} for a given basename This is used
 * by {@link Importer} to import {@link Messages} from an {@link MessageProvider} to a {@link MessageAcceptor}.
 * </pre>
 *
 * @ClassName   : MessageAcceptor.java
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

public interface MessageAcceptor {
    /**
     * Set the {@link Messages} for the given basename.
     *
     * @param basename the basename
     * @param messages the messages
     */
    void setMessages(String basename, Messages messages);
}
