package chn.bhmc.dms.sal.stm.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchResult;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StrOrdOcnBlockingViewVO
 * @Description : 전략오더OCN블러킹 view VO
 * @author Kim Jin Suk
 * @since 2016. 8. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 7. 26.    Kim Jin Suk           최초 생성
 * </pre>
 */

public class StrOrdOcnBlockingViewVO extends SearchResult{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2819178338014222966L;

    private List<?> columnList = null;

    /**
     * @return the columnList
     */
    public List<?> getColumnList() {
        return columnList;
    }

    /**
     * @param columnList the columnList to set
     */
    public void setColumnList(List<?> columnList) {
        this.columnList = columnList;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
