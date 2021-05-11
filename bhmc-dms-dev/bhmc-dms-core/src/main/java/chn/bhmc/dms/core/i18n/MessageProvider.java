package chn.bhmc.dms.core.i18n;

import java.util.Collection;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MessageProvider.java
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

public interface MessageProvider {
    /**
     * Returns a {@link Messages} instance containing all the messages for a given basename.
     *
     * @param basename the basename to receive {@link Messages} for
     * @return the {@link Messages} of that basename
     */
    Messages getMessages(String basename);

    /**
     * Returns a {@link Messages} instance containing all the messages for a given filenameProperties.
     *
     * @param filenameProperties the filenameProperties to receive {@link Messages} for
     * @return the {@link Messages} of that filenameProperties
     */
    Messages getMessages(FilenameProperties filenameProperties);


    /**
     * Returns a {@link Collection} of basenames that can be used for {@link #getMessages(String)}.
     *
     * @return all available basenames
     */
    Collection<String> getAvailableBaseNames();

    /**
     * Returns last update timestamp for a given basename.
     *
     * @param basename
     * @return
     */
    long getLastUpdateTimeStamp(String basename);

    /**
     * Returns last update timestamp for a given filenameProperties.
     *
     * @param filenameProperties
     * @return
     */
    long getLastUpdateTimeStamp(FilenameProperties filenameProperties);
}
