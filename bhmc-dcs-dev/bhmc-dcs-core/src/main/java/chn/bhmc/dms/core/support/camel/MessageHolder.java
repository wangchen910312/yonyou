package chn.bhmc.dms.core.support.camel;

import java.util.List;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MessageHolder.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.     Kang Seok Han     최초 생성
 * </pre>
 */

public class MessageHolder<T> {

    List<T> results;

    /**
     * @return the results
     */
    public List<T> getResults() {
        return results;
    }

    /**
     * @param results the results to set
     */
    public void setResults(List<T> results) {
        this.results = results;
    }


}
