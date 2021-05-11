package chn.bhmc.dms.mis.tds.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepCuViewVO.java
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

public class TargetDcptStepCuViewVO extends SearchResult{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2819178338014222966L;

    private List<?> firstColumnList = null;

    /**
     * @return the firstColumnList
     */
    public List<?> getFirstColumnList() {
        return firstColumnList;
    }

    /**
     * @param firstColumnList the firstColumnList to set
     */
    public void setFirstColumnList(List<?> firstColumnList) {
        this.firstColumnList = firstColumnList;
    }

    private List<?> secondColumnList = null;

    /**
     * @return the secondColumnList
     */
    public List<?> getSecondColumnList() {
        return secondColumnList;
    }

    /**
     * @param secondColumnList the secondColumnList to set
     */
    public void setSecondColumnList(List<?> secondColumnList) {
        this.secondColumnList = secondColumnList;
    }

    private List<?> thirdColumnList = null;

    /**
     * @return the thirdColumnList
     */
    public List<?> getThirdColumnList() {
        return thirdColumnList;
    }

    /**
     * @param thirdColumnList the thirdColumnList to set
     */
    public void setThirdColumnList(List<?> thirdColumnList) {
        this.thirdColumnList = thirdColumnList;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}

