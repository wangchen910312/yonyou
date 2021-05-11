package chn.bhmc.dms.core.datatype;

import java.io.Serializable;
import java.util.List;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SearchResult.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 5.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SearchResult implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = -8915559876746841312L;

    private long total = 0;
    private List<?> data = null;


    public long getTotal() {
        return total;
    }
    public void setTotal(long total) {
        this.total = total;
    }
    public List<?> getData() {
        return data;
    }
    public void setData(List<?> data) {
        this.data = data;
    }
}
