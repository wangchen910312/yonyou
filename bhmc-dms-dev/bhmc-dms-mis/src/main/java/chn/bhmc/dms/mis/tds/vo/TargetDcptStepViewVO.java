package chn.bhmc.dms.mis.tds.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepViewVO.java
 * @Description : 목표 분해 공구
 * @author chibeom.song
 * @since 2016. 9. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetDcptStepViewVO extends SearchResult{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2819178338014222966L;

    private List<?> manuColumnList = null;

    /**
     * @return the manuColumnList
     */
    public List<?> getManuColumnList() {
        return manuColumnList;
    }

    /**
     * @param manuColumnList the manuColumnList to set
     */
    public void setManuColumnList(List<?> manuColumnList) {
        this.manuColumnList = manuColumnList;
    }

    private List<?> dealerColumnList = null;

    /**
     * @return the dealerColumnList
     */
    public List<?> getDealerColumnList() {
        return dealerColumnList;
    }

    /**
     * @param dealerColumnList the dealerColumnList to set
     */
    public void setDealerColumnList(List<?> dealerColumnList) {
        this.dealerColumnList = dealerColumnList;
    }

}
