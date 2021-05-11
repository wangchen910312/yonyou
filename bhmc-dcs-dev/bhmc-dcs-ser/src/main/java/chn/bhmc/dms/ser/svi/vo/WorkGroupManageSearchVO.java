package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkGroupManageSearchVO.java
 * @Description : WorkGroupManageSearchVO
 * @author KyungMok Kim
 * @since 2016. 1. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.    KyungMok Kim     최초 생성
 * </pre>
 */

public class WorkGroupManageSearchVO extends SearchVO {

	private static final long serialVersionUID = -6579755691883848482L;

	private String sDlrCd;         // 딜러코드
	private String sWkgrpNo;       // 소조번호
	private String sMngSaNm;       // 소조관리인


    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }
    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
    /**
     * @return the sWkgrpNo
     */
    public String getsWkgrpNo() {
        return sWkgrpNo;
    }
    /**
     * @param sWkgrpNo the sWkgrpNo to set
     */
    public void setsWkgrpNo(String sWkgrpNo) {
        this.sWkgrpNo = sWkgrpNo;
    }
    /**
     * @return the sMngSaNm
     */
    public String getsMngSaNm() {
        return sMngSaNm;
    }
    /**
     * @param sMngSaNm the sMngSaNm to set
     */
    public void setsMngSaNm(String sMngSaNm) {
        this.sMngSaNm = sMngSaNm;
    }

}
