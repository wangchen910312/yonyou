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

public class VinCheckSearchVO{

    private String vinNo; //vinNo

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

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "VinNoCheckVO [vinNo=" + vinNo + "]";
    }
}
