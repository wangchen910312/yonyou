package chn.bhmc.dms.bat.mis.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * @ClassName   : BatSysOwnerDlrVO
 * @Description :
 * @author Lee Seungmin
 * @since 2017. 05. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 05. 29.    Lee Seungmin            최초 생성
 */

public class BatchSystemDlrVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4965735305122571272L;

    private String dlrCd;

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}