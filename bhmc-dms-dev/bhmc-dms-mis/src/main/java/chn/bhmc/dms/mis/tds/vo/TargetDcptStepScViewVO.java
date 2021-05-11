package chn.bhmc.dms.mis.tds.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepScViewVO.java
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

public class TargetDcptStepScViewVO extends SearchResult{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2819178338014222966L;

    private List<?> carDcptColumnList = null;

    /**
     * @return the carDcptColumnList
     */
    public List<?> getCarDcptColumnList() {
        return carDcptColumnList;
    }

    /**
     * @param carDcptColumnList the carDcptColumnList to set
     */
    public void setCarDcptColumnList(List<?> carDcptColumnList) {
        this.carDcptColumnList = carDcptColumnList;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
