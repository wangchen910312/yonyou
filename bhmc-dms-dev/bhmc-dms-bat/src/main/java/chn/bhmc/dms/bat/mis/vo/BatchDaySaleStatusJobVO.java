package chn.bhmc.dms.bat.mis.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * [BatchJob] 판매현황(MS_1001T_2016)
 * </pre>
 *
 * @ClassName   : BatchDaySaleStatusJobVO.java
 * @Description : [BatchJob] 판매현황(MS_1001T_2016)
 * @author chibeom.song
 * @since 2016. 9. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 25.   chibeom.song     최초 생성
 * </pre>
 */

public class BatchDaySaleStatusJobVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 18968098715188553L;

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
