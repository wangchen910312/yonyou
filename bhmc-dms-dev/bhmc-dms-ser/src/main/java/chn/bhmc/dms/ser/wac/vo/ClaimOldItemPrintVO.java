package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.*;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimOldItemPrintVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author JUNG HAEGUN
 * @since 2018. 6. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 6. 15.     JUNG HAEGUN     최초 생성
 * </pre>
 */

public class ClaimOldItemPrintVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1917334160741566065L;

    private String dlrCd;

    private String itemCd;

    private String claimNo;

    private String distNo;

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
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemNo to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the claimNo
     */
    public String getClaimNo() {
        return claimNo;
    }

    /**
     * @param claimNo the claimNo to set
     */
    public void setClaimNo(String claimNo) {
        this.claimNo = claimNo;
    }

    /**
     * @param distNo the distNo to set
     */
    public void setDistNo(String distNo) {
        this.distNo = distNo;
    }

    /**
     * @return the distNo
     */
    public String getDistNo() {
        return distNo;
    }
}
