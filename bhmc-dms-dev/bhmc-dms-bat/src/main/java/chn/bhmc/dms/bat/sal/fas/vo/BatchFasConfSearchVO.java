package chn.bhmc.dms.bat.sal.fas.vo;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * @ClassName   : BatchFasConfInfoVO
 * @Description : 강제출고심사완료알림
 * @author Lee Seungmin
 * @since 2017. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 16.    Lee Seungmin            최초 생성
 */

public class BatchFasConfSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8267165006973218334L;

    private String sSrchType;

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the sSrchType
     */
    public String getsSrchType() {
        return sSrchType;
    }

    /**
     * @param sSrchType the sSrchType to set
     */
    public void setsSrchType(String sSrchType) {
        this.sSrchType = sSrchType;
    }


}
