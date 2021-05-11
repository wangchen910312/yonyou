package chn.bhmc.dms.inf.sal.vo;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VinNoCheckVO
 * @Description : Vin No Check VO
 * @author Choi Kyung Yong
 * @since 2017. 03. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since             author              description
 *  =============    ===============    ======================
 *  2017. 03. 19.    Choi Kyung Yong           최초 생성
 * </pre>
 */

public class VinCheckResultVO{

    private String vinNo; //vinNo

    private String vinExistYn; //vinExistYn

    private String dlrCd; //dlrCd

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the vinExistYn
     */
    public String getVinExistYn() {
        return vinExistYn;
    }

    /**
     * @param vinExistYn the vinExistYn to set
     */
    public void setVinExistYn(String vinExistYn) {
        this.vinExistYn = vinExistYn;
    }

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

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "VinCheckResultVO [vinNo=" + vinNo + ", vinExistYn=" + vinExistYn + ", dlrCd=" + dlrCd + "]";
    }

}
